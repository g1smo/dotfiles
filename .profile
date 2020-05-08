# <3 default editor
export EDITOR="vim"
export VISUAL="vim"

# Default term (i3)
export TERMINAL="termite"
#export TERM="xterm-256color"

# Chrome scaling
export CHROMIUM_FLAGS="--force-device-scale-factor=1.75"

# QT5 autoscaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Flatpak
export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share/applications:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"

# Nek Java fix?
export NLS_LANG=American_America.UTF8

# Guile Zadeve
export GUILE_WARN_DEPRECATED="detailed"

# PhantomJS binary location
export PHANTOMJS_BIN=/usr/bin/phantomjs

# Racket pot
export PATH="$HOME/.racket/7.2/bin:$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$PATH"
export GUIX_PROFILE_FILE="$GUIX_PROFILE/etc/profile"

# Racket scaling
export PLT_DISPLAY_BACKING_SCALE=2

# emacspeak speech server
export DTK_PROGRAM=espeak

# Pot do GO zadev (knjiznice, ...)
export GOPATH=~/Sredstva/go

# Android SDK && React Native build settings
#export ANDROID_HOME=$HOME/Android/Sdk
#export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
#export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# User bin
export PATH="/home/g1smo/bin:$PATH"

# Loadamo sway na tty5!
# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty5" ]; then
	exec sway
fi
