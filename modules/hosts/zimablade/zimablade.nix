{ inputs, ... }:
{

  flake.nixosConfigurations.zimablade = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos;  [
      zimablade
      common
      ragenix 
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
