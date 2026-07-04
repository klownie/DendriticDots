{
  flake.modules.nixos.nextcloud = { pkgs, ... }: {

    age.secrets.nextcloud-admin-password = {
        file = ../.secrets/nextcloud-admin-password.age;
        owner = "nextcloud";
        group = "nextcloud";
    };
	
    networking.firewall.allowedTCPPorts = [ 80 443 ];

    services.nextcloud = {
      enable = true;
      hostName = "portfolio.klownie.me";
      https = true;
      datadir = "/mnt/storage";
      package = pkgs.nextcloud33;
      config.adminuser = "klownie";
      config.adminpassFile = "/run/agenix/nextcloud-admin-password";
      config.dbtype = "sqlite";
      settings = {
	      trusted_domains = [ "192.168.1.97" "192.168.1.88" "37.60.255.83" "portfolio.klownie.me"];
        enabledPreviewProviders = [
          "OC\\Preview\\BMP"
          "OC\\Preview\\GIF"
          "OC\\Preview\\JPEG"
          "OC\\Preview\\Krita"
          "OC\\Preview\\MarkDown"
          "OC\\Preview\\MP3"
          "OC\\Preview\\OpenDocument"
          "OC\\Preview\\PNG"
          "OC\\Preview\\TXT"
          "OC\\Preview\\XBitmap"
          "OC\\Preview\\HEIC"
        ];
      };

    };
  };
}
