{

  flake.modules.nixos.acme = {

    age.secrets.cloudflare-creds = {
        file = ../.secrets/cloudflare-creds.age;
    };

    security.acme = {
      acceptTerms = true;
      defaults.email = "admin+audrickyeu@proton.me";
      certs."portfolio.klownie.me" = {
        dnsProvider = "cloudflare";
        environmentFile = "/run/agenix/cloudflare-creds";
        webroot = null;
      };
    };
  };
}
