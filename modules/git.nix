{ inputs, config, ... }:{

  flake.modules.nixos.git = {

    services.gnome.gcr-ssh-agent.enable = false;

    programs.git = {
      enable = true;

      config = { 
        user = { 
          name = "klownie";
          email = "audrickyeu@proton.me";
          signingKey = "/etc/ssh/methaNas_git_key";
        };
	gpg.format = "ssh";
        commit.gpgsign = true;
	init.defaultBranch = "main";
      };

    };
  };
}
