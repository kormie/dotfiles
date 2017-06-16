export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh-custom
EDITOR='vim'

RBENV_ROOT=/usr/local/var/rbenv

GOPATH=/Users/Kormie/Documents/Bearch/go_code

ZSH_THEME="kormie"
plugins=(git zsh-syntax-highlighting bundler battery)
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh

alias mkdir="mkdir -pv -m 2755"
alias lspem="\ls -le"

export LS_COLORS="di=01;36:ln=04;31"
export ZLS_COLORS=LS_COLORS

alias tree="tree -alC"
alias elint="fswatch -o ./lib | xargs -n1 -I{} ~/.credo_run.sh"
alias etest="fswatch -o ./test ./lib | xargs -n1 -I{} ~/.etest.sh"

alias connect_test="ssh -i \"~/.ssh/test_aws_server.pem\" ubuntu@ec2-52-207-172-228.compute-1.amazonaws.com"

alias servedir='ruby -run -e httpd . -p 9091'
alias jl='cd ~/Documents/projects/konrad'

alias nprompt="export PROMPT=$; export RPROMPT=''"

alias xc='open *.xcworkspace'
alias appcode="open -a AppCode\ EAP.app"
alias ac='appcode *.xcworkspace'

#eval "$(hub alias -s)"
alias gist='gist -p'

alias standup='log HEAD~40..HEAD | ack david'

alias c=clear
alias gs="clear && git status -sb"
alias log='git log --graph --pretty="format:%C(yellow)%h%Cred%d%Creset %s %C(white) %C(cyan)%an%Creset, %C(green)%ar%Creset"'
alias diff='git diff'
alias doff='diff'
alias zz='vi ~/.zshrc'
alias vv='vi ~/.vimrc'
alias psd="open -a /Applications/Adobe\ Photoshop\ CS6/Adobe\ Photoshop\ CS6.app"
alias adb="/Users/Kormie/Library/Android/sdk/platform-tools/adb"
alias vi=vim

# Amazon AWS Service CLI
compdef aws_completer aws
alias aws-profile="source aws-profile"
alias aws="aws-wrapper"

alias ll='ls -A1'

export PATH=${PATH}:$HOME/gsutil:$HOME:`yarn global bin`

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export GPG_TTY=$(tty)

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
