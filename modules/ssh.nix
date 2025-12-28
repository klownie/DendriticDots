{ inputs, config, ... }:{

  flake.modules.nixos.ssh = {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      startWhenNeeded = true;
      authorizedKeysFiles = [ "/etc/ssh/methaNas_git_key" ];
      settings = {
      	PasswordAuthentication = true;
	UseDns = true;
      };
      hostKeys = [ 
        {
	  openSSHFormat = true;
          path = "/etc/ssh/methaNas_git_key";
	  type = "ed25519";
        }
      ];
    };

    programs.ssh.startAgent = true;
  };

}
