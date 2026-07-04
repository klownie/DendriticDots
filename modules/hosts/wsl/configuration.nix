{ config, lib, pkgs, ... }:{
  flake.modules.nixos.wsl = {

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  networking.resolvconf.enable = false;
  wsl.enable = true;
  wsl.defaultUser = "klownie";

  system.stateVersion = "25.05";
  };
}
