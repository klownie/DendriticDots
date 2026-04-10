{ inputs, ... }:{

  flake.modules.nixos.nvim = {pkgs, ...}: {
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

          comments.comment-nvim = {
            enable = true;
            mappings = {
              toggleCurrentBlock = "gbc";
            };
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
            setupOpts.direction = "vertical";
            mappings = {
              open = "gg";
            };
          };

          lazy.plugins = {
            "uiua.vim" = {
              package = pkgs.vimUtils.buildVimPlugin {
                pname = "uiua.vim";
                version = "latest";

                src = pkgs.fetchFromGitHub {
                  owner = "sputnick1124";
                  repo = "uiua.vim";
                  rev = "main";
                  sha256 = "sha256-SjbqPv2eVo5ZhNGq9tL1o4GN4GCWJw2ayBpXtattAw4=";
                };
              };
            };
          };

        };
      };
    };
  };

}
