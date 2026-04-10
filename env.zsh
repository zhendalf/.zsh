# ~/.zsh/env.zsh
# Environment variables

# Shell options
setopt AUTO_CD # Allow changing directories without 'cd'

# Add your environment variable exports below

# Editor configuration
export EDITOR="zed --wait"
export VISUAL="zed --wait"
export BROWSER=open

# GPG signing
export GPG_TTY=$(tty)
