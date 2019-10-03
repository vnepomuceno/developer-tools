# Zsh Customization

## Frameworks & Plugins

* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), a framework for managing your Zsh configuration.
* [zsh-completions](https://github.com/zsh-users/zsh-completions), additional completion definitions for Zsh.
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy), good-lookin' diffs.
* [bat](https://github.com/sharkdp/bat), a cat(1) clone with wings.
* [httpie](https://httpie.org), a command line HTTP client.
* [hstr](https://github.com/dvorka/hstr), bash and zsh shell history suggest box.

## Zsh

Add to `~/.zshrc`:

```bash
# Use nerd font
POWERLEVEL9K_MODE='nerdfont-complete'

# Escape special characters (^)
setopt NO_NOMATCH

# Aliases
alias ls="ls -FG"
alias la="ls -lahFG"
alias grep="grep --color=auto -iRnH"
alias gp="git pull"
alias gs="git s"
alias gt="git tr"
alias gd="git diff"
alias gdc="git diff --cached"
alias gum="git checkout master && git pull"

# HSTR configuration - add this to ~/.bashrc
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
```

## Git

### Aliases

Add to `~/.gitconfig`:

```bash
[alias]
    tree1 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
    tree2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold red)%h%C(reset) - %C(bold green)%s%C(reset) %C(bold blue)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''%C(dim white){ Author: %C(reset)%C(white)%an%C(dim white), Email: %C(reset)%C(white)%ae%C(dim white), Date: %C(reset)%C(white)%cd%C(dim white) }%C(reset)' --all
    tr = !"git tree2"
    s = status
```
