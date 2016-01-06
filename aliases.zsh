alias sz='source ~/.zshrc'
aliases() {
    < $ZSH_CUSTOM/aliases.zsh | grep "^alias\s" | sed -e 's/alias //' -e 's/=/ = /' | less
}

alias ll='ls -al'
alias lh='ls -dl .*' # show hidden files/directories only
alias lsd='ls -ahlG'
alias filecount='find . -type f | wc -l' # number of files (not directories)

alias e='echo'
alias clr="clear"
alias bk='cd $OLDPWD'

# android
alias logcat='adb logcat -v time'
alias logd="adb logcat -v time -d > $1"
alias adbr='adb kill-server; adb start-server'

# git
alias g="git"
alias gco="git checkout"
alias gst="git status"
alias gl="git l" #requires .gitconfig
alias gll="git ll" #requires .gitconfig
alias gitdir="git rev-parse --git-dir"

# repo
alias r="repo"
alias rsy="repo sync"
alias rst="repo status"

# Mac OSX fix bluetooth audio quality
alias fixbt="defaults write com.apple.BluetoothAudioAgent \"Apple Bitpool Min (editable)\" 53"

# Source: http://aur.archlinux.org/packages/lolbash/lolbash/lolbash.sh
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias rtfm='man'
alias visible='echo'
alias invisible='cat'
alias moar='more'
alias icanhas='mkdir'
alias donotwant='rm'
alias dowant='cp'
alias gtfo='mv'
alias hai='cd'
alias plz='pwd'
alias inur='locate'
alias nomz='ps aux | less'
alias nomnom='killall'
alias cya='reboot'
alias kthxbai='halt'
