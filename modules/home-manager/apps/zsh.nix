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

        lsof = "formatedLsof(){ sudo lsof -p $1 | grep REG } ; formatedLsof";
        pfd = "pfd(){ sudo ls -la /proc/$1/fd } ; pfd";

        iotop = "sudo iotop -Poa";

        ytlf = "./yt-dlp_linux -N 8 -o \"%(uploader)s/%(playlist)s/%(playlist_index)s.%(title)s.%(ext)s\" --list-formats -f 22 ";
        ytd = "./yt-dlp_linux -N 8 -o \"%(uploader)s/%(playlist)s/%(playlist_index)s.%(title)s.%(ext)s\" -f 22 ";
        ytdr = "./yt-dlp_linux -N 8 -o \"yt/%(uploader)s/%(playlist)s/%(video_autonumber)s.%(title)s.%(ext)s\" -f 22 --playlist-reverse ";

        find-hash-with-sleep = "find-hash-with-sleep() { find $1 -maxdepth 1 -type f -exec sha256sum {} \\; -exec sleep $2 \\;  }; find-hash-with-sleep";

        trace-io = "sudo strace -f -t -e trace=file -p "; # sudo strace -f -t -e trace=file -p 1816

        mount-tmpram = "sudo mount -t tmpfs -o size=15G tmpfs /home/ahmed/Desktop/tmpram/";

        # TODO: append sudo docker run -d --gpus=all -v $(pwd)/.ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama 
        # sudo docker exec -it ollama ollama run llama3

        download-ls = "download-ls(){ wget -t 5 -c -T 5 -w 3 --content-disposition --trust-server-names -i $1 };download-ls ";

        du = "du -sh ";
        df-h = "df -hT";

        # TODO: Edit config path
        run-torrent = "sudo docker run --rm --env HTTP_PROXY=\"http://192.168.1.11:8082\" --env HTTPS_PROXY=\"http://192.168.1.11:8082\" -d --name=qbittorrent -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -e WEBUI_PORT=8080 -e TORRENTING_PORT=6881 -p 8080:8080 -p 6881:6881 -p 6881:6881/udp -v ./config:/config -v ~/Downloads/torrent:/downloads lscr.io/linuxserver/qbittorrent";
        
        ext4-features = "ext4-features(){ tune2fs -l $1 | grep features } ; ext4-features"; # sudo tune2fs -l /dev/sda2
        disable-ext4-journaling = "disable-ext4-journaling(){ umount $1 && tune2fs -O ^has_journal $1 } ; disable-ext4-journaling"; # sudo tune2fs -l /dev/sda2
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
