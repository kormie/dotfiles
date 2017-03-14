function handle_node_key_check() {
  echo "Checking PGP Keys for node..."
  alias check_rings=". ~/.asdf/plugins/node/bin/import-release-team-keyring"
  set +m
  check_rings > /dev/null 2>&1 &
  bg_pid=$!

  while ps | grep -v grep | grep -q $bg_pid
  do
    echo Keys are still processing
    sleep 3
  done

  wait $bg_pid
  exit_code=$?
  set -m
  if [ $exit_code -ne 0 ]
  then
    echo "Issues with PGP keys"
    return $exit_code 2> /dev/null || exit $exit_code
  fi

  echo "PGP Keys look good!"
}

# Move to $HOME so globals go to the right place
pushd $HOME > /dev/null 2>&1

# Add all plugins and update them
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add elm https://github.com/vic/asdf-elm.git
asdf plugin-add node https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add go https://github.com/kennyp/asdf-golang.git
asdf plugin-add haskell https://github.com/vic/asdf-haskell.git
asdf plugin-add python https://github.com/tuvistavie/asdf-python.git

asdf plugin-update --all

# Do stupid PGP setup for node
handle_node_key_check

# Setup global versions
GLOBAL_ERLANG=19.2
GLOBAL_ELIXIR=1.4.0
GLOBAL_ELM=0.18.0
GLOBAL_GO=1.8
GLOBAL_HASKELL=8.0.2
GLOBAL_NODE=6.10.0
GLOBAL_RUBY=2.4.0
GLOBAL_PYTHON=2.7.4

read -d '' GLOBALS <<EOF
erlang $GLOBAL_ERLANG
elixir $GLOBAL_ELIXIR
elm $GLOBAL_ELM
go $GLOBAL_GO
haskell $GLOBAL_HASKELL
node $GLOBAL_NODE
ruby $GLOBAL_RUBY
python $GLOBAL_PYTHON
EOF

# Set Global Versions
echo $GLOBALS > .tool-versions

# Install global versions
asdf install

# Add other versions
asdf install elm 0.17.0

# Return the user to prior location
popd > /dev/null 2>&1


