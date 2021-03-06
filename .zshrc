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
# setxkbmap -option ctrl:swapcaps

##JDK
# export JAVA_HOME=/home/simowce/Downloads/jdk1.7.0_80/
# export JRE_HOME=${JAVA_HOME}/jre
# export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
# export PATH=${JAVA_HOME}/bin:$PATH

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
#alias go="cd ~ && ./go && cd ~/APUE"
alias ma="vim Makefile"
alias as="adb wait-for-device && adb root && adb shell"
alias perfdump="adb wait-for-device && adb root && adb shell am start com.qualcomm.qti.perfdump/.MainActivity"
alias al="adb logcat | grep "
alias systrace="/home/simowce/Android/Sdk/platform-tools/systrace/systrace.py"
alias gc="git clone"
alias gs="git status"

#startup
#go

#some useful function
mkd() { mkdir -p "$1"; cd "$1"; }
cls() { cd "$1"; ls; }
gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'}
CC() {gcc -o "$1" "$1.c";}
delf() {
	ls -l | awk '$1 ~ /d[a-z\-]{6}/ {printf "%s %s\n", $1,$9}' | awk '{print $2}' | xargs rm -r
}
latest() {
	ls -lt | head -n 2 | grep -v total | awk '{print $9}'
}
un() {
	zip_log=$1
	log_file=`unzip $zip_log | grep "bugreport_" | sed 's/inflating: //g'`
	echo "The log name is $log_file"
	vim $(echo $log_file | sed 's/ //g')
}
unl() {
	delf
	zip_log=`latest`
	echo "The zip name is $zip_log"
	log_file=`unzip $zip_log | grep "bugreport_" | sed 's/inflating: //g'`
	echo "The log name is $log_file"
	delf
	vim $(echo $log_file | sed 's/ //g')
	delf
}
zrc(){
	vim ~/.zshrc
	source ~/.zshrc
	echo "Done: update zsh configure file."
}
gls() {
    adb wait-for-device
    adb root
    atrace=`adb shell "ls -t /sdcard/Perfdump/ | head -n 1"`
    adb pull /sdcard/Perfdump/$atrace /home/simowce/Work/Game/
    file_name=`echo $atrace | sed 's/\.*//g'`
    systrace --from-file /home/simowce/Work/Game/$atrace -o /home/simowce/Work/Game/$file_name.html
    xopen /home/simowce/Work/Game/$file_name.html
}
k() {
    adb wait-for-device
    adb root
    pid=`adb shell 'ps -e' | grep $1 | awk '{print $2}'`
    adb shell kill $pid
    pid=`adb shell 'ps ' | grep $1 | awk '{print $2}'`
    adb shell kill $pid
}
wt() {
    link="http://file.market.xiaomi.com/download/AppStore/"$1
    wget $link
}
st() {
    /home/simowce/Android/Sdk/platform-tools/systrace/systrace.py gfx input view webview wm am sm audio video camera hal app res dalvik rs bionic power pm ss database network adb sched irq i2c freq idle disk mmc load sync workq memreclaim regulators binder_driver binder_lock pagecache -t $1 -o ~/$2.html
}
ac() {
    adb logcat -c
}
arr() {
    adb root && adb remount
}
are() {
    adb reboot
}

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export TERM='xterm-256color'
export ANDROID_HOME="/home/simowce/Android/Sdk"
