#!/bin/sh

cd `dirname $0`

for f in .??*
do
	[ "$f" = ".git" ] && continue
	[ "$f" = ".gitignore" ] && continue
	if [ "$f" = ".nvim" ]; then
		ln -snfv `pwd`/"$f" "$HOME"/.config/nvim
	else
		ln -snfv `pwd`/"$f" "$HOME"/"$f"
	fi
done
