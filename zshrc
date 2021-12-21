# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
export XDG_CACHE_HOME=$HOME/.cache
autoload -Uz compinit
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

npm config set prefix $HOME/.npm-global
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/Flutter/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
#
#export CHROME_EXECUTABLE=`which chromium`
export PATH=/home/cht/Android/Sdk/cmdline-tools/latest/bin:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH=/home/cht/go/bin:$PATH
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
eval $(opam env --switch=default)
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH=$HOME/.luarocks/bin:$PATH
export PATH=$HOME/.deno/bin:$PATH
alias ls="exa -g --icons "
alias la="ls -la"
alias bmake="bear -- make"
#export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit load zdharma-continuum/history-search-multi-word

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
	zsh-users/zsh-autosuggestions \
	zdharma-continuum/fast-syntax-highlighting

source "$HOME/.local/share/zinit/omz/pyenv.plugin.zsh"
source "$HOME/.local/share/zinit/omz/zsh_plugin.zsh"
### End of Zinit's installer chunk
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e"  edit-command-line
#bindkey -M vicmd v edit-command-line
compinit
