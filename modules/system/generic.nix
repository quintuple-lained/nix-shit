{ config, pkgs, lib, ... }:
let
   blocklist = builtins.fetchurl
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
in {
  boot = {
    loader.timeout = 5;
    initrd.compressor = "zstd";

    # make it quiet
    consoleLogLevel = 0;
    kernelParams = [ "quiet" "systemd.show_status=auto" ];
  };

  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "Europe/Berlin";

#   networking.extraHosts = ''

#    ${lib.readFile blocklist}
# '';

  sound.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  system.stateVersion = "22.05"; # Did you read the comment?
  system.autoUpgrade.enable = false;

  # currently broken, one has to set that in the nixpkgs you supply directly
  #nixpkgs.config.allowUnfree = true;
  #pkgs.config.allowUnfree = true;

  nix = {
    # living on the edge
    package = pkgs.nixVersions.unstable;

    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = ''
        --delete-older-than 14d
      '';
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };

  users.users.freja = {
    shell = pkgs.zsh;
    isNormalUser = true;
    autoSubUidGidRange = true;
    home = "/home/freja";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    # i tend to forget to add a passward when setting up
    initialHashedPassword =
      "$y$j9T$t3NrDHuB4i3UTu3TlDUWj/$utvDj26jLNNhQK4QXJjwkEjtVAf10EuvDtJYDJrz5WD";
  };
	users.users.zoe = {
		shell = pkgs.zsh;
		isNormalUser = true;
		autoSubUidGidRange = true;
		home = "/home/zoe";
    		extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
	};

  programs.zsh.enable = true;

  # just the basics
  environment.systemPackages = with pkgs; [
    #binutils
    #coreutils
    git
    curl
    wget
    firefox
    neovim
  ];
}
