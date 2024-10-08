# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable `compdef` for Antidote:
autoload -Uz compinit
compinit

# Antidote
# To install: git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
if [ -d "${ZDOTDIR:-$HOME}/.antidote" ]; then
  source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
  antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

  # Powerlevel10k
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

[ -f "$HOME/.profile" ] && source "$HOME/.profile"
[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"
