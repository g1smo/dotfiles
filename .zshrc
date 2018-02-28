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
export PATH="/home/g1smo/bin:$PATH:/home/g1smo/.gem/ruby/2.5.0/bin:$GOPATH/bin"

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
alias sudo="sudo "
alias grep="grep --color=auto"
# Remove not-required-anymore packages
alias paclean="sudo pacman -R \$(pacman -Qdt | awk '{print \$1}')"
# List packages by size
alias pacsize="expac -H M '%m\t%n' | sort -h"
alias ffon="sudo cp /etc/resolv.conf.ff /etc/resolv.conf"
alias gitclean="git fetch -p && for branch in \$(git branch -vv | grep ': gone]' | gawk '{print \$1}'); do git branch -D \$branch; echo 'deleted \$branch'; done"
alias sctl="systemctl"

# Firefox scaling!
alias sf="find ~/.mozilla/firefox -name \"prefs.js\" -exec sed -ri 's/(devPixelsPerPx\\\", \\\")[0-9\\.]+/\\11\.00/' {} + ; firefox"
# regular firefox
alias ff="find ~/.mozilla/firefox -name \"prefs.js\" -exec sed -ri 's/(devPixelsPerPx\\\", \\\")[0-9\\.]+/\\11\.75/' {} + ; firefox"

# Reverse search shortcut
bindkey '^R' history-incremental-pattern-search-backward

export SCALA_HOME="/usr/share/scala"
export SAL_USE_VCLPLUGIN="gtk"

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

# Najvecji fajli
alias najvecji="find . -printf '%s %p\n'| sort -nr | head -30"

# PhantomJS binary location
export PHANTOMJS_BIN=/usr/bin/phantomjs

# Guile things
export GUILE_WARN_DEPRECATED="detailed"

# Guix things
export GUILE_LOAD_PATH=$HOME/.guix-profile/share/guile/site/2.2:$GUILE_LOAD_PATH
export GUILE_LOAD_COMPILED_PATH=$HOME/.guix-profile/lib/guile/2.2/site-ccache:$GUILE_LOAD_COMPILED_PATH



# Java fix?
export NLS_LANG=American_America.UTF8

# emacspeak speech server
export DTK_PROGRAM=espeak

# Android SDK && React Native build settings
export ANDROID_HOME=/home/g1smo/Android/Sdk
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Guix!
export GUIX_PROFILE="$HOME/.guix-profile"
export GUIX_PROFILE_FILE="$HOME/.guix-profile/etc/profile"
[ -e $GUIX_PROFILE_FILE ] && source $GUIX_PROFILE_FILE
export GUIX_PACKAGE_PATH="$HOME/Projects/guix-packages"
export GUIX_LOCPATH="$GUIX_PROFILE/lib/locale"
#export SSL_CERT_DIR="$GUIX_PROFILE/etc/ssl/certs"
#export SSL_CERT_FILE="$SSL_CERT_DIR/ca-certificates.crt"
#export GIT_SSL_CAINFO="$SSL_CERT_FILE"
#export CURL_CA_BUNDLE="$SSL_CERT_FILE"
