#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
THEME_NAME=scm-saber-cursor-b8c4eb6c
THEME_SOURCE=$ROOT/$THEME_NAME
THEME_TARGET=${XDG_DATA_HOME:-$HOME/.local/share}/icons/$THEME_NAME
LEGACY_THEME_TARGET=$HOME/.icons/$THEME_NAME
if [ ! -f "$THEME_SOURCE/index.theme" ]; then
  echo "Cursor theme files are missing." >&2
  exit 1
fi
mkdir -p "$(dirname -- "$THEME_TARGET")"
rm -rf "$THEME_TARGET"
cp -R "$THEME_SOURCE" "$THEME_TARGET"
mkdir -p "$HOME/.icons"
rm -rf "$LEGACY_THEME_TARGET"
ln -s "$THEME_TARGET" "$LEGACY_THEME_TARGET" 2>/dev/null || cp -R "$THEME_SOURCE" "$LEGACY_THEME_TARGET"
SIZE=32
DESKTOP=${XDG_CURRENT_DESKTOP:-}:${DESKTOP_SESSION:-}
APPLIED=0
case "$DESKTOP" in
  *KDE*|*Plasma*|*plasma*)
    if command -v plasma-apply-cursortheme >/dev/null 2>&1 && plasma-apply-cursortheme --size "$SIZE" "$THEME_NAME"; then APPLIED=1; fi ;;
  *XFCE*|*Xfce*|*xfce*)
    if command -v xfconf-query >/dev/null 2>&1 && xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "$THEME_NAME" && xfconf-query -c xsettings -p /Gtk/CursorThemeSize -s "$SIZE"; then APPLIED=1; fi ;;
  *MATE*|*mate*)
    if command -v gsettings >/dev/null 2>&1 && gsettings set org.mate.peripherals-mouse cursor-theme "$THEME_NAME" && gsettings set org.mate.peripherals-mouse cursor-size "$SIZE"; then APPLIED=1; fi ;;
  *Cinnamon*|*cinnamon*)
    if command -v gsettings >/dev/null 2>&1 && gsettings set org.cinnamon.desktop.interface cursor-theme "$THEME_NAME" && gsettings set org.cinnamon.desktop.interface cursor-size "$SIZE"; then APPLIED=1; fi ;;
  *)
    if command -v gsettings >/dev/null 2>&1 && gsettings set org.gnome.desktop.interface cursor-theme "$THEME_NAME" && gsettings set org.gnome.desktop.interface cursor-size "$SIZE"; then APPLIED=1; fi ;;
esac
echo "Cursor theme installed: $THEME_NAME"
if [ "$APPLIED" -eq 0 ]; then echo "Theme files were installed, but this desktop environment needs manual selection in cursor settings."; fi
printf '%s\n' '
Cursor description:
Saber cursor pack (by nokia_yan)

Do not repost.

Links:
Bilibili: https://x.com/nokia_yan'
if [ -t 0 ]; then
  printf '\nPress Enter to close... '
  read -r _ || true
fi
