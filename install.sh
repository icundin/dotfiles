#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
echo "Updating Homebrew recipes..."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Installing Homebrew dependencies..."
brew tap homebrew/bundle
brew bundle

# Set default MySQL root password and auth type.
echo "Starting MySQL service..."
brew services start mysql
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
echo "Installing PHP extensions with PECL..."
pecl install memcached imagick

# Install global Composer packages
echo "Installing global composer dependencies..."
/usr/local/bin/composer global require laravel/installer laravel/valet

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
echo "Creating Sites folder..."
mkdir $HOME/Sites

# Install Laravel Valet
echo "Installing valet..."
$HOME/.composer/vendor/bin/valet install

# Set Sites folder to serve valet
(cd $HOME/Sites && valet park)

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
echo "Setting up zsh..."
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Retreive the application preferences & profiles using mackup
echo "Restoring application preferences..."
mackup restore

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/extra/.{gitconfig,vscode}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Set macOS preferences
# We will run this last because this will reload the shell
echo "Setting up MacOS preferences..."
source .macos
