{
  flake.modules.nixos.anubis = {

    services.anubis = {
      defaultOptions.settings = {
        OG_PASSTHROUGH = true;
        OG_EXPIRY_TIME = "1h";
        COOKIE_DOMAIN = "klownie.me";
        WEBMASTER_EMAIL = "audrickyeu@proton.me";
      };

      instances.portfolioweb = {
        enable = true;

	settings = {
          BIND = "/run/anubis/anubis-portfolioweb/anubis.sock";
          METRICS_BIND = "/run/anubis/anubis-portfolioweb/anubis-metrics.sock";
          TARGET = "http://127.0.0.1:7878";
	  DIFFICULTY = 20;
	  OG_PASSTHROUGH = false;
 	  SERVE_ROBOTS_TXT = true;
	};

        user = "anubis";
        group = "anubis";
      };

    };
  };

}
