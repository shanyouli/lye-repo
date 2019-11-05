[[ -z ${RUSTUP_HOME} ]] && export RUSTUP_HOME=$HOME/.rustup
[[ -z ${CARGO_HOME} ]] && export CARGO_HOME=$HOME/.cargo

export PATH="$PATH:${CARGO_HOME}/bin"
