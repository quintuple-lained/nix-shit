{inputs, config, pkgs, ... }: {

  boot = {
    # crashDump.enable = true;

    loader.systemd-boot = {
      enable = true;
      configurationLimit = 7;

      memtest86.enable = false;
    };
  };

  location = {
    latitude = 52.1;
    longitude = 32.0;
  };

  networking = {
    hostName = "hyprpad";

    networkmanager.enable = true;

    # wireguard likes to trip the firewall
  };

  services.openssh.enable = true;

  services.xserver = {
    enable = true;

    videoDrivers = [ "nvidia" ];
	displayManager.sddm = {
	enable = true;
	wayland.enable = true;
    };

    xkb.layout = "us";

  };

  programs.hyprland = {
    enable = true;
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
   };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ libva libvdpau-va-gl ];
  };


  hardware.steam-hardware.enable = true;
  hardware.bluetooth.enable = true;

  hardware.cpu.amd.updateMicrocode = true;
  powerManagement = { cpuFreqGovernor = "schedutil"; };

  services.udev.packages = with pkgs; [ qmk-udev-rules ];
}
