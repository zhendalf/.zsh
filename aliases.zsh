# ~/.zsh/aliases.zsh
# Shell aliases organized by category

# ===== File System Navigation & Operations =====

# Navigation
alias zc="z -c"           # Smart directory jumping with z
alias ..="cd .."         # Go up one directory
alias ...="cd ../.."     # Go up two directories
alias ....="cd ../../.." # Go up three directories
alias -- -="cd -"        # Go to previous directory

# Listing files
alias ls="ls -G"      # Colorized ls output
alias ll="ls -lh"     # Long format, human-readable sizes
alias la="ls -lah"    # Long format, including hidden files
alias lt="ls -lhtr"   # Sort by time, newest last
alias lsd="ls -ld */" # List only directories

# ===== Development Tools =====

# Bun - JavaScript runtime & package manager
alias b="bun"
alias bx="bunx"
alias bd="bun run dev"
alias bb="bun run build"
alias bi="bun install"
alias ba="bun add"
alias br="bun run"
alias brt="bun run test"
alias brm="bun remove"
alias brmg="bun remove -g"
alias bup="bun update"
alias bug="bun update -g"
alias bugl="bun update -g --latest"
alias bad="bun add -d"
alias bag="bun add -g"
alias bit="bun init"
alias bity="bun init -y"

# Turbo - Monorepo tool
alias td="turbo dev"
alias tb="turbo build"

# Other tools
alias oc="openclaw"
alias ocd="opencode"

# Claude CLI
alias c="claude"
alias clc="claude -c"
alias cr="claude -r"
alias cy="claude --permission-mode bypassPermissions"
alias ccy="claude -c --permission-mode bypassPermissions"
alias cry="claude -r --permission-mode bypassPermissions"
alias cur="cursor"

# ===== Git & Version Control =====

# Lazygit
alias lg="lazygit"

alias gs="git status -sb" # Short status with branch info
alias ga="git add"
alias gaa="git add --all" # Add all changes
alias gc="git commit -m"
alias gca="git commit --amend" # Amend previous commit
alias gp="git push"
alias gpf="git push --force-with-lease" # Safer force push
alias gl="git pull"
alias gf="git fetch --all" # Fetch all remotes
alias gd="git diff"
alias gds="git diff --staged" # Diff staged changes
alias gb="git branch"
alias gbd="git branch -d" # Delete branch
alias gco="git checkout"
alias gcb="git checkout -b"                      # Create and checkout new branch
alias glo="git log --oneline --graph --decorate" # Pretty log
alias grb="git rebase"
alias gst="git stash"
alias gstp="git stash pop"
alias gsta="git stash apply"     # Apply stash without removing it
alias gsl="git stash list"       # List stashes
alias grh="git reset HEAD~"      # Undo last commit, keep changes
alias grs="git restore --staged" # Unstage changes
alias gfo="git fetch origin main:main"
alias gcm="git checkout main"


# Git worktree
alias gw="git worktree"          # Git worktree command
alias gwa="git worktree add"     # Add new worktree
alias gwl="git worktree list"    # List all worktrees
alias gwr="git worktree remove"  # Remove worktree
alias gwp="git worktree prune"   # Prune worktree references
alias gwrf="git worktree remove --force" # Force remove worktree

# ===== System & Infrastructure =====

# Infrastructure
alias tf="terraform"
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"

# System
alias dud="du -d 1 -h"          # Disk usage by directory, human readable
alias duf="du -sh *"            # Disk usage by file, human readable

# Process management
alias psa="ps aux"        # List all processes
alias psg="ps aux | grep" # Search processes

# Network
alias myip="curl -s https://api.ipify.org" # Get public IP
alias localip="ipconfig getifaddr en0"     # Get local IP
alias ports="lsof -i -P -n | grep LISTEN"  # Show listening ports

# Tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Vibe Kanban
alias vk="bx vibe-kanban"


# Worktree CLI
alias wtc="wt setup -t"
alias wtrf="wt rm -f"
alias wtp="wt purge"
alias wtpr="wt pr -s"

# tmux
alias ta='tmux attach -t main || tmux new -s main'
alias tl='tmux ls'
alias tk='tmux kill-session -t'
alias tn='tmux new -s'
alias tat='tmux attach -t'
alias tr='tmux source-file ~/.tmux.conf && tmux display-message "Reloaded!"'
alias th='${EDITOR:-vim} ~/tmux-shortcuts.md'

t() {
  local raw_name="${1:-${PWD##*/}}"
  local name="${raw_name##.}"
  name="${name//[^[:alnum:]_-]/_}"
  [[ -z "$name" ]] && name="main"

  tmux has-session -t "$name" 2>/dev/null || tmux new-session -d -s "$name"
  if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$name"
  else
    tmux attach -t "$name"
  fi
}

tka() {
  tmux ls 2>/dev/null | awk -F: '/\(detached\)/ {print $1}' | xargs -n1 tmux kill-session -t
}

tsend() {
  tmux send-keys -t "$1" -l -- "$2"
  sleep 0.1
  tmux send-keys -t "$1" Enter
}

tpeek() {
  tmux capture-pane -t "$1" -p | awk 'NF{last=NR} {arr[NR]=$0} END{for(i=1;i<=last;i++) print arr[i]}' | tail -"${2:-20}"
}

tfull() {
  tmux capture-pane -t "$1" -p -S -
}

alias cx="codex --dangerously-bypass-approvals-and-sandbox"
alias oct="openclaw tui"
