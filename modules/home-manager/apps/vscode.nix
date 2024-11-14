{ pkgs, rootUser, ... }:
{
  programs.vscode = {
    enable = true;
    # search with "vscode-extensions zig"
    extensions = with pkgs.vscode-extensions; [
      # js/ts
      christian-kohler.path-intellisense
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      prisma.prisma

      # database
      cweijan.dbclient-jdbc
      cweijan.vscode-database-client2

      # ziglang
      ziglang.vscode-zig

      # c/c++
      ms-vscode.cmake-tools
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack
      pkief.material-icon-theme
      twxs.cmake
      vadimcn.vscode-lldb
      xaver.clang-format

      # nix
      jnoortheen.nix-ide
      arrterian.nix-env-selector

      # others
      eamodio.gitlens
      gruntfuggly.todo-tree
      hediet.vscode-drawio
      humao.rest-client
      usernamehw.errorlens

      # # missed
      # fabiospampinato.vscode-todo-plus
      # rangav.vscode-thunder-client
      # hediet.debug-visualizer
      # pnp.polacode
    ];

    userSettings = {
      "editor.formatOnSave" = true;

      "workbench.iconTheme" = "material-icon-theme";
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "conventionalCommits.showNewVersionNotes" = false;
      "continue.enableTabAutocomplete" = false;

      #### zig
      "zig.initialSetupDone" = false;
      "zig.formattingProvider" = "zls";
      "zig.path" = "zig";
      "zig.zls.checkForUpdate" = false;
      "zig.zls.enableAutofix" = true;
      "zig.zls.path" = "zls";
      "zig.zls.warnStyle" = true;

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
              "expr" = "(builtins.getFlake \"/home/${rootUser}/.nixos-config/\").nixosConfigurations.CONFIGNAME.options";
            };
            "home_manager" = {
              "expr" = "(builtins.getFlake \"/home/${rootUser}/.nixos-config/\").homeConfigurations.CONFIGNAME.options";
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
