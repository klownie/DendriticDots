{pkgs, ...}:{ 
  flake.modules.nixos.zimablade = {
    users.users.klownie = {
      isNormalUser = true;
      description = "klownie";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };

  services.getty.autologinUser = "klownie";
  };
}
