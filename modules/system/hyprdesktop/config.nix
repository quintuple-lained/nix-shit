{ config, pkgs, ... }: {

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
    hostName = "hyprdesktop";

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

  services.xserver = {
    enable = true;

    videoDrivers = [ "nvidia" ];

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
