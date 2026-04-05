{ inputs, config, ... }:{

  flake.modules.nixos.nvim = {
    imports = [ inputs.nvf.nixosModules.default ];

    programs.nvf = {

      enable = true;
      defaultEditor = true;

      
    
      settings = {
        vim = {
          viAlias = false;
          vimAlias = true;
          lsp.enable = true;

          undoFile.enable = true;

          options = {
            tabstop = 2;
            shiftwidth = 2;
            expandtab = true;
            autoindent = true;
          };

          binds = {
            cheatsheet.enable = true;
            whichKey.enable = true;
          };

          dashboard = {
            dashboard-nvim.enable = true;
            alpha.enable = false;
          };

          languages = {
            enableFormat = true;
            enableTreesitter = true;
            nix.enable = true;
            rust.enable = true;
            nu.enable = true;
          };

          statusline.lualine.enable = true;
          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;
          filetree.nvimTree =  {
            enable = true;
            openOnSetup = false;
            setupOpts = {
              git.enable = true;
              modified.enable = true;
            };
            mappings = {
              toggle = "e";
              focus = "o";
            };
          };
          terminal.toggleterm = {
            enable = true;
            mappings = {
              open = "gg";
            };
          };
        };

      };

    };
  };

}
