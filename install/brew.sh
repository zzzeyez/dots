#!/usr/bin/env bash
# install homebrew packages

if [[ ! "$(command -v brew)" ]] ; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
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
brew install grep
brew install python3
brew install zsh
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
brew install git
brew install git-lfs
brew install imagemagick
brew install jq
brew install mpd
brew tap mopidy/mopidy
brew install mopidy
brew install mpc
brew install sassc
brew install wget
brew install pidof
brew tap caskroom/fonts
brew cask install font-iosevka
brew cask install font-fira-code
# chunkwm
brew tap koekeishiya/formulae
brew install chunkwm
# install from git repo
brew install --HEAD chunkwm
# skhd
brew install koekeishiya/formulae/skhd
# mopidy
brew tap mopidy/mopidy
brew install mopidy-scrobbler

# cask
brew tap caskroom/cask
brew cask install iterm2
brew cask install ubersicht

# Remove outdated versions from the cellar.
brew cleanup
