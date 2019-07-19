autoload -U compinit zmv colors
colors
bindkey -v
compinit -u

bindkey "^R" history-incremental-search-backward

HISTFILE=~/.zshhistory
HISTSIZE=1000
SAVEHIST=1000
unsetopt CASE_GLOB
setopt SHARE_HISTORY
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Source : http://www.rlazo.org/2010/11/18/zsh-case-insensitive-completion/
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
      'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

alias vi="vim"
alias vimrc="vi ~/.vimrc"
alias ls="ls -F"
alias lsl="ls -lahF"
alias ez="vi ~/.zshrc"
alias sz="source ~/.zshrc"
alias ew="vi ~/.workrc"
alias repos="cd ~/repos"
alias mmv='noglob zmv -W'
alias gs='git status'
alias gpr='git pull -rebase'
alias gpom='git push origin master'

if [[ -e /usr/local/bin/greadlink ]]; then
    alias readlink='greadlink'
fi

if [[ -e ~/.workrc ]]; then
    source ~/.workrc
fi

up() {
    for n ({1..$1}) do cd ..; done
}

sum_color() {
    python -c "import sys; print(sum([ord(x) for x in sys.argv[1]]) % 256)" $1
}

ssht() {
    ssh $1 -t tmux a
}

HOSTNAME_COLOR=$(sum_color `hostname -s`)
USERNAME_COLOR=$(sum_color `whoami` )

PROMPT="[%F{$USERNAME_COLOR}%n%f@%F{39}%m%f] : %F{28}%3~%f %# "

zshcolors () {
	for i in {0..255}; do echo -e "\e[38;05;${i}m${i}"; done | column -c 150 -s '  '; echo -e "\e[m"
}
