# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Add my custom path
export PATH="/home/rain/.local/bin:$PATH"

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
