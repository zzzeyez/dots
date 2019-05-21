#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install more recent versions of some macOS tools.
brew install grep
brew install python3

# command line
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# make zsh defaullt
sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells && chsh -s /usr/local/bin/zsh'
brew install neovim
brew install tmux
brew install weechat 
#brew install irssi
brew install ncmpcpp
brew install ranger
brew install htop
brew tap cjbassi/gotop
brew install gotop
brew install neofetch
brew install redshift

# Install other useful binaries.
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install jq
brew install mpd
brew tap mopidy/mopidy
brew install mopidy
brew install mpc
brew install sassc
brew install wget
brew install pidof

# fonts
brew tap caskroom/fonts
brew cask install font-iosevka
brew cask install font-fira-code

# chunkwm
brew tap koekeishiya/formulae
brew install chunkwm
# install from git repo
brew install --HEAD chunkwm
#skhd
brew install koekeishiya/formulae/skhd

# mopidy
brew tap mopidy/mopidy
brew install mopidy-scrobbler

# cask
brew tap caskroom/cask
brew cask install iterm2
brew cask install ubersicht

# start services
brew services start mopidy
brew services start skhd
brew services start chunkwm

# Remove outdated versions from the cellar.
brew cleanup
