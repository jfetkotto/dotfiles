export PATH="/Users/jfetkotto/.cargo/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jfetkotto/.oh-my-zsh"

ZSH_THEME="lambda"
plugins=(git colored-man-pages colorize pip python brew macos zsh-autosuggestions)

EDITOR=nvim

alias gtkwave="/Applications/gtkwave.app/Contents/Resources/bin/gtkwave"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="/usr/local/opt/m4/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
