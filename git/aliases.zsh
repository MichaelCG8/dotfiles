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

glo() {
	local mergeBaseDev
	if mergeBaseDev=$(git merge-base HEAD "${GLO_BASE:-dev}" 2>/dev/null); then
		git update-ref refs/glo/base-dev "$mergeBaseDev"
	else
		git update-ref -d refs/glo/base-dev 2>/dev/null
	fi

	local mergeBaseMaster
	if mergeBaseMaster=$(git merge-base HEAD "${GLO_BASE:-master}" 2>/dev/null); then
		git update-ref refs/glo/base-master "$mergeBaseMaster"
	else
		git update-ref -d refs/glo/base-master 2>/dev/null
	fi

	local -a logCmd=(
		git log
		--clear-decorations
		--decorate=short
		--max-count=16
		--graph
		--pretty=format:"%C(auto)%h%Creset %C(green)%ad%Creset %C(blue)%<(15,trunc)%an%Creset %s %C(auto)%d%Creset"
		--date=format:"%d/%m"
	)

	# Not a terminal: plain output, no highlighting.
	if [[ ! -t 1 ]]; then
		"${logCmd[@]}" "$@"
		return
	fi

	# Highlight the merge-base rows: give the row's text a background.
	"${logCmd[@]}" --color=always "$@" |
		awk -v bg=$'\e[48;5;23m' -v reset=$'\e[m' '
			/refs\/glo\// {
				line = $0
				gsub(/\033\[m/, reset bg, line)
				print bg line reset
				next
			}
			{ print }
		' |
		less -RFX
}
alias gap='git add -p'
alias guc='git commit --amend -C HEAD' # "git update commit" Does ammends the commit and reuses the existing commit message.
diffof() {
	ref="$1"
	shift
	git diff "$ref"~1 "$ref" "$@"
}
gdo() { # "git diff origin" Diffs the working tree against the current branch on origin.
	git diff "origin/$(git rev-parse --abbrev-ref HEAD)" "$@"
}
