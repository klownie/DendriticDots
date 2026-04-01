{ inputs, config, ... }:{

  flake.modules.nixos.portofolio = {

    networking.firewall.allowedTCPPorts = [ 7878 ];

    systemd.services.portofolio = {
      description = "Audrick Portofolio Wbsite";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        ExecStart = "/home/klownie/KlowniePortofolio/target/release/AudrickConceptPortofolio";
        Restart = "always";
        RestartSec = 2;

        User = "klownie";
  	Group = "users";
        WorkingDirectory = "/home/klownie/KlowniePortofolio";
        Environment = "RUST_LOG=info";
      };
    };

  };
}
