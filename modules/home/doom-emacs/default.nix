{ config, pkgs, ... }: {
  # home.file.".doom.d/init.el".source = config.lib.file.mkOutOfStoreSymlink
  #   "${config.home.homeDirectory}/.dotfiles/modules/home/doom-emacs/init.el";
  # home.file.".doom.d/config.el".source = config.lib.file.mkOutOfStoreSymlink
  #   "${config.home.homeDirectory}/.dotfiles/modules/home/doom-emacs/config.el";
  # home.file.".doom.d/packages.el".source = config.lib.file.mkOutOfStoreSymlink
  #   "${config.home.homeDirectory}/.dotfiles/modules/home/doom-emacs/packages.el";

  home.file.".doom.d/init.el".source = ./init.el;
  home.file.".doom.d/config.el".source = ./config.el;
  home.file.".doom.d/packages.el".source = ./packages.el;
  home.file.".doom.d/themes/doom-rose-pine-theme.el".source =
    ./themes/doom-rose-pine-theme.el;
home.file.".doom.d/themes/doom-rose-pine-moon-theme.el".source = ./themes/doom-rose-pine-moon-theme.el;

  home.packages = with pkgs; [ graphviz symbola ];
}
