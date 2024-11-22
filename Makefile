env:
	@nix-shell shell-install.nix

install:
	@sudo nixos-rebuild switch --flake .
