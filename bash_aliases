# ** [ LS ALIASES ] ****************
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias halt='halt -p'

# ** [ GIT ALIASES ] ******************
alias gf='git fetch'
alias gco='git checkout $(git branch | grep -v $(git rev-parse --abbrev-ref HEAD) | fzf)'
alias gsp='git stash pop $(git stash list | fzf | cut -d=: -f1)'
alias grb='git rebase -i $(git log --all --graph --oneline --decorate | fzf --reverse | sed -Ee "s/.* ([a-f0-9]{6,}) .*/\1/")'
alias gm='git merge --no-ff $(git branch | grep -v $(git rev-parse --abbrev-ref HEAD) | fzf)'
alias gp='git push'

alias ga='git add -p'
alias gci='git commit'
alias gst='git stash'

alias gsl='git stash list'
alias gs='git status'
alias gsh='git show'
alias gd='git diff'
alias gh='git history'
alias gha='git history --all'
alias gl='git log'
alias gb='git branch -a'
alias gmt='git mergetool'

# git fetch pull
gfpull () { git fetch && git checkout $1 && git pull origin $1; }

# git fetch push
gfpush () { git fetch && git checkout $1 && git push origin $1; }

# git track (create new tracking branch)
gt () { git checkout -b $1 -t origin/$1; }

# git version (tag and branch at a specific deploy point)
gv () { git tag v$1 && git checkout -b $1 && git push origin v$1 && git push origin $1; }

# ** [ DOCKER ALIASES ] ******************
alias dk='docker'
alias dki='docker image'
alias dkc='docker container'
alias dkm='docker-machine'
alias dkm:reload='eval $(docker-machine env default)'