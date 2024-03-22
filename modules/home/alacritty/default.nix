{ colorscheme, ... }: {
  programs.alacritty = {
    enable = true;
    # settings = {
    #   window = {
    #     decorations = "full";
    #     gtk_theme_variant = "dark";
    #     opacity = 0.8;
    #   };

    #   font = {
    #     normal = {
    #       family = "Cascadia Code";
    #       style = "Regular";
    #     };
    #     bold = {
    #       family = "Cascadia Code";
    #       style = "Bold";
    #     };
    #     italic = {
    #       family = "Cascadia Code";
    #       style = "Italic";
    #     };

    #     style = 10;
    #     use_thin_strokes = true;
    #   };

    #   colors = {
    #     primary.background = color.bg;
    #     primary.foreground = color.fg;
    #     cursor.text = color.bg;
    #     cursor.cursor = color.normal.red;

    #     normal = color.normal;
    #     bright = color.abnormal;
    #   };

    #   bell = {
    #     animation = "EaseOutExpo";
    #     duration = 100;
    #     color = "#ffffff"; # color.light_bg;
    #   };
    # };
  };
  home.file.".config/alacritty/alacritty.yml".source = ./config.yml;
}
