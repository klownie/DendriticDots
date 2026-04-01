{ inputs, config, ... }:{

  flake.modules.nixos.rathole = {

    age.secrets.rathole-client = {
        file = ../.secrets/rathole-client.toml.age;
    };

    services.rathole = {
      enable = true;
      role = "client";
      credentialsFile = "/run/agenix/rathole-client";
    };
  };

}
