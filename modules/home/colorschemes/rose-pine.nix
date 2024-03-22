rec {
  name = "rose pine";

  color = {
    fg = "#e0def4";
    bg = "#191724";
    light_bg = "#2a2837";

    url_color = "#c4a7e7";

    normal = {
      black = "#26233a";
      red = "#eb6f92";
      green = "#31748f";
      yellow = "#f6c177";
      blue = "#9ccfd8";
      magenta = "#c4a7e7";
      cyan = "#ebbcba";
      white = "#e0def4";
    };

    abnormal = {
      black = "#6e6a86";
      red = "#eb6f92";
      green = "#31748f";
      yellow = "#f6c177";
      blue = "#9ccfd8";
      magenta = "#c4a7e7";
      cyan = "#ebbcba";
      white = "#e0def4";
    };
  };
  #gtk-theme = pkgs.rose-pine-gtk-theme-unstable;
}
