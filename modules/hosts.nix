{ inputs, ... }:
{

  flake.nixosConfigurations.zimablade = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos;  [ ssh git hardware rathole anubis nginx acme portofolio nextcloud];
  };

  flake.darwinConfigurations.google_pixel = inputs.nix-darwin.lib.nixosSystem {
    system = "aarm64-linux";
    modules = with inputs.self.modules.nixos; [ ssh git];
  };

}
