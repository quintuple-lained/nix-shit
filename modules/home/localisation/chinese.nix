{ config, pkgs, lib, ... }: {

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-gtk fcitx5-rime ];
  };

  home.packages = with pkgs; [ source-han-sans source-han-serif librime ];
}
