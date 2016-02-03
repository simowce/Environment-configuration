# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:/home/simowce/.code

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# open tmux when terminal startup
#if which tmux 2>&1 >/dev/null; then
	#test -z "$TMUX" && (tmux)
#fi

# swap the ctrl key and the cap key, see "man xkeyboard-config"
setxkbmap -option ctrl:swapcaps

#map some key
alias ll='ls -al --color'
alias sql='sqlite3'
alias install='sudo apt-get install'
alias update='sudo apt-get update'
alias blog="jekyll server"
alias sd="sudo shutdown -h 0"
alias rb="sudo reboot"
alias e="exit"
alias tags="ctags -R ./"
alias um="sudo umount /mnt/floppy"
alias g="grep -rn --color=auto"
alias b="bochs -q"
alias v="vim"
alias tmux="TERM=screen-256color-bce tmux"
alias tls="tmux ls"
alias killsession="tmux kill-session -t"
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias trc="vim ~/.tmux.conf"
alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"
alias wifion="sudo ap-hotspot start"
alias wifioff="sudo ap-hotspot stop"
alias update="sudo apt-get update"
alias xopen="xdg-open"
alias gclone="git clone"
alias vpnon="sudo nmcli con up id Singapore"
alias vpnoff="sudo nmcli con down id Singapore"
alias mountF="sudo mount /dev/sda3 /mnt/ntfs/Future && cd /mnt/ntfs/Future"
alias umountF="cd ~ && sudo umount /dev/sda3"
alias mountM="sudo mount /dev/sda5 /mnt/ntfs/Media && cd /mnt/ntfs/Media"
alias umountM="cd ~ && sudo umount /dev/sda5"
alias mountU="sudo mount -t vfat /dev/sdb1 /mnt/ntfs/U-disk && cd /mnt/ntfs/U-disk"
alias umountU="cd ~ && sudo umount /mnt/ntfs/U-disk"
alias mountS="sudo mount /dev/sda2 /mnt/System && cd /mnt/System"
alias umountS="cd ~ && umount /mnt/System"
alias standby="xset dpmp force standby"
alias mf="vim Makefile"
alias go="cd ~ && ./go && cd ~/APUE"
alias ma="vim Makefile"

#startup
#go

#some useful function
mkd() { mkdir -p "$1"; cd "$1"; }
cls() { cd "$1"; ls; }
gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'}
CC() {gcc -o "$1" "$1.c";}

#map some file
alias -s c=vim
alias -s h=vim
alias -s asm=vim
alias -s qml=vim
alias -s cpp=vim

#map some path
hash -d myblog="/home/simowce/simowce.github.com"
hash -d orage="/home/simowce/Documents/orange"
hash -d os="/home/simowce/Code-analysis-of-orange-os"
hash -d c="/home/simowce/Documents/C"

#autojump
[[ -s /home/simowce/.autojump/etc/profile.d/autojump.sh  ]] && source /home/simowce/.autojump/etc/profile.d/autojump.sh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
