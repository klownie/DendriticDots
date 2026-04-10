{ inputs, pkgs, ... }:{

  flake.modules.nixos.agenix =  {
    imports = [
      inputs.agenix.nixosModules.default
    ];

    environment.systemPackages = [ 
        pkgs.rage
        inputs.agenix.packages."x86_64-linux".default
    ];
  };
      
}
