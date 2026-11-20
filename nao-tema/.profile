export XCURSOR_THEME="saber_rodando"
export XCURSOR_SIZE="32"
export PATH="$PATH:/home/konata/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=vi
export PAGER=less
export ENV="$HOME/.okshrc"
export HISTFILE="$HOME/.oksh_history"
export HISTSIZE=5000

[ -r "$ENV" ] && . "$ENV"
