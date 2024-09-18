#!/usr/bin/env bash

cd ~/ros/catkin_ws

source ~/ros/catkin_ws/devel/setup.bash

export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;91m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ "

alias src="source ~/.bashrc && source ~/ros/catkin_ws/devel/setup.bash"

git config --global user.email "sgttaseff1@sheffield.ac.uk"
git config --global user.name "Sam Taseff"
