# Setup fzf
# ---------
if [[ ! "$PATH" == */home/cno/.fzf/bin* ]]; then
  export PATH="$PATH:/home/cno/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/cno/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/cno/.fzf/shell/key-bindings.zsh"

