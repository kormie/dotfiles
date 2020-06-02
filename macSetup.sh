git submodule update --recursive --remote

sudo xcodebuild -license

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh zsh-completions wget

chsh -s $(which zsh)

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin

brew cask install adoptopenjdk

brew install gnupg neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew install fwup squashfs coreutils xz picocom autoconf wxmac glfw3 glew pkg-config openssl direnv ag zlib tmux reattach-to-user-namespace

brew install yarn asdf

. asdf_plugins.sh

asdf install nodejs 8.12.0

npm i -g diff-so-fancy

brew cask install visual-studio-code

sudo cpan local::lib

brew tap homebrew/cask-fonts
brew cask install font-fira-code

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

