{ inputs, ... }:
{

  flake.nixosConfigurations.zimablade = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos;  [
      agenix 
      ssh 
      git 
      nvim
      hardware
      rathole
      anubis
      nginx
      acme
      portofolio
      nextcloud 
    ];
  };

}
