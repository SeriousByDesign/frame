#!/bin/bash

set -e

REPO="SeriousByDesign/frame"
REMOTE=0
TMPDIR_WORK=""

FORCE=0
CARTRIDGE_ONLY=""
VERSION=""
for arg in "$@"; do
  case "$arg" in
    --force) FORCE=1 ;;
    --version=*) VERSION="${arg#--version=}" ;;
    -*) ;;
    *) CARTRIDGE_ONLY="$arg" ;;
  esac
done

echo "FRAME installer"
echo ""

# --- Remote mode: download release tarball if not running from repo root ---

if [ ! -f "engine/frame.md" ]; then
  REMOTE=1

  if command -v curl >/dev/null 2>&1; then
    FETCH="curl -fsSL"
  elif command -v wget >/dev/null 2>&1; then
    FETCH="wget -qO-"
  else
    echo "Error: curl or wget is required for remote installation."
    exit 1
  fi

  if [ -z "$VERSION" ]; then
    echo "Fetching latest release..."
    VERSION=$($FETCH "https://api.github.com/repos/$REPO/releases/latest" \
      | grep '"tag_name"' \
      | sed 's/.*"tag_name": *"\([^"]*\)".*/\1/')
    if [ -z "$VERSION" ]; then
      echo "Error: could not determine latest release version."
      exit 1
    fi
  fi

  echo "Installing FRAME $VERSION"
  echo ""

  TMPDIR_WORK=$(mktemp -d /tmp/frame-install-XXXXXX)
  trap 'rm -rf "$TMPDIR_WORK"' EXIT

  TARBALL_URL="https://github.com/$REPO/archive/refs/tags/$VERSION.tar.gz"
  echo "Downloading $TARBALL_URL..."
  $FETCH "$TARBALL_URL" | tar -xz -C "$TMPDIR_WORK" --strip-components=1

  cd "$TMPDIR_WORK"
fi

# --- Install logic (local or extracted remote) ---

ENGINE_SRC="engine/frame.md"
ENGINE_DEST="$HOME/.claude/commands/frame.md"
CARTRIDGES_SRC="cartridges"
CARTRIDGES_DEST="$HOME/.frame/cartridges"

# Engine — skip if installing a single cartridge
if [ -z "$CARTRIDGE_ONLY" ]; then
  if [ ! -f "$ENGINE_SRC" ]; then
    echo "Error: $ENGINE_SRC not found."
    exit 1
  fi

  mkdir -p "$(dirname "$ENGINE_DEST")"

  if [ -f "$ENGINE_DEST" ] && [ $FORCE -eq 0 ]; then
    echo "Existing engine found at $ENGINE_DEST"
    read -r -p "Overwrite? (y / s=skip): " choice < /dev/tty
    case "$choice" in
      y|Y) ;;
      *) echo "Skipping engine."; ENGINE_SRC="" ;;
    esac
  fi

  if [ -n "$ENGINE_SRC" ]; then
    cp "$ENGINE_SRC" "$ENGINE_DEST"
    echo "Engine installed → $ENGINE_DEST"
  fi

  echo ""
fi

# Cartridges
mkdir -p "$CARTRIDGES_DEST"

if [ -n "$CARTRIDGE_ONLY" ]; then
  cartridge="$CARTRIDGES_SRC/$CARTRIDGE_ONLY/"
  if [ ! -d "$cartridge" ]; then
    echo "Error: cartridge '$CARTRIDGE_ONLY' not found."
    exit 1
  fi
  dest="$CARTRIDGES_DEST/$CARTRIDGE_ONLY"
  if [ -d "$dest" ] && [ $FORCE -eq 0 ]; then
    echo "Existing cartridge: $CARTRIDGE_ONLY"
    read -r -p "Overwrite? (y / s=skip): " choice < /dev/tty
    case "$choice" in
      y|Y) ;;
      *) echo "Skipping $CARTRIDGE_ONLY."; echo ""; echo "Done."; exit 0 ;;
    esac
  fi
  rm -rf "$dest"
  cp -r "$cartridge" "$dest"
  echo "Cartridge installed → $dest"
  echo ""
  echo "Done."
  exit 0
fi

SKIP_ALL=0
INSTALL_ALL=0

for cartridge in "$CARTRIDGES_SRC"/*/; do
  name=$(basename "$cartridge")
  dest="$CARTRIDGES_DEST/$name"

  if [ $SKIP_ALL -eq 1 ]; then
    echo "Skipping $name."
    continue
  fi

  if [ -d "$dest" ] && [ $FORCE -eq 0 ] && [ $INSTALL_ALL -eq 0 ]; then
    echo "Existing cartridge: $name"
    read -r -p "Overwrite? (y / s=skip / a=install all / A=skip all): " choice < /dev/tty
    case "$choice" in
      y|Y) ;;
      a) INSTALL_ALL=1 ;;
      A) echo "Skipping $name."; SKIP_ALL=1; continue ;;
      *) echo "Skipping $name."; continue ;;
    esac
  fi

  rm -rf "$dest"
  cp -r "$cartridge" "$dest"
  echo "Cartridge installed → $dest"
done

echo ""
echo "Done. Start a session with: /frame load <cartridge>"
