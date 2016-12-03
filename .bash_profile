[[ -f "$HOME/.git_completion.bash" ]] && source "$HOME/.git_completion.bash"
[[ -f "$HOME/.git_prompt.sh" ]] && source "$HOME/.git_prompt.sh"
[[ -f "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"

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

# shortcuts
alias hgrep='history | grep'
alias workspace='cd ~/Dropbox/workspace/'
alias gst='git status'

# added paths
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
