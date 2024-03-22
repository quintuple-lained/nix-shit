{ config, pkgs, ... }: {
  boot = {
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 7;

      memtest86.enable = true;
    };
    initrd.supportedFilesystems = [ "btrfs" ];
  };

  networking = {
    hostName = "shitbag";

    useDHCP = false; # enabling it globally is depreciated
    interfaces.enp8s0.useDHCP = true;

    networkmanager.enable = true;
  };

  services.openssh.enable = true;

  services.btrfs.autoScrub.enable = true;

  services.xserver = {
    enable = true;

    #videoDrivers = [ "amdggpu" "radeon" ];

    desktopManager.plasma5.enable = true;
    displayManager.sddm = {
      enable = true;
      settings.Wayland.SessionDir =
        "${pkgs.plasma5Packages.plasma-workspace}/share/wayland-sessions";
    };
    xkb.layout = "eu";

    # wacom.enable = true;
    # modules = with pkgs; [ xf86_input_wacom ];
  };

  hardware.cpu.amd.updateMicrocode = true;

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    #extraPackages = with pkgs; [  ];
  };

  hardware.bluetooth.enable = true;

  hardware.steam-hardware.enable = true;

  powerManagement = { cpuFreqGovernor = "schedutil"; };

}
