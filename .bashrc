source ~/.bash/git-completion.sh
source ~/.bash/bash-git-prompt/gitprompt.sh

alias cb='cargo bench'
alias cc='cargo check'
alias cr='cargo run'
alias ct='cargo test'
alias gb='git branch'
alias gc='git checkout '
alias gcam='git commit -am '
alias gd='git diff'
alias gdc='git diff --name-only --diff-filter=U'
alias gp='git pull'
alias gr='git reset --hard'
alias gs='git status'
alias gu='git push -u'
alias la='ls -A1'
alias ls='ls -1'
alias masada='cd jane-masada/MVC/VeryJane.Applications.Masada'
alias ns='npm start'
alias t='docker exec -it jane-com_webpack_1 touch src/app.js'
alias ts='docker exec -it jane-seller_webpack_1 touch src/index.js'

export DISPLAY=:0.0
export TERM=xterm-256color
export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal
set -o vi
if command -v tmux &> /dev/null && [ -n "$PS1"  ] && [[ ! "$TERM" =~ screen  ]] && [[ ! "$TERM" =~ tmux  ]] && [ -z "$TMUX"  ]; then
    exec tmux
fi
cd ~/projects
