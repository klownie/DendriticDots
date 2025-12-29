{ inputs, config, ... }:{

  flake.modules.nixos.anubis = {
    services.anubis = {
      defaultOptions.settings = {
        OG_PASSTHROUGH = true;
        OG_EXPIRY_TIME = "1h";
        COOKIE_DOMAIN = "klownie.me";
        WEBMASTER_EMAIL = "audrickyeu@proton.me";
      };

      instances.portofolioweb = {
        enable = true;
        settings = {
          TARGET = "http://127.0.0.1:8923";
#          BIND = ":8923";
        };
      };

    };
  };

}
