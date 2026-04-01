{ inputs, config, ... }:{

  flake.modules.nixos.nvim = {
    imports = [ inputs.nvf.nixosModules.default ];

    programs.nvf = {

      enable = true;
      defaultEditor = true;
    
      settings = {
        vim.viAlias = false;
        vim.vimAlias = true;
        vim.lsp.enable = true;

        vim.languages = {
          nix.enable = true;
          rust.enable = true;
          enableTreesitter = true;
        };

        vim.statusline.lualine.enable = true;
        vim.telescope.enable = true;
        vim.autocomplete.nvim-cmp.enable = true;

      };

    };
  };

}
