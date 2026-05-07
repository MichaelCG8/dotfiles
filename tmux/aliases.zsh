tmux() {
  case "$1" in
    mark-closeable)
      shift
      command tmux set-option -t "$1" @status to-be-closed
      ;;

    mark-shelved)
      shift
      command tmux set-option -t "$1" @status shelved
      ;;

    unmark)
      shift
      command tmux set-option -u -t "$1" @status
      ;;

    # List sessions with their @status tag, highlighting attached ones in cyan.
    list)
      command tmux list-sessions -F "#{session_name}	#{?session_attached,1,0}" |
      while IFS=$'\t' read -r s attached; do
        tag=$(command tmux show-options -t "$s" -qv @status)
        printf "%s\t%s\t%s\n" "${tag:--}" "$s" "$attached"
      done | sort | column -t | awk '{
        attached = ($NF == "1")
        sub(/ +[01]$/, "")
        if (attached) printf "\033[36m%s\033[0m\n", $0
        else print
      }'
      ;;

    *)
      command tmux "$@"
      ;;
  esac
}
