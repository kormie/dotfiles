export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh-custom
EDITOR='vim'

RBENV_ROOT=/usr/local/var/rbenv

GOPATH=/Users/Kormie/Documents/Bearch/go_code

ZSH_THEME="kormie"
plugins=(git zsh-syntax-highlighting bundler battery zsh-autosuggestions)
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh

source ~/.letote-aliases

#make erlang have a memory
export ERL_AFLAGS="-kernel shell_history enabled"

export LS_COLORS="di=01;36:ln=04;31"
export ZLS_COLORS=LS_COLORS

alias fixcamera='echo acer | please -S killall VDCAssistant'
alias mkdir="mkdir -pv -m 2755"
alias lspem="\ls -le"

alias tree="tree -alC"
alias elint="fswatch -o ./lib | xargs -n1 -I{} ~/.credo_run.sh"
alias etest="fswatch -o ./test ./lib | xargs -n1 -I{} ~/.etest.sh"

alias connect_test="ssh -i \"~/.ssh/test_aws_server.pem\" ubuntu@ec2-52-207-172-228.compute-1.amazonaws.com"

alias lt='cd ~/Documents/letote/letote'

alias domaster='gco master && git pull -r && gco - && git merge master --no-edit'

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
alias vi=nvim

# Amazon AWS Service CLI
compdef aws_completer aws
#alias aws-profile="source aws-profile"
#alias aws="aws-wrapper"

source ~/.letote-secrets

alias ll='ls -A1'

fpath+=~/.zfunc

export PATH=$HOME/.local/bin:${PATH}:$HOME/gsutil:$HOME:`yarn global bin`:$HOME/.cargo/bin:$HOME/miniconda3/bin
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

alias hdocs='open /Users/kormie/Library/Haskell/doc/index.html'

alias rpsec='rspec'

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export GPG_TTY=$(tty)

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# OPAM configuration
. /Users/kormie/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export GPG_TTY=$(tty)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.rvm/bin:$PATH"
