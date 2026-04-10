{ inputs, ... }:
{

  flake.nixosConfigurations.zimablade = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos;  [
      zimablade
      common
      agenix 
      ssh 
      git 
      nvim
      rathole
      anubis
      nginx
      acme
      portofolio
      nextcloud 
    ];
  };

}
