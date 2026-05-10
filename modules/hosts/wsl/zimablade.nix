{ inputs, ... }:
{

  flake.nixosConfigurations.wsl = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos;  [
      wsl
      common
      ragenix 
      ssh 
      git 
      nvim
    ];
  };

}
