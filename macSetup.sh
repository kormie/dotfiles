# In the future we may want to add this option
# but for now it's just duplicative as we need
# this stuff in place in order to get github
# access to the dotfiles anyway
# echo "Creating an SSH key for you..."
# ssh-keygen -t rsa
#
# echo "Please add this public key to Github \n"
# echo "https://github.com/account/ssh \n"
# read -p "Press [Enter] key after this..."
#
# echo "Installing xcode-stuff"
# xcode-select --install
#
# sudo xcodebuild -license

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/kormie/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install wget coreutils curl git asdf

if [ ! -d "$HOME/.oh-my-zsh" ]
then
 echo "Installing Oh My ZSH..."
 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
else
 echo "Oh My ZSH already installed"
fi

chsh -s $(which zsh)

mkdir ~/.zplugin && git clone git@github.com:xPMo/zplugin.git  ~/.zplugin/bin

brew install adoptopenjdk

brew install gnupg neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew install fwup squashfs coreutils xz picocom autoconf wxmac glfw3 glew pkg-config openssl direnv ag zlib tmux reattach-to-user-namespace

brew install yarn

npm i -g diff-so-fancy

apps=(
  1password
  alfred
  android-studio
  bettertouchtool
  docker
  dropbox
  firefox
  flycut
  google-chrome
  iterm2
  keyboard-maestro
  visual-studio-code
)

echo "installing apps with Cask..."
brew install --appdir="/Applications" ${apps[@]}

sudo cpan local::lib

brew tap homebrew/cask-fonts
brew install --cask font-fira-code

#"Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

#"Set caps lock to control"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1133-50475-0 -array '<dict><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer><key>HIDKeyboardModifierMappingDst</key><integer>2</integer></dict>'

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

