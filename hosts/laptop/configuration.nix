# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  lib,
  inputs,
  nixosVersion,
  rootUser,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.auto-cpufreq.nixosModules.default
    # leave it to make it like an example for passing params when importing.
    # (import ../../modules { pkgs = pkgs; })
    ../../modules
    # inputs.home-manager.nixosModules.default
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  root.enable = true;
  root.userName = rootUser;

  # home-manager = {
  #   useGlobalPkgs = true;
  #   useUserPackages = true;

  #   users.${rootUser} = import ./home.nix;
  #   extraSpecialArgs = {
  #     inherit inputs nixosVersion rootUser;
  #   };
  # };

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  services.journald.extraConfig = "SystemMaxUse=50M\nSystemMaxFiles=5";
  services.journald.rateLimitBurst = 500;
  services.journald.rateLimitInterval = "120s";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # Enabling flakes

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = nixosVersion; # Did you read the comment?

}
