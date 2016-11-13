# lines configured by zsh-newuser-install
histfile=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep extendedglob
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# User configuration
# ---
export EDITOR="/usr/bin/nvim"
export SYSTEM_EDITOR="/usr/bin/nvim"
export TERM="screen-256color"

# Symbols
arrow() {
  echo -e "\ue0b0"
}
branch() {
  echo -e "\ue0a0"
}

# VCS (git, etc) branch info
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats "$(branch) %b "

# Git flow completion
source ~/.zsh/git-flow-completion/git-flow-completion.zsh

# RVM
# source ~/.profile

# Colorization
autoload -Uz colors && colors

export PROMPT="%{$bg[white]%}%{$fg[black]%} ADJ %{$reset_color%}%{$fg[white]%}%{$bg[black]%}$(arrow) %3~ %{$reset_color%}%{$bg[yellow]%}%{$fg[black]%}$(arrow) \$vcs_info_msg_0_%{$reset_color%}%{$fg[yellow]%}$(arrow)%{$reset_color%} "

export PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin:$HOME/.cabal/bin"

# Bindings
bindkey "^[[1~" beginning-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[8~" end-of-line
bindkey "^[OF" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[OC" forward-word
bindkey "^[[1;5C" forward-word
bindkey "^[OD" backward-word
bindkey "^[[1;5D" backward-word

bindkey "^J" down-line-or-history
bindkey "^K" up-line-or-history

# Aliases
alias ls='ls --color=always'
alias vol='lemonvol'
alias mute='lemonvol M'
alias bl='light -S'
alias clock='date +%c'
alias rm='safe-rm'

alias cb='xclip -selection clipboard'
alias toriel='nctlup toriel'

alias vim='nvim'

# Git aliases
alias gst='git status'
alias gd='git diff'
alias gpod='git push origin development'
alias gap='git add -p .'

alias src='source ~/.zshrc'
alias vsrc='vim ~/.zshrc; source ~/.zshrc'

# Network stuff
ne(){
  sudo vim /etc/netctl/$1
}
alias nu='nctlup'
alias ns='sudo netctl status'
alias no='nctldown'

# Package management aliases and functions
alias pa='pacaur'
alias pas='pacaur -S --needed'
alias par='pacaur -Ru'
pprune() {
  getOrphans() {
    echo pacaur -Qdt | cut -d " " -f 1 | tr '\n' ' '
  }
  targets="$(getOrphans)"
  until [ -z "${target}" ]; do
    par ${targets}
    targets="$(getOrphans)"
  done

  echo "All orphans removed"
}
pfind() {
  # Search the Arch repo and AUR for a package with colors
  # This will one day become a program with searching functions
  pacaur -Ss --color always $1 | paste -d " " - - | sed 's/    /\//;s/\s{2,}//;s/\t//' | column -ts '/' -o " " | sed -E 's/^(.{'"$((  COLUMNS + 21 ))"'}).+$/\1.../' | less -RX
}

# Service management aliases
alias st='sudo systemctl start'
alias rst='sudo systemctl restart'
alias stp='sudo systemctl stop'
alias sts='sudo systemctl status'
alias rld='sudo systemctl reload'

# Video functions
video-on()  { xrandr --output $1 --auto }
video-off() { xrandr --output $1 --off }
alias video-up='video-on'
alias video-down='video-off'

declare -A replacements
replacements[o]=--output
replacements[V]=VGA-1
replacements[e]=eDP-1
replacements[H]=HDMI-1
replacements[left]=--left-of
replacements[right]=--right-of
replacements[off]=--off
replacements[on]=--auto
xr() {
  cmd=()
  for arg in $@; do
    idx=$(( ${#cmd[@]} + 1 ))
    if [[ ! -z "${replacements[${arg}]}" ]]; then
      cmd[${idx}]=${replacements[${arg}]}
    else
      cmd[${idx}]="${arg}"
    fi
  done
  echo "Running xrandr ${cmd[@]}"
  xrandr ${cmd[@]}
}

fix() {
  lb-restart &
  update-wallpaper
}

vleft() {
  xr o V on o e right V
  sleep 1
  fix
}

voff() {
  xr o V off
  sleep 1
  fix
}

alias ffont='fc-list | grep'

# Jump Script
j() {
  if [ ! -e "$HOME/.jumps/$1" ]; then
    echo "$1: No such jump"
  else
    cd "$(realpath $HOME/.jumps/$1)"
  fi
}

# Print battery percentage on startup
echo -e " Battery `batpct`"

# Source private, non vc'd stuff
source "$HOME/.zsh-profile"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
