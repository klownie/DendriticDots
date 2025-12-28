{ inputs, config, ... }:{

  flake.modules.nixos.rathole = {
    services.rathole = {
      enable = true;
      role = "client";
      credentialsFile = "/etc/nixos/client.toml";
    };
  };

}
