# -*- mode: sh -*-

_install_nvm_exec() {
    local target=/usr/share/nvm
    [[ -z ${NVM_DIR} ]] && {
        if [[ -n $1 ]]; then
            export NVM_DIR=$1
        else
            export NVM_DIR=$HOME/.nvm
        fi
    }
# "nvm exec" and certain 3rd party scripts expect "nvm.sh" and "nvm-exec" to
# exist under $NVM_DIR
    [[ -e $NVM_DIR ]] || mkdir --parents "$NVM_DIR"
    [[ -e $NVM_DIR/nvm.sh ]] || ln -s $target/nvm.sh "$NVM_DIR"/nvm.sh
    [[ -e "$NVM_DIR"/nvm-exec ]] || ln -s $target/nvm-exec "$NVM_DIR"/nvm-exec
    source /usr/share/nvm/nvm.sh
}
