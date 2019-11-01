[[ -z ${RUSTUP_HOME} ]] && export RUSTUP_HOME=$HOME/.rustup
[[ -z ${CARGO_HOME} ]] && export CARGO_HOME=$HOME/.cargo

export PATH="$PATH:${CARGO_HOME}/bin"
 _RUSTUP_COMPLETIONS_DIR=/usr/local/share/rustup/completions
if [[ ${SHELL} == */bash ]]; then
    [[ -f ${_RUSTUP_COMPLETIONS_DIR}/rustup.bash ]] && {
        # shellcheck source=/dev/null
        source ${_RUSTUP_COMPLETIONS_DIR}/rustup.bash
    }
elif [[ ${SHELL} == */zsh ]]; then
    [[ -f ${_RUSTUP_COMPLETIONS_DIR}/rustup.zsh ]] && {
        # shellcheck source=/dev/null
        source ${_RUSTUP_COMPLETIONS_DIR}/rustup.zsh
    }
elif [[ $SHELL == */fish ]]; then
    [[ -f ${_RUSTUP_COMPLETIONS_DIR}/rustup.fish ]] && {
        # shellcheck source=/dev/null
        source ${_RUSTUP_COMPLETIONS_DIR}/rustup.fish
    }
fi
unset _RUSTUP_COMPLETIONS_DIR
