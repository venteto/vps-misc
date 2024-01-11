# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# yellow
export PS1="\e[0;33m${debian_chroot:+($debian_chroot)}\u@\h:\w\$ \e[m"
export PS2="\e[0;33m>\e[m"

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto --group-directories-first'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
# new
alias lh='ls $LS_OPTIONS -lAh'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# cyan key, red delimiter (==)
function penv () {
    # we don't want to add to the env output with color variables
    local CYAN='\033[0;36m'
    local RED='\033[0;31m'
    local NC='\033[0m' # No Color

    while IFS='=' read -r key val ; do
        echo -e "  ${CYAN}$key ${RED}==${NC} $val"
    done <<< $(env -0 | sort -z | tr '\0' '\n')
}