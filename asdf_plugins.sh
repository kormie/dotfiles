#! /bin/bash

function handle_node_key_check() {
  echo "Checking PGP Keys for node..."
  set +m
  bash ~/.asdf/plugins/node/bin/import-release-team-keyring > /dev/null 2>&1 &
  bg_pid=$!
  printf "Keys are processing"
  while kill -0 "$bg_pid" > /dev/null 2>&1; do
    printf "."
    sleep 1
  done

  wait $bg_pid
  exit_code=$?
  set -m
  if [ $exit_code -ne 0 ]
  then
    printf "\nIssues with PGP keys\n"
    return $exit_code 2> /dev/null || exit $exit_code
  fi

  printf "\nPGP Keys look good!\n"
}

# Move to $HOME so globals go to the right place
pushd "$HOME" > /dev/null 2>&1

# Add all plugins and update them
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add elm https://github.com/obmarg/asdf-elm.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add haskell https://github.com/vic/asdf-haskell.git
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
asdf plugin-add crystal https://github.com/marciogm/asdf-crystal.git
asdf plugin-add idris https://github.com/vic/asdf-idris.git
asdf plugin-add clojure https://github.com/vic/asdf-clojure.git
asdf plugin-add racket https://github.com/vic/asdf-racket.git
asdf plugin-add r https://github.com/iroddis/asdf-R
asdf plugin-update --all

# Do stupid PGP setup for node
# handle_node_key_check


while IFS= read -r line; do
  echo setting "$line"
  asdf global "$line"
done < ~/.tool-versions

# Install global versions
asdf install

# Add other versions
asdf install elm 0.17.1

# Return the user to prior location
popd > /dev/null 2>&1
