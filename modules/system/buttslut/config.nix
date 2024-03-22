{ config, pkgs, ... }: {

  boot = {
    # crashDump.enable = true;

    loader.systemd-boot = {
      enable = true;
      configurationLimit = 7;

      memtest86.enable = false;
    };
    initrd.supportedFilesystems = [ "btrfs" ];
  };

  location = {
    latitude = 49.36;
    longitude = 11.0;
  };

  networking = {
    hostName = "buttslut";

    networkmanager.enable = true;

    # wireguard likes to trip the firewall
    firewall = {
      # logReversePathDrops = true;
      extraCommands = ''
        ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
        ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN

        iptables -I INPUT -i wlp2s0f0u10u1 -p udp --dport 1714:1764 -m state --state NEW,ESTABLISHED -j ACCEPT
        iptables -I INPUT -i wlp2s0f0u10u1 -p tcp --dport 1714:1764 -m state --state NEW,ESTABLISHED -j ACCEPT
        iptables -A OUTPUT -o wlp2s0f0u10u1 -p udp --dport 1714:1764 -m state --state NEW,ESTABLISHED -j ACCEPT
        iptables -A OUTPUT -o wlp2s0f0u10u1 -p tcp --dport 1714:1764 -m state --state NEW,ESTABLISHED -j ACCEPT

      '';
      extraStopCommands = ''
        ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
        ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
      '';

    };
  };

  services.openssh.enable = true;

  services.borgbackup.jobs.home-freja = {
    paths = "/home/freja";
    repo = "/mnt/backup/home-freja";
    user = "freja";

    encryption.mode = "none";
    compression = "zstd,10";

    #startAt = "daily";
    #startAt = "00/3:00"; # every 3h
    startAt = "00/1:00";
    persistentTimer = true;

    prune.keep = {
      within = "32H";
      daily = 7;
      weekly = 4;
      monthly = 4;
    };

    exclude = [
      # Largest cache dirs
      "/home/freja/.cache"
      "*/cache2" # firefox
      "*/Cache"
      "*/.container-diff"
      "/home/freja/.npm/_cacache"
      # Work related dirs
      "*/_build"
      "*/venv"
      "*/.venv"
      "*.tmp"
      "*/result" # i don't need to copy over half the store
      "*/.direnv"
      # some misc stuff
      #"/home/freja/.config"
      "/home/freja/.local/share/"
      "/home/freja/Videos"
    ];
  };

  services.btrfs.autoScrub.enable = true;

  services.xserver = {
    enable = true;

    videoDrivers = [ "nvidia" ];

    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    xkb.layout = "eu";

    wacom.enable = true;
    modules = with pkgs; [ xf86_input_wacom ];
  };

  # programs.hyprland = {
  #   enable = false;
  #   package =
  #     inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  # };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ libva libvdpau-va-gl nvidia-vaapi-driver ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true; # to fix suspend n stuff
    nvidiaSettings = true;
  };

  hardware.steam-hardware.enable = true;
  hardware.bluetooth.enable = true;

  hardware.cpu.amd.updateMicrocode = true;
  powerManagement = { cpuFreqGovernor = "schedutil"; };

  services.udev.packages = with pkgs; [ qmk-udev-rules ];
}
