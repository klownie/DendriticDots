{ inputs, ... }:
{

  flake.nixosConfigurations.methaNAS = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos;  [ shell ssh git rathole hardware ];
  };

  flake.darwinConfigurations.nixos = inputs.nix-darwin.lib.nixosSystem {
    system = "aarm64-linux";
    modules = with inputs.self.modules.nixos; [ shell ssh git rathole ];
  };

}
