# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH CONFIGURATION
# ================================================================
plugins=(git fzf)

#ZSH_THEME="spaceship"
#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="jnrowe"
#ZSH_THEME="node"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CACHE_DIR="$ZSH/cache"
export ZSH_CUSTOM="$ZSH/custom"
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish


# ALIASES
# ================================================================
alias ls="exa --icons"
alias la="ls -lahFG"
alias gp="git pull"
alias gs="git s"
alias gt="git tr"
alias gfl="git filelog"
alias gd="git diff"
alias gdc="git diff --cached"
alias gum="git checkout master && git pull"
alias guq="git checkout qa && git pull"
alias fpath="echo $PATH | sed -r 's/[:]+/\n/g' | fzf"
alias pyv="pyenv versions"
alias pyinstall="pyenv install -l | fzf | xargs pyenv install"
alias env="env | fzf"
alias zshrc="cat ~/.zshrc | fzf"
alias venvroot="echo /Users/valternepomuceno/Library/Caches/pypoetry/virtualenvs"
alias venvs="ls /Users/valternepomuceno/Library/Caches/pypoetry/virtualenvs"
alias zshalias="cat ~/.zshrc | grep -v zshalias | grep alias"
alias GIT_THIS="git rev-parse --abbrev-ref HEAD"
alias jpl="cd ~/Workspace && jupyter lab"

# FZF CONFIGURATION
# ================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.fzf-horizon-dark-theme.config
# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]lugin
bip() {
  local inst=$(brew search | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; brew install $prog; done;
  fi
}
# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]lugin
bup() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    for prog in $(echo $upd);
    do; brew upgrade $prog; done;
  fi
}
# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]lugin (e.g. uninstall)
bcp() {
  local uninst=$(brew leaves | fzf -m)

  if [[ $uninst ]]; then
    for prog in $(echo $uninst);
    do; brew uninstall $prog; done;
  fi
}
# Install selected pyenv python versions
fpyi() {
  local inst=$(pyenv install -l | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; pyenv install $prog; done;
  fi
}


# PYTHON CONFIGURATION
# ================================================================
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export SYSTEM_VERSION_COMPAT=1  # Hack for fixing errors building wheels
# ffmpeg error
export PYENV_ROOT="$HOME/./Library/Python/2.7/lib/python/site-packages/ffmpeg"

# Poetry Fixes
export PATH="/usr/local/opt/bzip2/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/bzip2/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/bzip2/include"

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# InfluxDB
export PATH="/usr/local/opt/influxdb/bin:$PATH:"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# SDKMAN (THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!)
# ================================================================
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
