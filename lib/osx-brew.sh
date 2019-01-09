#!/bin/bash

source lib/print.sh

action "INstalling command-line tools using homebrew"

# Install command-line tools using Homebrew.
if ! [[ -x "$(command -v brew)" ]]; then 
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

bot "We need to update and upgrade homebrew"

brew update
brew upgrade

bot "Installing a few taps"

brew tap homebrew/core
brew tap homebrew/bundle
brew tap homebrew/services
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap crisidev/chunkwm
brew tap koekeishiya/formulae

running "Installing updated GNU utilities"
brew install --quiet coreutils && ok || error

running "Installing find utilities"
brew install --quiet findutils && ok || error

running "Installing sed"
brew install --quiet gnu-sed --with-default-names && ok || error

running "Installing newer version of bash"
brew install --quiet bash || error
brew install --quiet bash-completion2 && ok || error

running "Installing wget"
brew install --quiet wget --with-iri && ok || error

running "Installing PGP for signing commits etc"
brew install --quiet gnupg || error
brew install pth && ok || error

bot "==== Installing more recent macOS tools ====="
running "Installing vim"
brew install --quiet vim --with-override-system-vi && ok || error 
running "Installing grep"
brew install --quiet grep && ok || error
running "Installing OpenSSH"
brew install --quiet openssh && ok || error
running "Installing screen"
brew install --quiet screen && ok || error
running "Installing tmux"
brew install --quiet tmux && ok || error

bot "===== Installing general utilities ====="
running "Installing ctags"
brew install --quiet ctags && ok || error
running "Installing curl"
brew install --quiet curl && ok || error
running "Installing stow"
brew install --quiet stow && ok || error
running "Installing tldr"
brew install --quiet tldr && ok || error
running "Installing unar"
brew install --quiet unar && ok || error
running "Installing watch"
brew install --quiet watch && ok || error
running "Installing fzf"
brew install --quiet fzf && ok || error # Nice: https://sourabhbajaj.com/mac-setup/iTerm/fzf.html
running "Installing ack"
brew install --quiet ack && ok || error # https://sourabhbajaj.com/mac-setup/iTerm/ack.html
running "Installing git"
brew install --quiet git && ok || error
running "Installing git-lfs"
brew install --quiet git-lfs && ok || error
# running "Installing imagemagick"
# brew install --quiet imagemagick --with-webp && ok || error
running "Installing p7zip"
brew install --quiet p7zip && ok || error
running "Installing pv"
brew install --quiet pv && ok || error
running "Installing ssh-copy-id"
brew install --quiet ssh-copy-id && ok || error
running "Installing telnet"
brew install --quiet telnet && ok || error
running "Installing neovim"
brew install --quiet neovim && ok || error

bot "===== Installing font tools ====="
brew tap bramstein/webfonttools
running "Installing sfnt2woff"
brew install --quiet sfnt2woff && ok || error
running "Installing sfnt2woff-zopfli"
brew install --quiet sfnt2woff-zopfli && ok || error
running "Installing woff2"
brew install --quiet woff2 && ok || error

bot "===== Installing free casks ====="
running "Installing cask"
brew install --quiet cask && ok || error
running "Installing iterm2"
brew cask install --quiet iterm2 && ok || error
running "Installing keybase"
# brew cask install --quiet keybase && ok || error
running "Installing mark-text"
# brew cask install --quiet mark-text && ok || error
running "Installing google-chrome"
brew cask install --quiet google-chrome && ok || error
running "Installing discord"
brew cask install --quiet discord && ok || error
running "Installing visual-studio-code"
brew cask install --quiet visual-studio-code && ok || error
running "Installing google-backup-and-sync"
brew cask install --quiet google-backup-and-sync && ok || error
running "Installing homebrew/cask-versions/firefox-developer-edition"
brew cask install --quiet homebrew/cask-versions/firefox-developer-edition && ok || error
running "Installing sublime-text"
brew cask install --quiet sublime-text && ok || error
running "Installing spotify"
brew cask install --quiet spotify && ok || error
running "Installing dotnet"
brew cask install --quiet dotnet && ok || error
running "Installing dotnet-sdk"
brew cask install --quiet dotnet-sdk && ok || error
running "Installing steam"
brew cask install --quiet steam && ok || error
running "Installing vlc"
brew cask install --quiet vlc && ok || error
running "Installing the-unarchiver"
brew csak install --quiet the-unarchiver && ok || error
running "Installing teamviewer"
brew cask install --quiet teamviewer && ok || error
running "Installing qbittorrent"
brew cask install --quiet qbittorrent && ok || error
running "Installing docker"
brew cask install --quiet docker && ok || error

bot "===== Installing non-free casks ====="
running "Installing hazel"
brew cask install --quiet hazel && ok || error
running "Installing 1password"
brew cask install --quiet 1password && ok || error
running "Installing bartender"
brew cask install --quiet bartender && ok || error
running "Installing jetbrains-toolbox"
brew cask install --quiet jetbrains-toolbox && ok || error
running "Installing adobe-creative-cloud"
brew cask install --quiet adobe-creative-cloud && ok || error
running "Installing parallels"
brew cask install --quiet parallels && ok || error
running "Installing alfred"
brew cask install --quiet alfred && ok || error
running "Installing evernote"
brew cask install --quiet evernote && ok || error
running "Installing spectacle"
brew cask install --quiet spectacle && ok || error

bot "===== Installing apps from app store ====="
brew install --quiet mas && ok || error
action "Installing Airmail 3"
mas install 918858936	# Airmail 3
# mas install 931657367	# Calcbot
# mas install 873245660	# Spillo
action "Installing Xcode"
mas install 497799835 # Xcode
action "Installing Snappy"
mas install 512617038 # Snappy
action "Installing Slack"
mas install 803453959 # Slack
# mas install 1116599239 # NordVPN
action "Installing The Unarchiver"
mas install 425424353 # The Unarchiver
action "installing Amphetamine"
mas install 937984704 # Ampthetamine
# mas install 634148309 # Logic Pro X

# Other
running "Installing speedtest-cli"
brew install --quiet speedtest-cli && ok || error

# Remove outdated versions from the cellar.
bot "Last thing to do is a little cleanup..."
brew cleanup
