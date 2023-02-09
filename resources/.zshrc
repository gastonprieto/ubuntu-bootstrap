export UPDATE_ZSH_DAYS=1

source $HOME/apps/antigen/antigen.zsh

export APPS=$HOME/apps
export ZSH_FILE=$HOME/.zshrc

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

#
# Antigen Theme
#

antigen theme bira

#
# Antigen Bundles
#

antigen bundles <<EOBUNDLES

zsh-users/zsh-syntax-highlighting
colored-man-pages
HeroCC/LS_COLORS
rupa/z
lukechilds/zsh-better-npm-completion
EOBUNDLES

antigen apply

# ================== Custom configurations ============

#
# Custom aliases
#

alias w='watch '

#
# Custom apps
#

export PATH="$PATH:$APPS"