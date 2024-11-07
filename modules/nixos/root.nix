{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.root;
in
{
  options.root = {
    enable = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
      default = "root";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users = {
      defaultUserShell = pkgs.zsh;
      users = {

        ${cfg.userName} = {
          useDefaultShell = true;
          shell = pkgs.zsh;
          isNormalUser = true;
          description = "${cfg.userName}";
          home = "/home/${cfg.userName}";
          hashedPassword = "$6$SxtdwjPfPb8e6xqt$llLQP3l9IfguG76I8s6h1KpMI9hBiGK.DIAKADK0S/Ein9tZqdWt.O96BA0KlijUOwgzCwTAQC1tEgBr0xWLW1";
          extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
          ];
          packages = with pkgs; [ ];
        };
      };
    };
  };
}
