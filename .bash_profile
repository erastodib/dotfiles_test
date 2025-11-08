# .bash_profile

# Source .bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Auto-start Hyprland when on tty1
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    clear
    echo "<rain>: Launching Hyprland..."
    Hyprland || {
        echo "<rain>: Hyprland exited with code $? — press any key to retry or Ctrl+C to quit."
        read -n 1
        exec $SHELL
    }
fi
