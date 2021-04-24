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

function gdf() {
    curl -s -o "$2" "https://raw.githubusercontent.com/laravel-shift/laravel-$1/master/$2"
}

function phormat() {
    phpcbf --standard=PSR2 "$1"
}

function fixup() {
    git commit --fixup="$1"
    GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash "$1"~2
}

function composer-link() {
  repositoryName=${3:-local}

  composer config repositories.$repositoryName '{"type": "path", "url": "'$1'", "options": {"symlink": true}}' --file composer.json
  composer require $2 @dev
}

function dec() {
  containers=`docker ps | awk '{print $1,$2,$NF}' | grep -m 1 -F $1`
  container_id=`echo $containers | awk '{print $1}'`

  if [ -n "$container_id" ]; then
    if [[ $PWD/ = /Users/*/workspace/* ]]; then
      docker exec -w /var/www/"${PWD#*/workspace/}" -it $container_id /bin/bash
    else
      docker exec -it $container_id /bin/bash
    fi
  else
    echo "No container found for query: '$1'"
  fi
}

# shortcuts
alias hgrep='history | grep'
alias workspace='cd ~/workspace/'
alias gst='git status'
alias gwd='pwd | pbcopy'
alias now='date +%s | pbcopy'
alias nah='git reset --hard && git clean -df'
alias mfs='php artisan migrate:fresh --seed'
alias tinker='php artisan tinker'

# added paths
export PATH=~/.composer/vendor/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/php5/bin:$PATH
