export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/Cellar/llvm/19.1.2/bin:$PATH"

zstyle ':omz:update' mode auto      # update automatically without asking


ZSH_THEME=robbyrussell
plugins=(
    git
    zsh-autosuggestions
)
source "$ZSH/oh-my-zsh.sh"
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh)"

alias lg="lazygit"
alias vi="nvim"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
