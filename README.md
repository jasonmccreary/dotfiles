# dotfiles
Includes my terminal dotfiles. Configured to keep history *forever*, git command completion, and display the branch name in the prompt when inside a git repository.

git completion and prompt are sourced from the [git project files](https://github.com/git/git/tree/master/contrib/completion).

## Installation
First, create the directory structure to maintain your command history.

    mkdir -p ~/log/bash/

Second, you need to place the necessary dot files in your home directory. I prefer creating symlinks to avoid making changes in two places. However, you may wish to copy the files if you plan on making customizations.

    ln -s ~/Documents/workspace/dotfiles/.git_completion.bash 
    ln -s ~/Documents/workspace/dotfiles/.git_prompt.sh 
    ln -s ~/Documents/workspace/dotfiles/.bash_prompt 
    ln -s ~/Documents/workspace/dotfiles/.bash_profile 
    mkdir -p ~/log/bash/
