#################
# POWERLEVEL10K #
#################

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#######
# RVM #
#######

## Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

###########
# ALIASES #
###########

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

##############################
# TERMINAL PLUGINS & CONFIGS #
##############################

# Auto suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Escape special characters (^)
setopt NO_NOMATCH

# HSTR configuration
alias hh=hstr                    # hh to be alias for hstr
export HISTFILE=~/.zsh_history   # ensure history file visibility
export HSTR_CONFIG=hicolor       # get more colors
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
bindkey -s "\C-r" "\eqhstr\n"    # bind hstr to Ctrl-r (for Vi mode check doc)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/valternep/.sdkman"
[[ -s "/Users/valternep/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/valternep/.sdkman/bin/sdkman-init.sh"
