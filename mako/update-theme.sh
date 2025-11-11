#!/bin/bash
# ~/.config/mako/update-theme.sh
# Sync Mako colors with your Matugen/Hyprland palette

COLORS_FILE="$HOME/.config/hypr/colors.conf"

# Helper to extract colors like: $background = rgba(121318ff)
get_color() {
    grep -E "^\$${1}\s*=" "$COLORS_FILE" | head -n 1 | sed -E 's/.*rgba\(([^)]+)\).*/\1/' 
}

BG=$(get_color "background")
FG=$(get_color "on_surface")
ACCENT=$(get_color "primary")

# Fallback colors (in case something is missing)
[ -z "$BG" ] && BG="121318ff"
[ -z "$FG" ] && FG="ffffffff"
[ -z "$ACCENT" ] && ACCENT="89b4faff"

echo "🎨 Updating Mako theme..."
echo "Background: $BG"
echo "Foreground: $FG"
echo "Accent: $ACCENT"

# Write the config
cat <<EOF > ~/.config/mako/config
# ~/.config/mako/config (auto-generated)

default-timeout=3000
background-color=#${BG}
text-color=#${FG}
border-color=#${ACCENT}
border-size=2
border-radius=8
padding=10
margin=15
font=SF Pro Display 11
anchor=top-right
width=300
max-visible=3
EOF

# Restart mako cleanly
pkill mako 2>/dev/null
mako & disown
echo "✅ Mako updated and restarted!"
