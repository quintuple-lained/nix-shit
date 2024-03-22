{ pkgs, config, ... }: {
  # doesn't work
  # home.packages = with pkgs; [ plasma5Packages.bismuth libsForQt5.bismuth ];
  home.packages = with pkgs; [ kdeconnect ];
}
