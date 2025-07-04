# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# alias clurl='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --profile-directory="Profile 1" "$(yq '''.url''' ~/current-course/info.yaml)"'
# export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
# export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
# eval "$(zoxide init zsh)"
# 
# 
# 
# # >>> mamba initialize >>>
# # !! Contents within this block are managed by 'mamba init' !!
# export MAMBA_EXE='/opt/homebrew/bin/micromamba';
# export MAMBA_ROOT_PREFIX='/Users/dennycao/micromamba';
# __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__mamba_setup"
# else
#     alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
# fi
# unset __mamba_setup
# # <<< mamba initialize <<<
# 
# # bison
# export CFLAGS="-I/opt/bison/bison-3.7.91/share/include ${CFLAGS}"
# export CXXFLAGS="-I/opt/bison/bison-3.7.91/share/include ${CXXFLAGS}"
# export LDFLAGS="-L/opt/bison/bison-3.7.91/lib ${LDFLAGS}"
# export PATH="/opt/bison/bison-3.7.91/bin:${PATH}"
# 
# # flex
# export CFLAGS="-I/opt/flex/flex-2.6.4/include ${CFLAGS}"
# export CXXFLAGS="-I/opt/flex/flex-2.6.4/include ${CXXFLAGS}"
# export LDFLAGS="-L/opt/flex/flex-2.6.4/lib ${LDFLAGS}"
# export PATH="/opt/flex/flex-2.6.4/bin:${PATH}"
# 
# export SYSTEMC_HOME="/Users/dennycao/systemc"
# 
# export VERILATOR_ROOT="/Users/dennycao/verilator"
# export PATH="/Users/dennycao/verilator/bin:${PATH}"
#
## Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
 __conda_setup="$('/Users/dennycao/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
 if [ $? -eq 0 ]; then
     eval "$__conda_setup"
 else
     if [ -f "/Users/dennycao/miniconda3/etc/profile.d/conda.sh" ]; then
         . "/Users/dennycao/miniconda3/etc/profile.d/conda.sh"
     else
         export PATH="/Users/dennycao/miniconda3/bin:$PATH"
     fi
 fi
 unset __conda_setup
# <<< conda initialize <<<
