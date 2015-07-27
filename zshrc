autoload -U compinit zmv colors
colors
bindkey -v
compinit -u

bindkey "^R" history-incremental-search-backward

HISTFILE=~/.zshhistory
HISTSIZE=1000
SAVEHIST=1000
unsetopt CASE_GLOB
export TERM=xterm-256color

# Source : http://www.rlazo.org/2010/11/18/zsh-case-insensitive-completion/
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
      'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

alias vi="vim"
alias ez="vi ~/.zshrc"
alias vimrc="vi ~/.vimrc"
alias sz="source ~/.zshrc"
alias repos="cd ~/repos"
alias mmv='noglob zmv -W'
alias gs='git status'
alias gpr='git pull -rebase'
alias gpom='git push origin master'

if [[ -e /usr/local/bin/greadlink ]]; then
    alias readlink='greadlink'
fi

sum_color() {
    python -c "import sys; print(sum([ord(x) for x in sys.argv[1]]) % 256)" $1
}

HOSTNAME_COLOR=$(sum_color `hostname -s`)
USERNAME_COLOR=$(sum_color `whoami` )

PROMPT="[%F{$USERNAME_COLOR}%n%f@%F{$HOSTNAME_COLOR}%m%f] : %F{28}%3~%f %# "

PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
PATH="$PATH:/Applications/Julia-0.3.10.app/Contents/Resources/julia/bin"
PATH="$PATH:/Applications/Racketv6.2/bin"
export PATH

zshcolors () {
	for i in {0..255}; do echo -e "\e[38;05;${i}m${i}"; done | column -c 150 -s '  '; echo -e "\e[m"
}
