#!/bin/sh
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
RST=$(tput sgr0)
bold=$(tput bold)
normal=$(tput sgr0)
success=1

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

brew_install_formula()
{
    echo $(date) "-> Installing ${bold}$1${normal}"
    if brew ls --versions $1 > /dev/null; then
        echo $(date) "-> ${GREEN}[OK]${RST} ${bold}$1${normal} is already installed\n"
    else
        brew install $1
        if [ $? -ne 0 ]; then
            echo $(date) "-> ${RED}[KO]${RST} Could not install ${bold}$1${normal}\n"
            success=0
        else
            echo $(date) "-> ${GREEN}[OK]${RST} Installed ${bold}$1${normal}\n"
        fi
    fi
}

for formula in "${FORMULAS[@]}"
do
    brew_install_formula "$formula"
done

if [ $success -eq 0 ]; then
    echo $(date) "-> ${RED}${bold}[FAILURE]${normal}${RST}${RED} Could not install all formulas"
else
    echo $(date) "-> ${GREEN}${bold}[SUCCESS]${normal}${RST}${GREEN} Finished installing all formulas successfully"
fi