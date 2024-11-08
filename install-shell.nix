{
  pkgs ? (import ./nixpkgs.nix) { },
}:
{
  default = pkgs.mkShell {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [
      nix
      home-manager
      git
      neovim
    ];

  shellHook = ''
    echo "Run \"sudo nixos-rebuild switch --flake .#nixos\""
  '';
  };
}
