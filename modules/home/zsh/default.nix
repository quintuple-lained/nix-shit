{ config, pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;

    autocd = true;
    enableCompletion = true;

    shellAliases = {
      ".." = "cd ..";
      ls = "ls --color";
      la = "ls --color -a";
      ll = "ls --color -la";
      flake = "nix flake";
      rebuild =
        "nixos-rebuild --use-remote-sudo --flake ~/.dotfiles --option pure-eval no --cores 0 -j 2 --verbose -L --recreate-lock-file";
      spotify-sleeptimer =
        "spt pb -s && echo 'sleep 90' && sleep 90m && spt pb -t";
    };

    initExtra = ''
      eval "$(zoxide init zsh)"
      eval "$(direnv hook zsh)"
      # i could do this per plugins but i don't want too many nested folders lel
      ${builtins.readFile ./p10k.zsh}
    '';

    envExtra = ''
      PATH=''${HOME}/.emacs.d/bin/:''${HOME}/.dotfiles/bin/:''${PATH}
    '';

    profileExtra = ''
      "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
    '';

    plugins = with pkgs; [
      {
        name = "powerlevel10k";
        src = zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "autosuggestion";
        src = zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
    ];
  };

  home.packages = with pkgs; [ zsh ];
}
