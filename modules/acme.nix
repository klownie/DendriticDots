{ inputs, config, ... }:{

  flake.modules.nixos.acme = {
    security.acme = {
      acceptTerms = true;
      defaults.email = "admin+audrickyeu@proton.me";
      certs."portofolio.klownie.me" = {
        dnsProvider = "cloudflare";
        environmentFile = "/etc/nixos/cloudflare_creds";
      };
    };
  };
}
