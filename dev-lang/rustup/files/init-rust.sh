[[ -z ${RUSTUP_HOME} ]] && export RUSTUP_HOME=$HOME/.rustup
[[ -z ${CARGO_HOME} ]] && export CARGO_HOME=$HOME/.cargo

export PATH="$PATH:${CARGO_HOME}/bin"

if [[ ${SHELL} == */bash ]]; then
    [[ -f /usr/share/rustup/bash_completion ]] && source /usr/share/rustup/bash_completion
elif [[ ${SHELL} == */zsh ]]; then
    [[ -f /usr/share/rustup/zsh_completion ]] && source /usr/share/rustup/zsh_completion
elif [[ ${SHELL} == */fish ]] ; then
     source /usr/share/rustup/fish_completion
fi
