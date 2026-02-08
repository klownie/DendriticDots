{ inputs, config, ... }:{

  flake.modules.nixos.git = {

    services.gnome.gcr-ssh-agent.enable = false;

    programs.git = {
      enable = true;

      config = { 
        user = { 
          name = "klownie";
          email = "audrickyeu@proton.me";
          signingKey = "/etc/ssh/zimablade_git_key";
        };

        signing = {
            signByDefault = true; 
            key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ93hsGT0sbssQkKMlZOzKhiNeWxpTAZwn4SLPeGP2bh root@zimablade" ;
        };	

	gpg.format = "ssh";
        commit.gpgsign = true;
	init.defaultBranch = "main";
      };

    };
  };
}
