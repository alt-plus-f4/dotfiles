# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Unset
unset LS_COLORS

# -------- #
# Exports
# -------- #

export EZA_CONFIG_DIR="/Users/valentinasenov/.config/eza" # change user
export FZF_DEFAULT_OPTS="--style full --preview 'bat --color=always {}' --preview-window '~3'"

alias python='python3'
alias py='python3'
alias pip='python3 -m pip'
alias v='nvim'
alias f='fzf'

# Zoxide
alias cd='z'
# Eza
alias ls='eza --icons=always'
alias szh='source ~/.zshrc'
alias ezsh='v ~/.zshrc'

# -------- #
# Terminal
# -------- #

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

