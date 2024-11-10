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
      mutableUsers = false;
      users = {

        ${cfg.userName} = {
          useDefaultShell = true;
          shell = pkgs.zsh;
          isNormalUser = true;
          description = "${cfg.userName}";
          home = "/home/${cfg.userName}";
          # mkpasswd -m sha-512
          hashedPassword = "$6$ucPlpykBTHkyzcna$iKebHVjBWwF7YV9tDz/JzpTumiSOgNNTCWJK69oQNHdNpJU4DEJvUNOu7sD2M.Sn9QqMK0CUoLCFttif7ZWrp/";
          initialHashedPassword = "$6$ucPlpykBTHkyzcna$iKebHVjBWwF7YV9tDz/JzpTumiSOgNNTCWJK69oQNHdNpJU4DEJvUNOu7sD2M.Sn9QqMK0CUoLCFttif7ZWrp/";
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
