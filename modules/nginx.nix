{
  flake.modules.nixos.nginx = {

    users.users.nginx.extraGroups = [ "acme" "anubis" ];

    services.nginx = {
      enable = true;

      upstreams.anubis.servers = {
        "unix:/run/anubis/anubis-portfolioweb/anubis.sock" = {};
      };

      virtualHosts."my_portofolio_website" = {
        serverName = "portfolio.klownie.me";
        enableACME = true;
        forceSSL = true;
        http2 = true;

        listen = [
          { addr = "0.0.0.0"; port = 3000; ssl = true; }
          { addr = "[::]";    port = 3000; ssl = true; } 
        ];

        locations."/" = {
          proxyPass = "http://anubis";
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Http-Version $server_protocol;
          '';
        };
      };

      virtualHosts."my_nextcloud_instance" = {
        serverName = "portfolio.klownie.me";
        enableACME = true;
        forceSSL = true;
        http2 = true;

        listen = [
          { addr = "0.0.0.0"; port = 27702; ssl = true; }
          { addr = "[::]"; port = 27702; ssl = true; }
        ];

        locations."/" = {
          proxyPass = "http://127.0.0.1:80";
          extraConfig = ''
            proxy_set_header Host $host:7000;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Http-Version $server_protocol;
          '';
        };

      };

    };
  };
}
