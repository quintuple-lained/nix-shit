{ config, pkgs, lib, ... }:
let colorscheme = import ../colorschemes/rose-pine.nix;
in {
  imports = [ ../doom-emacs ../alacritty ../zsh ../zathura ];

  programs.home-manager.enable = true;
  home.stateVersion = "22.05";

  home.username = "freja";
  home.homeDirectory = "/home/freja";

  services = {
    emacs.enable = false;
    lorri.enable = true;
    gpg-agent = {
      enable = true;
      pinentryFlavor = "curses";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.gpg.enable = true;

  programs.git = {
    enable = true;
    userName = "Liv";
    userEmail = "freja.wegert@proton.me";
  };

  programs.nix-index.enable = true;
  programs.command-not-found.enable = false; # i hate that, get it away from me

  # all the stuff i use/need
  home.packages = let
    # all the tools and stuff i need to do dev
    dev-stuff = with pkgs; [
      alacritty
      #binutils
      #cascadia-code
      direnv
      emacs
      fd
      git
     # patchelf
      ripgrep
      source-code-pro
      #tio
      usbutils
    ];

    # misc tools and stuff to make my life easier
    misc-stuff = with pkgs; [
      #btm
      btop
      comma
      hyfetch
      nix-index
      ponymix
      tree
      yt-dlp
      zoxide
      #plover.dev
    ];

    # graphical applications
    graphical-stuff = with pkgs; [
      discord
      firefox
      zathura
    ];

    game-stuff = with pkgs; [
      #adom
      # libgdiplus
      # (steam.override {
      #   extraPkgs = pkgs:
      #     with pkgs; [
      #       gtk3
      #       zlib
      #       dbus
      #       freetype
      #       glib
      #       atk
      #       cairo
      #       gdk-pixbuf
      #       pango
      #       fontconfig
      #       xorg.libxcb
      #       libpng
      #     ];
      # })
      # steam-run
      # steam-run-native
    ];

  in dev-stuff ++ misc-stuff ++ graphical-stuff ++ game-stuff;
}
