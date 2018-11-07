#!/bin/bash

set -eux

function open_dmg {
  mkdir -p /tmp/$1
  pushd /tmp/$1
  curl -L -o ./t.dmg $2
  open -W ./t.dmg
  popd
}

## Show Hidden Files
defaults write com.apple.finder AppleShowAllFiles TRUE

#   ## Key Repeat
#   defaults write -g KeyRepeat -int 2
#   defaults write -g InitialKeyRepeat -int 15
#   
#   

cd /tmp
#   ## Google Chrome
#   open_dmg gc https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
#   
#   ## K
#   open_dmg ke https://pqrs.org/osx/karabiner/files/Karabiner-Elements-12.1.0.dmg
#   
#   ## Brew (needs hitting Enter)
#   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#   
#   ## ZSH (needs password)
#   
#   brew install zsh
#   sudo sh -c "echo $(which zsh) >> /etc/shells"
#   chsh -s $(which zsh)
#   
#   git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
#   
#   cat << 'EOF' > /tmp/prezto-cmd.sh
#   setopt EXTENDED_GLOB
#   for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#     ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#   done
#   EOF
#   
#   $(which zsh) /tmp/prezto-cmd.sh
#  
#   brew install autojump
#   brew install peco
#   
#   
#   cat << 'EOF' > ~/.zshrc
#   setopt auto_cd
#   function chpwd() { ls }
#   [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
#   
#   function peco-history-selection() {
#       BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
#       CURSOR=$#BUFFER
#       zle reset-prompt
#   }
#   
#   zle -N peco-history-selection
#   bindkey '^R' peco-history-selection
#   EOF
#   
#   ## iTerm 2
#   brew cask install iterm2
#
#   
#   ## Clipy
#   open_dmg clipy https://github.com/Clipy/Clipy/releases/download/1.2.1/Clipy_1.2.1.dmg


## Sequel Pro
open_dmg seq https://github.com/sequelpro/sequelpro/releases/download/release-1.1.2/sequel-pro-1.1.2.dmg

## Wavebox
open_dmg wb https://github.com/wavebox/waveboxapp/releases/download/v4.4.0/Wavebox_4_4_0_osx.dmg

## Google Cloud SDK (needs hitting Enter and Y)
curl https://sdk.cloud.google.com | bash

## Jetbrains Toolbox
open_dmg jbt https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.11.4269.dmg

## Sourcetree
cd /tmp
curl -L -o st.zip https://product-downloads.atlassian.com/software/sourcetree/ga/Sourcetree_3.0_200.zip
unzip st.zip

