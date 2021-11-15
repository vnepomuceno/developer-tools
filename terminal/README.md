# Terminal Configurations

## SDKMAN!

[SDKMAN!](https://sdkman.io/install) is a tool for managing parallel versions of multiple Software Development Kits on most Unix based systems. It provides a convenient Command Line Interface (CLI) and API for installing, switching, removing and listing Candidates.

## Brew Formulas

Install `brew` from the [homepage](https://brew.sh), if you haven't yet.

Use the command `brew install <formula>` to install the following formulas:

* [bat](https://github.com/sharkdp/bat), a cat clone with wings
* [ctop](https://github.com/bcicen/ctop), top-like interface for container metrics 
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy), good-lookin' diffs
* [exa](https://github.com/ogham/exa)
* [fzf](https://github.com/junegunn/fzf), a command-line fuzzy finder 
* [gradle-completion](https://github.com/gradle/gradle-completion), bash and zsh completion support for gradle
* [hstr](https://github.com/dvorka/hstr), bash and zsh shell history suggest box
* [htop](https://github.com/hishamhm/htop), an interactive process viewer
* [httpie](https://httpie.org), a command line HTTP client
* [jq](https://stedolan.github.io/jq), lightweight and flexible command-line JSON processor
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), a framework for managing your zsh configuration
* [ripgrep](https://github.com/BurntSushi/ripgrep), ripgrep recursively searches directories for a regex pattern while respecting your gitignore
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), fish-like fast / unobtrusive autosuggestions for zsh
* [zsh-completions](https://github.com/zsh-users/zsh-completions), additional completion definitions for zsh
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), fish-like syntax highlighting for zsh

## Shell Scripts

### Install Brew Formulas

In the root of the project run the `install-brew-formulas.sh` script:

```
./scripts/install-brew-formulas.sh
```

This will install brew formulas declared in `FORMULAS` array:

```
FORMULAS=(
    bat
    diff-so-fancy
    gradle-completion
    hstr
    htop
    httpie
    jq
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)
```