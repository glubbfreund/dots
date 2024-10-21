setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# general options
zle_highlight=('paste:none')
bindkey -v

# remove underline for paths
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
# remove underline also for sudo precommand
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
#  will first try to find a suggestion from your history, but,
#  if it can't find a match, will find a suggestion from the completion engine.
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# add addons (as debian package) and enable starship
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh-z/zsh-z.plugin.zsh

# keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# add alias and extend path
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias emacs='GTK_THEME=Adwaita:dark emacsclient -n -c -a "" -F "((fullscreen . fullboth))"'
alias tree='exa --tree --level=2'
alias ls='exa'
alias ip='ip -c'

# extend path variable
path+='/home/oli/src/apt-undo'
path+='/usr/local/go/bin'
path+='/home/oli/.local/share/nvim/mason/bin'

# set go variables
export GOPATH=$HOME/.go
export GOBIN=$HOME/.go/bin

# set xserver
# export DISPLAY=$(ip route | grep default | awk '{print $3; exit;}'):0.0
export GDK_DPI_SCALE=1.25

# enable starship
eval "$(starship init zsh)"

# sets newline after each command prompt
precmd() {
  precmd() {
    echo
  }
}
