{ pkgs, lib, ... }: {
  programs.kitty = {
    enable = true;

    theme = "Rosé Pine";
  };

  home.packages = with pkgs; [ kitty ];
}
