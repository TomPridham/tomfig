. ~/.bash/git-completion.sh
. ~/.bash/git-fetch.sh

if [ -f $HOME/.bash_secrets ]; then
    . $HOME/.bash_secrets
fi

findandkill() {
    port=$(lsof -n -i4TCP:$1 | grep LISTEN | awk '{ print $2 }');
    kill -9 $port
}
alias cb='cargo build'
alias cc='cargo check'
alias cl='cargo clippy -- -D warnings'
alias cr='cargo run'
alias ct='cargo test'
alias cw='cargo watch'
alias gb='git branch '
__git_complete gb _git_branch
alias gc='git checkout '
__git_complete gc _git_checkout
alias gcam='git commit -am '
alias gd='git diff'
alias gdc='git diff --name-only --diff-filter=U'
alias gf='git fetch'
alias gfu='git add . && git commit --amend --no-edit && gu -f'
alias gl='git log'
alias gp='git pull'
alias gr='git reset --hard'
alias gs='git status -u'
alias gu='git push -u'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias killport=findandkill
alias la='ls -A1'
alias ls='ls -1'
alias ns='npm start'
alias todo='nvim ~/todo.txt'

export TERM=xterm-256color
export CARGOPATH="$HOME/.cargo/bin"
# there is an issue with the sccache daemon dying https://github.com/mozilla/sccache/issues/837
export SCCACHE_IDLE_TIMEOUT=0 sccache --start-server &> /dev/null
export DOTNET_ROOT=$HOME/dotnet
export BREWPATH="/opt/homebrew/bin"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export VIM_LCOV_INFO_FILEPATH=coverage.info
export PATH="$HOME/dotnet:$HOME/projects/tomfig/bin:$CARGOPATH:$BREWPATH:$PATH"
export GPG_TTY=$(tty)
# zsh is the default terminal in mac now, this disables a warning when it is disabled
export BASH_SILENCE_DEPRECATION_WARNING=1
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal
set -o vi

chmod +x $HOME/projects/tomfig/bin/*.sh

. ~/.config/broot/launcher/bash/br
eval "$(starship init bash)"
. "$HOME/.cargo/env"
