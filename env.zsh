# ~/.zsh/env.zsh
# Environment variables

# Shell options
setopt AUTO_CD # Allow changing directories without 'cd'

# Add your environment variable exports below

# Editor configuration
export EDITOR="zed"
export VISUAL="zed"
export BROWSER=open

# GPG signing
export GPG_TTY=$(tty)

# 1Password SSH agent
# export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
