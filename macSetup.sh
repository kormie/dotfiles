echo "Creating an SSH key for you..."
ssh-keygen -t rsa

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

sudo xcodebuild -license

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install wget coreutils curl git asdf

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s $(which zsh)

mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin

brew cask install adoptopenjdk

brew install gnupg neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew install fwup squashfs coreutils xz picocom autoconf wxmac glfw3 glew pkg-config openssl direnv ag zlib tmux reattach-to-user-namespace

brew install yarn

npm i -g diff-so-fancy

apps=(
  alfred
  bettertouchtool
  dropbox
  google-chrome
  firefox
  iterm2
  visual-studio-code
)

echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

echo "Please setup and sync Dropbox, and then run this script again."
read -p "Press [Enter] key after this..."

sudo cpan local::lib

brew tap homebrew/cask-fonts
brew cask install font-fira-code

#"Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

#"Set caps lock to control"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1133-50475-0 -array '<dict><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer><key>HIDKeyboardModifierMappingDst</key><integer>2</integer></dict>'

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

