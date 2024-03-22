{ config, pkgs, lib, ... }:
let colorscheme = import ../colorschemes/rose-pine.nix;
in {
  imports = [
    ../zathura
    ../kitty
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "22.05";

  home.username = "zoe";
  home.homeDirectory = "/home/zoe";

  services = {
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
    userName = "quintuple-lained";
    userEmail = "quintuple_lained@proton.me";
  };

  programs.nix-index.enable = true;
  programs.command-not-found.enable =
    lib.mkForce false; # i hate that, get it away from me

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "vim";
  };

  # all the stuff i use/need
  home.packages = let
    # all the tools and stuff i need to do dev
    dev-stuff = with pkgs; [
      nixfmt
      #binutils
      #cascadia-code
      direnv
      fd
	fish
      git
      #irony-server  # can't get emacs to recognise that
      #kicad-small
      kicad
      alacritty
      #openscad
      patchelf
      ripgrep
      tio
      usbutils
    ];

    fonts = with pkgs; [ montserrat source-code-pro vollkorn ];

    # misc tools and stuff to make my life easier
    misc-stuff = with pkgs; [
      adl
      bitwarden
      bottom
      comma
      easyeffects
      #linuxPackages_zen.cpupower
      hyfetch
      nix-index
      openvpn
      #pinentry
      #pinentry-curses
      ponymix
      tree
      wireguard-tools
      yt-dlp
      zoxide
      #plover.dev
    ];

    # graphical applications
    graphical-stuff = with pkgs; [
      #calibre
      # (discord.override { nss = pkgs.nss_3_82; })
      calibre
      discord
      firefox
      krita
      libreoffice
      mpv
      #protonvpn-gui
      #solaar
      tdesktop
      tor-browser-bundle-bin
      transmission-gtk
      #vlc
      zathura
    ];

    game-stuff = with pkgs; [
      #adom
      libgdiplus
      (steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            gtk3
            zlib
            dbus
            freetype
            glib
            atk
            cairo
            gdk-pixbuf
            pango
            python3
            fontconfig
            xorg.libxcb
            libpng
          ];
      })
      steam-run
      steam-run-native
    ];

  in dev-stuff ++ misc-stuff ++ graphical-stuff ++ game-stuff ++ fonts;
}
