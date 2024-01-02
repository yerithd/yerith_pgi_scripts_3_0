# ~/.bashrc: executed by bash(1) for non-login shells.

PATH=/sbin:${PATH}
PATH=.:${HOME}/yerith_pgi_scripts_3_0:${PATH}

export PATH

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
 export LS_OPTIONS='--file-type --color=auto -h'
 eval "`dircolors`"
 alias ls='ls $LS_OPTIONS'
 alias ll='ls $LS_OPTIONS -l'
 alias la='ls $LS_OPTIONS -al'
 alias l='ls $LS_OPTIONS -h'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
