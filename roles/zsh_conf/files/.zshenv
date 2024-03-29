# This file is generated by ansible. Do not edit manually.
# Edit $HOME/.zshenv.local instead.
source-if-exists() {
  [ -e $1 ] && . $1
}
test -z "${ZSHENV_LOADED}" || return
export ZSHENV_LOADED=1
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/usr/local/google-cloud-sdk/bin"
source-if-exists "$HOME/.ghcup/env"
source-if-exists "$HOME/.cargo/env"
source-if-exists "$HOME/.opam/opam-init/init.zsh"
source-if-exists "$HOME/.nix-profile/etc/profile.d/nix.sh"
source-if-exists "$HOME/.autojump/etc/profile.d/autojump.sh"
source-if-exists "$HOME/.poetry/env"
source-if-exists "$HOME/.zshenv.local"
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
