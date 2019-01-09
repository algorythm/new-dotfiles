export TERM="xterm-256color"
export ZSH=~/.oh-my-zsh
# #### POWERLEVEL9K ####
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context ssh dir root_indicator dir_writable)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs nvm virtualenv)

# # Disable dir/git icons
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
git
docker
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
