{ inputs, config, ... }:{

  flake.modules.homeManager.shell = {
    programs.nushell.enable = true;
  };

}
