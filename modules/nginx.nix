{ inputs, config, lib, ... }:
{
  flake.modules.nixos.nginx = {

    users.users.nginx.extraGroups = [ "acme" "anubis" ];

    services.nginx = {
      enable = true;

      upstreams.anubis.servers = {
        "unix:/run/anubis/anubis-portofolioweb/anubis.sock" = {};
      };

      virtualHosts."portofolio.klownie.me" = {
        forceSSL = true;
        http2 = true;

        listen = [
          { addr = "0.0.0.0"; port = 3000; ssl = true; }
          { addr = "[::]";    port = 3000; ssl = true; }
        ];

        sslCertificate =
          "/var/lib/acme/portofolio.klownie.me/fullchain.pem";
        sslCertificateKey =
          "/var/lib/acme/portofolio.klownie.me/key.pem";

        locations."/" = {
          proxyPass = "http://anubis";
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Http-Version $server_protocol;
          '';
        };
      };
    };
  };
}
