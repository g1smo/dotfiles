# Zgodovina ukazov
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

# Vi zadeve, se mi zdi
bindkey -v
export KEYTIMEOUT=1
zstyle :compinstall filename '/home/g1smo/.zshrc'

autoload -Uz compinit
compinit

# Barve
autoload colors zsh/terminfo
colors

# BARVE!
export GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

function _colorman() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;35m") \
    LESS_TERMCAP_md=$(printf "\e[1;34m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[7;40m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;33m") \
      "$@"
}
function man() { _colorman man "$@"; }
function perldoc() { command perldoc -n less "$@" |man -l -; }

# Prompt za git
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

# Reverse search shortcut
bindkey '^R' history-incremental-pattern-search-backward


# Splosno barvanje zadev
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# CCCAMP 2019 fahrplan
#camp() {
#  curl -s https://fahrplan.events.ccc.de/camp/2019/Fahrplan/schedule.json \
#    | jq -r '.schedule.conference.days | .[] | select(.date=="'$(date +%F)'") | .rooms | .[] | .[] | select(.date|strptime("%Y-%m-%dT%H:%M:%S%z") > now) | "\(.start) \(.duration)|\(.room)|\(.title)"' \
#    | sort -V | column -t -s'|'
#}

# Guix!
export GUIX_PROFILE="$HOME/.guix-profile"
#export GUIX_PROFILE="$HOME/.config/guix/current"

# Svez guix bin
export PATH="$HOME/.config/guix/current/bin${PATH:+:}$PATH"

# Guix guile zadeve
export GUILE_LOAD_PATH=$HOME/.config/guix/current/share/guile/site/3.0
export GUILE_LOAD_COMPILED_PATH=$HOME/.config/guix/current/lib/guile/3.0/site-ccache

export GUIX_PACKAGE_PATH="$HOME/Projekti/guix-packages"
export GUIX_LOCPATH="$GUIX_PROFILE/lib/locale"

export GUIX_PROFILE_FILE="$GUIX_PROFILE/etc/profile"
[ -e $GUIX_PROFILE_FILE ] && source $GUIX_PROFILE_FILE
#export SSL_CERT_DIR="$GUIX_PROFILE/etc/ssl/certs"
#export SSL_CERT_FILE="$SSL_CERT_DIR/ca-certificates.crt"
#export GIT_SSL_CAINFO="$SSL_CERT_FILE"
#export CURL_CA_BUNDLE="$SSL_CERT_FILE"

# Aliasi
alias ls='ls --color=auto'
alias vi='vim'
alias apachelog="gnome-terminal -e \"tail -f /var/log/httpd/error_log\""
alias sudo="sudo "
alias grep="grep --color=auto"

# Fix za termite ssh
alias ssh="TERM=xterm-256color ssh"

# Remove not-required-anymore packages
alias paclean="sudo pacman -R \$(pacman -Qdt | awk '{print \$1}')"

# Seznam paketov po velikosti (archlinux)
alias pacsize="expac -H M '%m\t%n' | sort -h"

alias ffon="sudo cp /etc/resolv.conf.ff /etc/resolv.conf"
alias gitclean="git fetch -p && for branch in \$(git branch -vv | grep ': gone]' | gawk '{print \$1}'); do git branch -D \$branch; echo 'deleted \$branch'; done"
alias sctl="systemctl"
alias ddrush="ddev exec drush"
alias dcomposer="ddev exec composer"
alias sc="chromium --force-device-scale-factor=1"
alias emacs-live="HOME=~/Sredstva/emacs-live emacs"
alias offer-files="python3 -m http.server"

# Firefox scaling!
alias sf="find ~/.mozilla/firefox -name \"prefs.js\" -exec sed -ri 's/(devPixelsPerPx\\\", \\\")[0-9\\.]+/\\11\.00/' {} + ; firefox"

# Navaden firefox
alias ff="find ~/.mozilla/firefox -name \"prefs.js\" -exec sed -ri 's/(devPixelsPerPx\\\", \\\")[0-9\\.]+/\\11\.75/' {} + ; firefox"

# X on wayland
alias wxon="xhost +local:"

# RŠ aliasi
alias omnom="ssh root@debeli"

# Ljudmila
alias scdev="ssh culture@milci.ljudmila.org"

# Dolzina mp3 fajlov
alias mp3len="for i in \$(ls *.mp3); do echo \$i; soxi -d \$i; done"

# Hiter ping za net preverit
alias pg="ping 1.1.1.1"

# Najvecji fajli
alias najvecji="find . -printf '%s %p\n'| sort -nr | head -30"

# NVM
#export NVM_DIR="/home/g1smo/.nvm"
#[ -e /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh
alias invm=". /usr/share/nvm/init-nvm.sh"

# RŠ ssh
alias srs='f(){ ssh jurijp@$1.radiostudent.local };f'

# Poslusaj snemanje
alias poslusaj='pactl load-module module-loopback latency_msec=1'
alias tisina='pactl unload-module module-loopback'
