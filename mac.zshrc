# -----------------------------
# use vim motions in zsh
# -----------------------------
bindkey -v



# -----------------------------
# Set personal aliases
# -----------------------------
alias v='nvim'
alias typora='open -a typora'
alias zed='open -a zed'
alias ll='eza --icons --group-directories-first --color=always -l'
alias la='ll -la'



# -----------------------------
# Prompt (oh-my-posh)
# -----------------------------
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
fi



# -----------------------------
# Completion system (fast compinit)
# -----------------------------
autoload -Uz compinit

ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-${ZSH_VERSION}"
mkdir -p "${ZSH_COMPDUMP:h}"

# Rebuild completion dump if missing or older than 24h
if [[ ! -f "$ZSH_COMPDUMP" || -n "$(find "$ZSH_COMPDUMP" -mtime +1 -print 2>/dev/null)" ]]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit -C -d "$ZSH_COMPDUMP"
fi

# Completion UX
zstyle ':completion:*' menu select 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format $'\e[2;37m%d\e[m'
zstyle ':completion:*:warnings'     format $'\e[2;31mNo matches for: %d\e[m'




# -----------------------------
# Extensions
# -----------------------------

# add zsh extensions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh"
source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"

# double tab to accept auto-suggestions
bindkey '^I^I' autosuggest-accept
