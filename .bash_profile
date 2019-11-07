[[ -f "$HOME/.git_completion.bash" ]] && source "$HOME/.git_completion.bash"
[[ -f "$HOME/.git_prompt.sh" ]] && source "$HOME/.git_prompt.sh"
[[ -f "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"

# hide zsh notice
export BASH_SILENCE_DEPRECATION_WARNING=1

# keep history "forever"
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups
shopt -s histappend

PROMPT_COMMAND="$PROMPT_COMMAND;history -a;precmd"

# color
export CLICOLOR=1

function precmd() {
    if [ "$(id -u)" -ne 0 ]; then
        FULL_CMD_LOG="$HOME/log/bash/history-$(date -u "+%Y-%m").log"
        echo "$USER@`hostname`:`pwd` [$(date -u)] `\history 1`" >> ${FULL_CMD_LOG}
    fi
}

# functions
function mkcd() {
    mkdir "$1" && cd "$1"
}

function phormat() {
    phpcbf --standard=PSR2 "$1"
}

function fixup() {
    git commit --fixup="$1"
    GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash "$1"~2
}


# shortcuts
alias hgrep='history | grep'
alias workspace='cd ~/workspace/'
alias gst='git status'
alias gwd='pwd | pbcopy'
alias now='date +%s | pbcopy'

# added paths
export PATH=~/.composer/vendor/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/php5/bin:$PATH
