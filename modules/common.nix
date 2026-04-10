{
  flake.modules.nixos.common = { pkgs, ...}: {
    
    systemd.services.hayabusa = {
      description = "Hayabusa daemon";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.hayabusa}/bin/hayabusa --daemon";
        Restart = "always";
        RestartSec = 5;

        # Optional hardening
        # DynamicUser = true;
        # NoNewPrivileges = true;
        # ProtectSystem = "strict";
        # ProtectHome = true;
      };
    };

    environment.systemPackages = [
      pkgs.hayabusa
      pkgs.onefetch
      pkgs.gdu
      pkgs.bottom
      pkgs.devenv
    ];
  };
      
}
