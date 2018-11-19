# join arguments using $1 as separator, e.g. `join_by , a b c` returns "a,b,c"
join_by() {
    local IFS="$1";
    shift;
    echo "$*";
}

# append elements to PATH
append_path() {
    export PATH=$PATH:$(join_by : $@)
}

# compressed file extractor
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
extract() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutul mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted";;
        esac
    else
        echo "'$1' is not a file that can be extracted"
    fi
}

# my IP address
myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# shell function to define words
# http://vikros.tumblr.com/post/23750050330/cute-little-function-time
define() {
  if [[ $# -ge 2 ]] then
    echo "error: too many arguments" >&2
    return 1
  else
    curl "dict://dict.org/d:$1" | less
  fi
}

# Configures a git repo for gerrit by adding some git hooks
gerrit-init() {
    gitdir=`git rev-parse --git-dir` 2>/dev/null
    if [ "$?" -ne 0 ]
    then
        echo "ERROR: Not a git repository"
        return 1
    fi

    # get commit-msg hook
    echo "Copying commit-msg hook to ${gitdir}/hooks"
    curl -sSLo ${gitdir}/hooks/commit-msg \
        https://gerrit-review.googlesource.com/tools/hooks/commit-msg \
        && chmod +x ${gitdir}/hooks/commit-msg

    # copy pre-push hook
    echo "Copying pre-push hook to ${gitdir}/hooks"
    cp ${ZSH_CUSTOM}/gerrit-pre-push ${gitdir}/hooks/pre-push \
        && chmod +x ${gitdir}/hooks/pre-push

    # copy pre-push hook
    echo "Copying pre-commit hook to ${gitdir}/hooks"
    cp ${ZSH_CUSTOM}/gerrit-pre-commit ${gitdir}/hooks/pre-commit \
        && chmod +x ${gitdir}/hooks/pre-commit
}
