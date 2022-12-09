# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# init sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
