{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/.nixos-config/";
      in
      {
        gll = "ls -l";
        update = "nixfmt ${flakeDir} && sudo nixos-rebuild switch --flake ${flakeDir}";

        ls = "eza --icons -l -T -L=1";
        cat = "bat";
        htop = "btm";
        fd = "fd -Lu";
        w3m = "w3m -no-cookie -v";
        neofetch = "neofetch";
        "," = "comma";
        open = "xdg-open";

        man = "BAT_THEME='default' batman";
        l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
        ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
        tree = "eza --icons --tree --group-directories-first";

      };

    initExtra = ''
      PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
       %F{green}→%f "
      RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
      [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
      bindkey '^P' history-beginning-search-backward
      bindkey '^N' history-beginning-search-forward
    '';

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      # theme = "agnoster"; # blinks is also really nice
      theme = "blinks"; # blinks is also really nice
    };
  };

}
