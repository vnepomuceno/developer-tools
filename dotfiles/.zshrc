# ALIASES
# ================================================================
alias ls="ls -FG"
alias la="ls -lahFG"
alias grep="grep --color=auto -iRnH"
alias gp="git pull"
alias gs="git s"
alias gt="git tr"
alias gd="git diff"
alias gdc="git diff --cached"
alias gum="git checkout master && git pull"
alias guq="git checkout qa && git pull"
alias grep="ggrep --color=auto"


# OH MY ZSH CONFIGURATION
# ================================================================
plugins=(git)
ZSH_THEME="jnrowe"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

export ZSH=".oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish


# PYTHON CONFIGURATION
# ================================================================
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export SYSTEM_VERSION_COMPAT=1  # Hack for fixing errors building wheels


# RUBY CONFIGURATION
# ================================================================
export PATH="$PATH:$HOME/.rvm/bin"


# HSTR CONFIGURATION
# ================================================================
export HSTR_CONFIG=raw-history-view,hicolor,blacklist
export HISTFILE=~/.zsh_history   # ensure history file visibility
export HISTSIZE=10000000         # define history limit
export SAVEHIST=$HISTSIZE        # set history limit
setopt HIST_EXPIRE_DUPS_FIRST    # expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # don't execute immediately upon history expansion.
setopt SHARE_HISTORY             # share history between all sessions.
setopt NO_NOMATCH                # escape special characters (^)
bindkey -s "\C-r" "\eqhstr\n"    # bind hstr to Ctrl-r (for Vi mode check doc)


# SDKMAN (THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!)
# ================================================================
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"
