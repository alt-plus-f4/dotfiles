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

export PATH="$PATH:/Applications/IntelliJ IDEA.app/Contents/MacOS"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
export PATH="/usr/local/opt/python@3.x/bin:$PATH"
export EZA_CONFIG_DIR="/Users/valentinasenov/.config/eza"

alias dr='cd ~/dirigible/ && java -jar build/application/target/dirigible-application-*-executable.jar'
alias drc='java -jar build/application/target/dirigible-application-*-executable.jar'
alias mvnq='mvn -T 1C clean install -P quick-build'
alias mvnc='mvn clean'
alias mvnf='mvn formatter:format'
alias python='python3'
alias py='python3'
alias pip='python3 -m pip'
alias v='nvim'

# Zoxide
alias cd='z'
# Eza
alias ls='eza --icons=always'



function idea() {
    open -a "IntelliJ IDEA CE" "$1"
}


# ? Haskell
[ -f "/Users/valentinasenov/.ghcup/env" ] && . "/Users/valentinasenov/.ghcup/env" # ghcup-env

# -------- #
# Terminal
# -------- #

# Carapace
autoload -U compinit && compinit
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

