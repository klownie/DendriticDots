{ inputs, config, ... }:{

  flake.modules.nixos.ragenix = {pkgs, ...}: {
    imports = [
      inputs.agenix.nixosModules.default
    ];

    environment.systemPackages = [ 
      pkgs.rage
      #  pkgs.ragenix
      inputs.agenix.packages."x86_64-linux".default
    ];
  };
      
}
