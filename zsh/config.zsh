export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Don't nice background tasks.
# This would set backgroudn jobs to a lower priority.
setopt NO_BG_NICE

# With HUP when you exit the shell, the started processes will
# stop running, or warn you they're still running.
# NO_HUP exits without stopping those processes.
# setopt NO_HUP

# Prevents autocompletion from beeping on an ambiguous completion.
setopt NO_LIST_BEEP


setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

# In zsh !! is expanded to the last command.
# It will print the last command and then run it.
# With HIST_VERIFY the expanded command is instead entered as
# the input on the next line, so you can edit it before running.
setopt HIST_VERIFY

# Share history between sessions
# https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/
# Also append to the history file rather than overwrite it when the shell exits.
# Also incrementally append to the history file with each
# command, rather than at shell exit.
# Also add timestamps to the history.
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# When setting custom prompt strings, allow parameter expansion,
# command substitution, and artithmentic expansion.
setopt PROMPT_SUBST

# Offer to correct suspected spelling mistakes in commands (not arguments).
setopt CORRECT

# TODO: https://www.zsh.org/mla/users/2003/msg00610.html
# setopt COMPLETE_IN_WORD

# EOF (Ctrl-D) will exit a Python session.
# It will also exit the shell if this option is not set.
# Ten consecutive EOFs will still exit regardless.
setopt IGNORE_EOF

# Don't record duplicates in history. The older one is removed.
# setopt HIST_IGNORE_ALL_DUPS
# Expire duplicates first, before retiring the oldest unique entry.
setopt HIST_EXPIRE_DUPS_FIRST

# Removes superfluous blanks from each command line.
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

# https://unix.stackexchange.com/a/117162
# https://jdhao.github.io/2019/06/13/zsh_bind_keys/
# Consider vim keybinding.
#     https://opensource.com/article/18/9/tips-productivity-zsh
# bindkey '^[^[[D' backward-word
# bindkey '^[^[[C' forward-word
# bindkey '^[[5D' beginning-of-line
# bindkey '^[[5C' end-of-line
# bindkey '^[[3~' delete-char
# bindkey '^?' backward-delete-char
