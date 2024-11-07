{
  programs.git = {
    enable = true;
    userName = "Ahmed";
    userEmail = "ahmdhusam7@gmail.com";
    aliases = {
      prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      head-forword = "git checkout $(git rev-list --topo-order HEAD..master | tail -20 | head -1)";

    };
    extraConfig = {
      # branch.autosetuprebase = "always";
      color.ui = true;
      # core.askPass = ""; # needs to be empty to use terminal for ask pass
      # credential.helper = "store"; # want to make this more secure
      # github.user = "ahmdhusam";
      # push.default = "tracking";
      init.defaultBranch = "main";
    };
  };
}
