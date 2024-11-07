{ pkgs, rootUser, ... }:
{
  programs.vscode = {
    enable = true;
    # search with "vscode-extensions zig"
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      # vscodevim.vim
      ziglang.vscode-zig
      arrterian.nix-env-selector

    ];

    userSettings = {
      "editor.formatOnSave" = true;

      #### NixIDE
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.formatterPath" = "nixfmt";
      "nix.serverSettings" = {
        "nixd" = {
          nixpkgs = {
            expr = "import <nixpkgs> { }";
          };
          # "eval" = { };
          "formatting" = {
            "command" = "nixfmt";
          };
          "options" = {

            # "enable" = true;
            "nixos" = {
              "expr" = "(builtins.getFlake \"/home/${rootUser}/Desktop/nixos-config/\").nixosConfigurations.CONFIGNAME.options";
            };
            "home_manager" = {
              "expr" = "(builtins.getFlake \"/home/${rootUser}/Desktop/nixos-config/\").homeConfigurations.CONFIGNAME.options";
            };
          };
          # "options" = {
          #   "enable" = true;
          #   "target" = {
          #     "args" = [ ];
          #     ## NixOS options
          #     # "installable" = "<flakeref>#nixosConfigurations.<name>.options";
          #     ## Flake-parts options
          #     # "installable" = "<flakeref>#debug.options";
          #     ## Home-manager options
          #     # "installable" = "<flakeref>#homeConfigurations.<name>.options";
          #   };
          # };
        };
      };
    };
  };

}
