#!/bin/sh
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
RST=$(tput sgr0)
success=1

brew_install_formula()
{
    echo `date` "-> Installing $1"
    if brew ls --versions $1 > /dev/null; then
        echo `date` "-> ${GREEN}[DONE]${RST} $1 is already installed\n"
    else
        brew install $1
        if [ $? -ne 0 ]; then
            echo `date` "-> ${RED}[ERROR]${RST} Could not install $1\n"
            success=0
        else
            echo `date` "-> ${GREEN}[DONE]${RST} Installed $1\n"
        fi
    fi
}

echo `date` "-> AUTOMATIC ZSH CONFIGURATION"
echo `date` "-> Initializing boot configuration for terminal\n"

echo `date` "-> Copying .zshrc file to ~/"
cp resources/.zshrc ~/
if [ $? -ne 0 ]; then
    echo `date` "-> ${RED}[ERROR]${RST} Could not copy file .zshrc\n"
    success=0
else
    echo `date` "-> ${GREEN}[DONE]${RST} Copied file .zshrc\n"
fi

brew_install_formula httpie
brew_install_formula bat

if [ $success -eq 0 ]; then
    echo `date` "-> ${RED}[FAILURE]${RST}${RED} Could not finish automatic configuration"
else
    echo `date` "-> ${GREEN}[SUCCESS]${RST}${GREEN} Finished automatic configuration"
fi