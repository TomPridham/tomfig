source ~/.bash/git-completion.sh
source ~/.bash/bash-git-prompt/gitprompt.sh

if [ -f $HOME/.bash_secrets ]; then
    . $HOME/.bash_secrets
fi

alias cb='cargo bench'
alias cc='cargo check'
alias cr='cargo run'
alias ct='cargo test'
alias gb='git branch'
alias gc='git checkout '
alias gcam='git commit -am '
alias gd='git diff'
alias gdc='git diff --name-only --diff-filter=U'
alias gf='git add . && git commit --amend --no-edit && gu -f'
alias gp='git pull'
alias gr='git reset --hard'
alias gs='git status -u'
alias gu='git push -u'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias la='ls -A1'
alias ls='ls -1'
alias ns='npm start'
alias todo='vim ~/todo.txt'

export TERM=xterm-256color
export CARGOPATH="$HOME/.cargo/bin"
export RUSTC_WRAPPER="sccache"
export GOPATH="$HOME/go"
export BREWPATH="/usr/local/sbin"
export PATH="$GOPATH/bin:$HOME/projects/tomfig/bin:$CARGOPATH:$BREWPATH:$PATH"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export GPG_TTY=$(tty)
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal
set -o vi

chmod +x $HOME/projects/tomfig/bin/*.sh

if command -v tmux &> /dev/null && [ -n "$PS1"  ] && [[ ! "$TERM" =~ screen  ]] && [[ ! "$TERM" =~ tmux  ]] && [ -z "$TMUX"  ]; then
    exec tmux
fi

export PATH="$HOME/.cargo/bin:$PATH"

source /home/tompridham/.config/broot/launcher/bash/br
