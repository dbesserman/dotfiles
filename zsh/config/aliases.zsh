# git
alias g='git'
alias gaa='git add .'
alias gco='git checkout'
alias gst='git status'
alias gh='git show -s --format=%H | pbcopy'
alias gcp='git cherry-pick `pbpaste`'
alias gfz='git checkout $(git branch | fzf)'

# vim
alias vi=nvim

# elixir
alias phs='source ./config/.env && iex -S mix phx.server'
