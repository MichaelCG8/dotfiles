# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
# hub_path=$(which hub)
# if (( $+commands[hub] ))
# then
#   alias git=$hub_path
# fi

# The rest of my fun git aliases
# alias gl='git pull --prune'
alias gg="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
# alias gp='git push origin HEAD'
alias gp='git push'

# Remove `+` and `-` from start of diff lines; just rely upon color.
# alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gcm='git commit -m'
# alias gca='git commit -a'
alias gco='git checkout'
# alias gcb='git copy-branch-name'
# alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
# alias gac='git add -A && git commit -m'
# alias ge='git-edit-new'

alias glo='git log --max-count=10 --pretty=format:"%C(yellow)%h%Creset %C(green)%ad%Creset %s" --date=format:\'%d/%m\\''
alias gap='git add -p'
alias guc='git commit --amend -C HEAD' # "git update commit" Does ammends the commit and reuses the existing commit message.
