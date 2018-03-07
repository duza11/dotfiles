#!/bin/sh

cd `dirname $0`

for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".vim" ] && ln -snfv `pwd`/"$f" "$HOME"/.config/nvim
    #echo `pwd`/$f
    ln -snfv `pwd`/"$f" "$HOME"/"$f"
done
