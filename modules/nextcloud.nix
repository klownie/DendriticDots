{ inputs, config, ... }:{

  flake.modules.nixos.nextcloud = { pkgs, ... }: {
    environment.etc."nextcloud-admin-pass".text = "4EbwIvKTQ5aBe$@g*sGdq";
    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud32;
      hostName = "localhost";
      config.adminpassFile = "/etc/nextcloud-admin-pass";
      config.dbtype = "sqlite";
    };
  };

}
