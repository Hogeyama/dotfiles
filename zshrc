
################################################################################
# oh-my-zsh
################################################################################

autoload bashcompinit
bashcompinit
zstyle ':completion:*:*:nvim:*' file-patterns '^*.(aux|log|pdf|cmo|cmi|cmt|cmx):source-files' '*:all-files'

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"
ZSH_THEME="imajes"
ZSH_THEME="junkfood"
ZSH_THEME="kardan"
ZSH_THEME="kphoen"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"j

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  z
  # bundler
  # dotenv
  # rake
  # rbenv
  # ruby
  # cargo
  # battery
  )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# export EDITOR='nvr -p'
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


################################################################################
# personal settings
################################################################################

##############################################
# その他
##############################################

# opt
setopt NO_HUp
setopt NO_CHECK_JOBS
unsetopt correctall
autoload bashcompinit

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# zsh_aliases
[ -f ~/.zsh_aliases ] && . ~/.zsh_aliases
[ -f ~/.zshenv ]      && . ~/.zshenv

# Java
export JAVA_HOME=/usr/lib/jvm/jdk-14
export PATH=$JAVA_HOME/bin:$PATH

# stack completion
which stack > /dev/null && eval "$(stack --bash-completion-script stack)"

# for mochi
export LD_LIBRARY_PATH=$HOME/.opam/4.03.0/lib/z3:/usr/lib:/usr/local/lib:$LD_LIBRARY_PATH

# xmodmap
xmodmap $HOME/.Xmodmap 2> /dev/null; :

# wine
export WINEPREFIX="$HOME/.wine"

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvr {})+abort'"

# Haskell
#########

# haskell-ide-engine
export cabal_helper_libexecdir=$HOME/.local/bin

# OCaml
#######

# OPAM configuration
export OCAMLFIND_IGNORE_DUPS_IN=`opam config var lib`/ocaml/compiler-libs

# rust
######

export RUST_BACKTRACE=1

################################################################################
# bindkey
################################################################################

bindkey "^K" up-line-or-history
bindkey "^J" down-line-or-history

# eval "$(starship init zsh)"
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
