{ ... }: {
  boot.cleanTmpDir = true;

  users.users.pihole = {
    isSystemUser = true;
    initialPassword = "pihole";
    autoSubUidGidRange = true;
    group = "pihole";
  };

  users.groups.pihole = { };

  services.pihole = {
    enable = true;
    hostConfig = {
      user = "pihole";
      enableLingeringForUser = true;

      persistVolumes = true;

      dnsPort = 5335;
      webPort = 8080;
    };

    #   piholeConfig.ftl = {
    #     LOCAL_IPV4 = "192.168.0.2";
    #   }

    piholeConfig.web = {
      virtualHost = "pi.hole";
      password = "pihole";
    };
  };
}
