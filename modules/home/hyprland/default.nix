{ pkgs, lib, inputs, system, ... }:
let
  hyprbar = pkgs.symlinkJoin {
    name = "hyprbar-hyprctl";
    paths = [ inputs.hyprland.packages.${system}.waybar-hyprland ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/waybar \
      --prefix PATH : ${lib.makeBinPath [ pkgs.hyprland ]}
    '';
  };
in {
  imports = [ inputs.hyprland.homeManagerModules.default ];
  wayland.windowManager.hyprland = {
    enable = true;
    # extraConfig = builtins.readFile ./hyprland.conf;
  };

  home.packages = with pkgs; [
    glib
    grim
    # hyprbar
    mako
    slurp
	waybar
    wdisplays
    wl-clipboard
    xdg-utils
	rofi-wayland
  ];
}
