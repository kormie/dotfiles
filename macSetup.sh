git submodule update --recursive --remote

sudo xcodebuild -license

#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install adoptopenjdk

brew install gnupg

brew install neovim

brew install fwup squashfs coreutils xz picocom autoconf wxmac glfw3 glew pkg-config openssl direnv ag
brew install yarn --without-node

. asdf_plugins.sh

asdf install nodejs 8.12.0

npm i -g diff-so-fancy

. asdf_plugins.sh

brew cask install visual-studio-code

sudo cpan local::lib

brew tap caskroom/fonts
brew cask install font-fira-code
