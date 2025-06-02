#!/bin/bash

GR="\[\e[1;32m\]"
CY="\[\e[1;36m\]"
BL="\[\e[1;34m\]"
RES="\[\e[0m\]"

export PS1="${GR}\u${RES}@${CY}\h${RES} \n${BL}\w${RES}\n\$ "
