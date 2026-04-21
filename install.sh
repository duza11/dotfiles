#!/bin/sh
set -e

cd "$(dirname "$0")"

has() {
	type "$1" > /dev/null 2>&1
}

install_nix() {
	echo "Install nix"
	curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install --enable-flakes
}

install_brew() {
	if !(xcode-select -p > /dev/null 2>&1); then
		echo "Install xcode-select"
		xcode-select --install
	fi
	echo "Install brew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_dotfiles() {
	!(has "nix") && install_nix
	if [ $os == "darwin" ]; then
		!(has "brew") && install_brew
		sudo nix run nix-darwin -- switch --flake github:duza11/dotfiles
	else
		nix run nixpkgs\#home-manager -- switch --flake github:duza11/dotfiles
	fi
}

update_dotfiles() {
	!(has "nix") && install_nix
	nix flake update
	if [ $os == "darwin" ]; then
		!(has "brew") && install_brew
		sudo darwin-rebuild switch --flake .
	else
		nix run nixpkgs\#home-manager -- switch --flake .
	fi
}

os=`uname | tr '[A-Z]' '[a-z]'`

subcommand="$1"
if [ "$subcommand" == "" ]; then
	install_dotfiles
fi
shift

case $subcommand in
	install)
		install_dotfiles
		;;
	update)
		update_dotfiles
		;;
	*)
		echo "$subcommand is not a command"
		exit 1
		;;
esac
