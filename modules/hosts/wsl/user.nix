{pkgs, ...}:{ 
  flake.modules.nixos.wsl = {
    users.users.klownie = {
      isNormalUser = true;
      description = "klownie";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };

  services.getty.autologinUser = "klownie";
  };
}
