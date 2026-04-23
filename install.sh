#!/bin/sh
set -e

cd "$(dirname "$0")"

has() {
	type "$1" > /dev/null 2>&1
}

install_nix() {
	echo "Install nix"
	curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install --enable-flakes
	. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
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
		nix run nixpkgs\#home-manager -- switch --flake github:duza11/dotfiles --impure -b backup
	fi
}

update_dotfiles() {
	!(has "nix") && install_nix
	update_lock=false
	while [ $# -gt 0 ]; do
		case "$1" in
			--upgrade)
				update_lock=true
				;;
		esac
		shift
	done
	if [ "$update_lock" == true ]; then
		nix flake update
	fi
	if [ $os == "darwin" ]; then
		!(has "brew") && install_brew
		sudo darwin-rebuild switch --flake .
	else
		nix run nixpkgs\#home-manager -- switch --flake . --impure -b backup
	fi
}

os=`uname | tr '[A-Z]' '[a-z]'`

subcommand="$1"
shift || true

case $subcommand in
	install)
		install_dotfiles
		;;
	update)
		upgrade=false
		if [ "$2" == "--upgrade" ]; then
			upgrade=true
		fi
		update_dotfiles $@
		;;
	"")
		install_dotfiles
		;;
	*)
		echo "$subcommand is not a command"
		exit 1
		;;
esac
