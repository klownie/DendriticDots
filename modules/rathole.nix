{

  flake.modules.nixos.rathole = {

    age.secrets = {
      rathole-client.file = ../.secrets/rathole-client.age;
    };

    services.rathole = {
      enable = true;
      role = "client";
      credentialsFile = "/run/agenix/rathole-client";
    };
  };

}
