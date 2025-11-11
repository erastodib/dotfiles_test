#!/bin/bash
# Sync Mako colors from Matugen's Hyprland color file

colors_file="$HOME/.config/hypr/colors.conf"

# Extract colors
background=$(grep -m1 'background' "$colors_file" | awk '{print $3}' | sed 's/rgba(//;s/)//')
on_background=$(grep -m1 'on_background' "$colors_file" | awk '{print $3}' | sed 's/rgba(//;s/)//')
primary=$(grep -m1 'primary' "$colors_file" | awk '{print $3}' | sed 's/rgba(//;s/)//')

# Convert to #hex format
background="#${background}"
on_background="#${on_background}"
primary="#${primary}"

# Write Mako config
cat > "$HOME/.config/mako/config" <<EOF
background-color=${background}
text-color=${on_background}
border-color=${primary}
max-visible=3
width=300
height=100
margin=10
padding=15
border-size=2
default-timeout=5000
font=SF Pro Display 10
EOF

# Restart Mako
pkill mako
mako &
notify-send "Mako synced!" "Colors imported from Matugen 🎨"
