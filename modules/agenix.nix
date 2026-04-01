{ inputs, config, ... }:{

  flake.modules.nixos.agenix = { pkgs, ...}: {
    imports = [
      inputs.agenix.nixosModules.default
    ];

    environment.systemPackages = [ 
        pkgs.rage
        inputs.agenix.packages."x86_64-linux".default
    ];
  };
      
}
