export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh-custom
EDITOR='vim'

if [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi

RBENV_ROOT=/usr/local/var/rbenv

GOPATH=/Users/kormie/Documents/languages/golang/monkey

export CLASSPATH=".:/usr/local/Cellar/antlr/4.7.1/antlr-4.7.1-complete.jar:$CLASSPATH"

alias antlr='java -jar /usr/local/Cellar/antlr/4.7.1/antlr-4.7.1-complete.jar'

ZSH_THEME="kormie"
plugins=(git zsh-syntax-highlighting bundler battery)
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
alias cleanx="rm -rf /Users/kormie/Library/Developer/Xcode/DerivedData && xc"

alias tree="tree -alC"
alias elint="fswatch -o ./lib | xargs -n1 -I{} ~/.credo_run.sh"
alias etest="fswatch -o ./test ./lib | xargs -n1 -I{} ~/.etest.sh"

alias connect_test="ssh -i \"~/.ssh/test_aws_server.pem\" ubuntu@ec2-52-207-172-228.compute-1.amazonaws.com"

alias lt='cd ~/letote/letote'

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
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# OPAM configuration
. /Users/kormie/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export GPG_TTY=$(tty)

eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.rvm/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

### Added by Zplugin's installer
source '/Users/kormie/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
zplugin load djui/alias-tips
### End of Zplugin's installer chunk
zplugin light zdharma/zui
zplugin ice wait'[[ -n ${ZLAST_COMMANDS[(r)cras*]} ]]'
zplugin light zdharma/zplugin-crasis
zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions
zplugin ice wait"0" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting
zplugin ice wait"2" pick'$ZPFX/bin/git-now' as"program" lucid make'prefix=$ZPFX install'
zplugin light iwata/git-now
zplugin ice wait"2" pick'$ZPFX/bin/git-alias' as"program" lucid make'PREFIX=$ZPFX' nocompile
zplugin light tj/git-extras
zplugin ice wait"2" as"program" lucid atclone'perl Makefile.PL PREFIX=$ZPFX' atpull"%atclone" make'install' pick"$ZPFX/bin/git-cal"
zplugin light k4rthik/git-cal
zplugin ice as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy
