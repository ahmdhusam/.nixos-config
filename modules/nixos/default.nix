{ ... }:
{
  imports = [
    ./shell.nix
    ./sound.nix
    ./nvidia.nix
    ./power-managment.nix
    ./docker.nix
    ./pkgs.nix
    ./root.nix
    ./nvme.nix
    ./locales.nix
    ./bootloader.nix
    ./networking.nix
    ./desktop-environment.nix
  ];
}
