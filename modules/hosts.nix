{ inputs, ... }:
{

  flake.nixosConfigurations.zimablade = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos;  [ ssh git hardware rathole anubis acme];
  };

  flake.darwinConfigurations.google_pixel = inputs.nix-darwin.lib.nixosSystem {
    system = "aarm64-linux";
    modules = with inputs.self.modules.nixos; [ shell ssh git rathole ];
  };

}
