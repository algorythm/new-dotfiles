#!/bin/bash
CURR_DIR="$(dirname ${BASH_SOURCE})"
source ${CURR_DIR}/print.sh

action "Installing command-line tools using homebrew"

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

bot "===== Installing font tools ====="
brew tap bramstein/webfonttools
running "Installing sfnt2woff"
brew install  sfnt2woff && ok || error
running "Installing sfnt2woff-zopfli"
brew install  sfnt2woff-zopfli && ok || error
running "Installing woff2"
brew install  woff2 && ok || error

bot "Installing essentials"
running "Installing newer version of bash"
brew install bash || error
brew install bash-completion2 && ok || error
running "Installing wget"
brew install wget --with-iri && ok || error
running "Installing vim"
brew install  vim --with-override-system-vi && ok || error 
running "Installing neovim"
brew install  neovim && ok || error
running "Installing grep"
brew install  grep && ok || error
running "Installing OpenSSH"
brew install  openssh && ok || error
running "Installing tmux"
brew install  tmux && ok || error
running "Installing curl"
brew install  curl && ok || error
running "Installing git"
brew install  git && ok || error
running "Installing git-lfs"
brew install  git-lfs && ok || error

running "Installing cask"
brew install  cask && ok || error
running "Installing iterm2"
brew cask install  iterm2 && ok || error
running "Installing google-chrome"
brew cask install  google-chrome && ok || error
running "Installing visual-studio-code"
brew cask install  visual-studio-code && ok || error
running "Installing google-backup-and-sync"
brew cask install  google-backup-and-sync && ok || error
running "Installing dotnet"
brew cask install  dotnet && ok || error

running "Installing hazel"
brew cask install  hazel && ok || error
running "Installing 1password"
brew cask install  1password && ok || error
running "Installing bartender"
brew cask install  bartender && ok || error
running "Installing jetbrains-toolbox"
brew cask install  jetbrains-toolbox && ok || error
running "Installing adobe-creative-cloud"
brew cask install  adobe-creative-cloud && ok || error



running "Installing updated GNU utilities"
brew install coreutils && ok || error

running "Installing find utilities"
brew install findutils && ok || error

running "Installing sed"
brew install gnu-sed --with-default-names && ok || error



running "Installing PGP for signing commits etc"
brew install  gnupg || error
brew install pth && ok || error

bot "==== Installing more recent macOS tools ====="
running "Installing screen"
brew install  screen && ok || error

bot "===== Installing general utilities ====="
running "Installing ctags"
brew install  ctags && ok || error
running "Installing stow"
brew install  stow && ok || error
running "Installing tldr"
brew install  tldr && ok || error
running "Installing unar"
brew install  unar && ok || error
running "Installing watch"
brew install  watch && ok || error
running "Installing fzf"
brew install  fzf && ok || error # Nice: https://sourabhbajaj.com/mac-setup/iTerm/fzf.html
running "Installing ack"
brew install  ack && ok || error # https://sourabhbajaj.com/mac-setup/iTerm/ack.html
# running "Installing imagemagick"
# brew install  imagemagick --with-webp && ok || error
running "Installing p7zip"
brew install  p7zip && ok || error
running "Installing pv"
brew install  pv && ok || error
running "Installing ssh-copy-id"
brew install  ssh-copy-id && ok || error
running "Installing telnet"
brew install  telnet && ok || error


bot "===== Installing free casks ====="
# running "Installing keybase"
# brew cask install  keybase && ok || error
# running "Installing mark-text"
# brew cask install  mark-text && ok || error
running "Installing discord"
brew cask install  discord && ok || error
# running "Installing homebrew/cask-versions/firefox-developer-edition"
# brew cask install  homebrew/cask-versions/firefox-developer-edition && ok || error
# running "Installing sublime-text"
# brew cask install  sublime-text && ok || error
running "Installing spotify"
brew cask install  spotify && ok || error
# running "Installing dotnet-sdk" # conflicting with dotnet
# brew cask install  dotnet-sdk && ok || error
running "Installing steam"
brew cask install  steam && ok || error
running "Installing vlc"
brew cask install  vlc && ok || error
# running "Installing the-unarchiver" # Moved to appstore
# brew csak install  the-unarchiver && ok || error
running "Installing teamviewer"
brew cask install  teamviewer && ok || error
running "Installing qbittorrent"
brew cask install  qbittorrent && ok || error
running "Installing docker"
brew cask install  docker && ok || error

bot "===== Installing non-free casks ====="
# running "Installing parallels"
# brew cask install  parallels && ok || error
# running "Installing alfred"
# brew cask install  alfred && ok || error
# running "Installing evernote"
# brew cask install  evernote && ok || error
running "Installing spectacle"
brew cask install  spectacle && ok || error

bot "===== Installing apps from app store ====="
brew install  mas && ok || error
action "Installing Airmail 3"
mas install 918858936	# Airmail 3
# mas install 931657367	# Calcbot
# mas install 873245660	# Spillo
action "Installing Xcode"
mas install 497799835 # Xcode
sudo xcodebuild -license accept # Accept license
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
# running "Installing speedtest-cli"
# brew install  speedtest-cli && ok || error

# Remove outdated versions from the cellar.
bot "Last thing to do is a little cleanup..."
brew cleanup
