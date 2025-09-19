# ----- BASE -----
# Load base modules in order
for f in path history prompt tools aliases git editor system tasks tmux python dirs search http misc extras; do
  [ -r "$ZDOTDIR/base/${f}.zsh" ] && . "$ZDOTDIR/base/${f}.zsh"
done

# ----- OS-SPECIFIC -----
case "$OSTYPE" in
  darwin*) [ -r "$ZDOTDIR/os/mac.zsh" ]   && . "$ZDOTDIR/os/mac.zsh" ;;
  linux*)  [ -r "$ZDOTDIR/os/linux.zsh" ] && . "$ZDOTDIR/os/linux.zsh" ;;
esac

# ----- LOCAL (optional, ignored if missing) -----
[ -r "$ZDOTDIR/local/aliases.sh" ]       && . "$ZDOTDIR/local/aliases.sh"
[ -r "$ZDOTDIR/local/work_aliases.sh" ]  && . "$ZDOTDIR/local/work_aliases.sh"
