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
export CARGOPATH="$HOME/.cargo/bin"
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

if [ "$(pwd)" != "$HOME/projects" ];
    then cd "$HOME/projects";
fi

