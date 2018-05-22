# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -v
export KEYTIMEOUT=1
zstyle :compinstall filename '/home/g1smo/.zshrc'

autoload -Uz compinit
compinit

export EDITOR="vim"
export VISUAL="vim"

# Color
autoload colors zsh/terminfo
colors
# PATH additions
export GOPATH=~/Sredstva/go
export PATH="/home/g1smo/bin:$PATH:/home/g1smo/.gem/ruby/2.4.0/bin:$GOPATH/bin"

# Default term (i3)
export TERMINAL="termite"
export TERM="xterm-256color"

# Prompt
autoload -U promptinit
promptinit
autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' formats '(%b) '
precmd () {
	vcs_info
}

setopt prompt_subst
PROMPT='%n@%m %1~ %{$fg[green]%}${vcs_info_msg_0_}%{$fg[blue]%}» %{$reset_color%}'

# Aliases
alias ls='ls --color=auto'
#alias vim='TERM=xterm-256color vim'
alias vi='vim'
alias apachelog="gnome-terminal -e \"tail -f /var/log/httpd/error_log\""
alias nvidiaoff="sudo modprobe -r nvidia_drm nvidia_modeset nvidia-uvm nvidia; sudo tee /proc/acpi/bbswitch <<<OFF"
#alias nvidiaoff="sudo tee /sys/kernel/debug/vgaswitcheroo/switch <<<OFF"
alias sudo="sudo "
alias grep="grep --color=auto"
# Remove not-required-anymore packages
alias paclean="sudo pacman -R \$(pacman -Qdt | awk '{print \$1}')"
# List packages by size
alias pacsize="expac -H M '%m\t%n' | sort -h"
alias ffon="sudo cp /etc/resolv.conf.ff /etc/resolv.conf"
alias gitclean="git fetch -p && for branch in \$(git branch -vv | grep ': gone]' | gawk '{print \$1}'); do git branch -D \$branch; echo 'deleted \$branch'; done"
#alias llc="sshfs 10.0.0.203:/Users/g1smo/Projects/LickList ~/ll -oauto_cache,reconnect,no_readahead -o Ciphers=arcfour -o Compression=no"
alias llc="sudo mount -t nfs -o noacl,nocto,rsize=32768,wsize=32768,noatime,nodiratime 10.0.0.203:/Users/g1smo/Projects/LickList ~/ll"
alias llcc="sudo mount -t nfs -o noacl,nocto,rsize=32768,wsize=32768,noatime,nodiratime 192.168.8.106:/Users/g1smo/Projects/LickList ~/ll"
alias lld="sudo umount -l ~/ll"
alias sctl="systemctl"

# Firefox scaling!
alias sf="find ~/.mozilla/firefox -name \"prefs.js\" -exec sed -ri 's/(devPixelsPerPx\\\", \\\")[0-9\\.]+/\\11\.00/' {} + ; firefox"
# regular firefox
alias ff="find ~/.mozilla/firefox -name \"prefs.js\" -exec sed -ri 's/(devPixelsPerPx\\\", \\\")[0-9\\.]+/\\11\.75/' {} + ; firefox"

# Reverse search shortcut
bindkey '^R' history-incremental-pattern-search-backward

# Xdebug
export XDEBUG_CONFIG="idekey=xdebug remote_host=localhost remote_enable=1 remote_handler=dbgp remote_host=localhost remote_port=9001"

export SCALA_HOME="/usr/share/scala"
export SAL_USE_VCLPLUGIN="gtk"
export PHP_INI_SCAN_DIR="/etc/php56/conf.d/"

# NVM
#export NVM_DIR="/home/g1smo/.nvm"
#[ -e /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh
alias invm=". /usr/share/nvm/init-nvm.sh"
alias sc="chromium --force-device-scale-factor=1"
alias emacs-live="HOME=~/Sredstva/emacs-live emacs"
alias offer-files="sudo python3 -m http.server 811"
# X on wayland
alias wxon="xhost +local:"

# RŠ aliasi
alias omnom="ssh root@debeli"

# Dolzina mp3 fajlov
alias mp3len="for i in \$(ls *.mp3); do echo \$i; soxi -d \$i; done"

# Hiter ping za net preverit
alias pg="ping 8.8.8.8"

# PhantomJS binary location
export PHANTOMJS_BIN=/usr/bin/phantomjs

# Guile things
export GUILE_WARN_DEPRECATED="detailed"
#export GUILE_LOAD_PATH=$HOME/.guix-profile/share/guile/site/2.2:$GUILE_LOAD_PATH
#export GUILE_LOAD_COMPILED_PATH=$HOME/.guix-profile/lib/guile/2.2/site-ccache:$GUILE_LOAD_COMPILED_PATH



# Java fix?
export NLS_LANG=American_America.UTF8

# emacspeak speech server
export DTK_PROGRAM=espeak

# Android SDK && React Native build settings
export ANDROID_HOME=/home/g1smo/Android/Sdk
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

