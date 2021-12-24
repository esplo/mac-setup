#!/bin/bash

set -eux

## Show Hidden Files
defaults write com.apple.finder AppleShowAllFiles TRUE

## Key Repeat
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

## install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


## install apps via brew

brew install git
brew install --cask google-chrome
brew install --cask karabiner-elements
brew install --cask iterm2
brew install --cask clipy
brew install --cask wavebox
brew install --cask dropbox
brew install --cask visual-studio-code


## ZSH (needs password)

brew install zsh
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cat << 'EOF' > /tmp/prezto-cmd.sh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
EOF
$(which zsh) /tmp/prezto-cmd.sh

brew install autojump
brew install peco

cat << 'EOF' >> ~/.zshrc
setopt auto_cd
function chpwd() { ls }
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
EOF
