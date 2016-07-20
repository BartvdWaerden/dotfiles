#!/bin/sh

echo "Setting up your Mac..."

# Check for Vundle and install if we don't have it
if [ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]; then
    echo "Installing vundle."
    git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    echo "Installing Homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Set execute permission on sublime script and runs sublime script
chmod +x sublime.sh
sh sublime.sh

# Create a Sites directory
# This is a default directory for OS X user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Set execute permission on symlink script and runs symlink script
# Symlinks any specified 'dofiles' to '~/'
chmod +x symlink.sh
sh symlink.sh

# Sync Sublime settings
chmod +x sublime.sh
sh sublime.sh


# Set OS X preferences
# We will run this last because this will reload the shell
source .osx
