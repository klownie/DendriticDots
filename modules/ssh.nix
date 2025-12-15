{ inputs, config, ... }:{

  flake.modules.nixos.ssh = {
    # Linux config: setup OpenSSH server, firewall-ports, etc.
  };

}
