#!/bin/bash

C=2
GREP='.'
if [ $# -eq 1 ]
then
    C=$1
    GREP='[*#/]'
fi

sh wiki-tests.sh Regression tg fa update | grep -C $C "$GREP"


