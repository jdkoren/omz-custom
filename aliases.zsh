alias sz='source ~/.zshrc'

alias aliases="alias | sed -e 's/=/ = /' | less"

alias l='ls -alhG'
alias ll='ls -alhG'
alias lh='ls -dl .*' # show hidden files/directories only
alias filecount='find . -type f | wc -l' # number of files (not directories)

alias e='echo'
alias clr="clear"
alias bk='cd $OLDPWD'

### android
alias logcat='adb logcat -v time'
alias logd="adb logcat -v time -d > $1"
alias adbr='adb kill-server; adb start-server'

### git
alias g="git"
alias gco="git checkout"
alias gst="git status"
alias gl="git l" #requires .gitconfig
alias gll="git ll" #requires .gitconfig
alias gitdir="git rev-parse --git-dir"
alias gitroot="git rev-parse --show-toplevel"
alias gfo="git fetch origin"
alias gfj="git fetch jdkoren"
alias gfg="git fetch goog"

### repo
alias r="repo"
alias rsy="repo sync"
alias rst="repo status"

alias utsl='man' # http://www.hacker-dictionary.com/terms/UTSL

### Source: http://aur.archlinux.org/packages/lolbash/lolbash/lolbash.sh
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias halp='man'
alias rtfm='man'
alias visible='echo'
alias invisible='cat'
alias moar='less'
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

### Mac OSX
if [[ $(uname) = 'Darwin' ]]
then
    # fix bluetooth audio quality
    alias fixbt="defaults write com.apple.BluetoothAudioAgent \"Apple Bitpool Min (editable)\" 53"
    # turn on/off keyboard accent menu
    alias accenton="defaults write -g ApplePressAndHoldEnabled -bool true"
    alias accentoff="defaults write -g ApplePressAndHoldEnabled -bool false"
fi
