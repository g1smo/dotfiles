# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -v
export KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/g1smo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# The following lines were added by compinstall
zstyle :compinstall filename '/home/g1smo/.zshrc'

export EDITOR="vim"
export VISUAL="vim"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Color
autoload colors zsh/terminfo
colors
export TERM="xterm-color"
# PATH additions
export GOPATH=~/Sredstva/go
export PATH="$PATH:/home/g1smo/bin:/home/g1smo/.gem/ruby/2.3.0/bin:$GOPATH/bin"

# Default term (i3)
export TERMINAL="gnome-terminal"

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
alias sudo="sudo "
alias grep="grep --color=auto"
alias paclean="sudo pacman -R \$(pacman -Qdt | awk '{print \$1}')"
alias ffon="sudo cp /etc/resolv.conf.ff /etc/resolv.conf"
alias gitclean="git fetch -p && for branch in \$(git branch -vv | grep ': gone]' | gawk '{print \$1}'); do git branch -D \$branch; echo 'deleted \$branch'; done"
alias wqa="cp /home/g1smo/Sredstva/wandera_qa.yml /home/g1smo/Projects/wandera/app/config/parameters.yml"
alias wdev="cp /home/g1smo/Sredstva/wandera_dev.yml /home/g1smo/Projects/wandera/app/config/parameters.yml"

# Reverse search shortcut
bindkey '^R' history-incremental-pattern-search-backward

# Skype fix
# export PULSE_LATENCY_MSEC=60

# Xdebug
export XDEBUG_CONFIG="idekey=xdebug remote_host=localhost remote_enable=1 remote_handler=dbgp remote_host=localhost remote_port=9001"
export SCALA_HOME="/usr/share/scala"
export SAL_USE_VCLPLUGIN="gtk"
export PHP_INI_SCAN_DIR="/etc/php56/conf.d/"

# NVM
export NVM_DIR="/home/g1smo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
alias invm="source /usr/share/nvm/init-nvm.sh"
alias sc="chromium --force-device-scale-factor=1"

# GTK interface scale
export GDK_SCALE=1
export GDK_DPI_SCALE=0.6

