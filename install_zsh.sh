#!/bin/bash

source lib/print.sh
source lib/install.sh



bot "This is the ZSH installation script"

function zshrcgen()
{
    if [ -f $HOME/.zshrc ]; then
        if questionY "Do you want to override your existing .zshrc (will backup)"; then
            backupfile="$HOME/.zshrc.$(date +%s).old"
            action "Backing up as $backupfile"
            mv $HOME/.zshrc $backupfile

            cp lib/cp-files/zshrc.sh $HOME/.zshrc
        else
            return -1
        fi
    else
        cp lib/cp-files/zshrc.sh $HOME/.zshrc
    fi

    info "Copied .zshrc"
    return 0
}

function install_powerlevel()
{
    if [[ ! $SHELL == "/bin/zsh" ]]; then
        if questionY "Set default shell to ZSH"
        then
            # sudo -s 'echo $(which zsh) >> /etc/shells' && chsh -s $(which zsh)
            chsh -s $(which zsh)
            sudo chsh -s $(which zsh)
        fi
    fi

    # # Install oh-my-zsh if it isn't
    if [ ! -d $HOME/.oh-my-zsh ]; then
        if [[ "$(command -v curl)" ]]; then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        elif [[ "$(command -v wget)" ]]; then
            sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        else
            error "Install curl or wget before installing powerlevel"
            return -1
        fi
    fi

    # Install PowerLevel9k
    if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel9k ]; then
        running "Installing PowerLevel9k"
        git clone --quiet https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel9k && ok || error
    else
        info "PowerLevel9k already installed."
    fi

    autosuggestions="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    syntaxhighlight="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

    # Install Auto Suggestions
    if [ ! -d $autosuggestions ]; then
        running "Installing auto suggestions"
        git clone --quiet https://github.com/zsh-users/zsh-autosuggestions $autosuggestions && ok || error
    else
        info "Auto suggestions already installed."
    fi

    # # Install Syntax Highlighting
    if [ ! -d $syntaxhighlight ]; then
        running "Installling Syntax Highlighting"
        git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git $syntaxhighlight && ok || error
    else
        info "Syntax Highlighting already installed"
    fi
}

bot "Will now install Powerline Fonts on your system..."

git submodule update --quiet --init --remote PowerlineFonts && ok || error
./PowerlineFonts/install.sh

bot "Installing ZSH with PowerLevel9k"

install zsh
install_powerlevel

zshrcgen
