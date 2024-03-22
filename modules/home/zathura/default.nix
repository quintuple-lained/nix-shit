{ pkgs, lib, ... }: {
  programs.zathura = {
    enable = true;

    options = {
      # default-bg = "#1C1E26";
      # default-fg = "#232530";

      # statusbar-fg = "#9DA0A2";
      # statusbar-bg = "#2E303E";

      # inputbar-bg = "#1C1E26";
      # inputbar-fg = "#E3E6EE";

      # notification-bg = "#1C1E26";
      # notification-fg = "#E3E6EE";

      # notification-error-bg = "#1C1E26";
      # notification-error-fg = "#E93C58";

      # notification-warning-bg = "#1C1E26";
      # notification-warning-fg = "#E93C58";

      # highlight-color = "#EFB993";
      # highlight-active-color = "#DF5273";

      # completion-bg = "#232530";
      # completion-fg = "#DF5273";

      # completion-highlight-fg = "#E3E6EE";
      # completion-highlight-bg = "#DF5273";

      # recolor-lightcolor = "#1C1E26";
      # recolor-darkcolor = "#DCDFE4";

      # recolor = "false";
      # recolor-keephue = "false";
    };
  };
}
