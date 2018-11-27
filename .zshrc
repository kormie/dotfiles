export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh-custom
EDITOR='vim'

if [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi

ZSH_THEME="kormie"
plugins=(
  battery
  bundler
  git
  wd
  ag
  z
  zeus
  zsh-syntax-highlighting
)
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh

source ~/.aliases

RBENV_ROOT=/usr/local/var/rbenv

GOPATH=/Users/kormie/Documents/languages/golang/monkey

export CLASSPATH=".:/usr/local/Cellar/antlr/4.7.1/antlr-4.7.1-complete.jar:$CLASSPATH"

gh(){
  open $(git config remote.origin.url | sed "s/git@\(.*\):\(.*\).git/https:\/\/\1\/\2/")/$1$2
}

#make erlang have a memory
export ERL_AFLAGS="-kernel shell_history enabled"

export LS_COLORS="di=01;36:ln=04;31"
export ZLS_COLORS=LS_COLORS

# Amazon AWS Service CLI
compdef aws_completer aws
#alias aws-profile="source aws-profile"
#alias aws="aws-wrapper"

fpath+=~/.zfunc

export PATH=$HOME/.local/bin:${PATH}:$HOME/gsutil:$HOME:`yarn global bin`:$HOME/miniconda3/bin
export PATH="/usr/local/opt/openssl/bin:/usr/local/opt/mysql@5.6/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/zlib/include"

export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/zlib/lib/pkgconfig"

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
zplugin ice wait"2" pick'$ZPFX/bin/git-cal' as"program" lucid atclone'perl Makefile.PL PREFIX=$ZPFX' atpull"%atclone" make"install"
zplugin light k4rthik/git-cal
zplugin ice pick"bin/git-dsf" as"program"
zplugin light zdharma/zsh-diff-so-fancy

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/kormie/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;