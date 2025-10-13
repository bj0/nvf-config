big: {
  config.vim = {
    viAlias = true;
    vimAlias = true;
    debugMode = {
      enable = false;
      level = 16;
      logFile = "/tmp/nvim.log";
    };

    # spellcheck = {
    #   enable = true;
    #   programmingWordlist.enable = big;
    # };
    #
    keymaps = [
      {
        key = "<leader>fk";
        mode = "n";
        action = "<cmd>Telescope keymaps<CR>";
      }
      {
        key = "<leader>fw";
        mode = "n";
        action = "<cmd>Telescope grep_string<CR>";
        desc = "Word";
      }
      {
        key = "<leader>fd";
        mode = "n";
        action = "<cmd>Telescope diagnostics<CR>";
        desc = "Diagnostics";
      }
      {
        key = "<leader>f.";
        mode = "n";
        action = "<cmd>Telescope oldfiles<CR>";
        desc = "Recent";
      }

      {
        key = "<C-h>";
        mode = "n";
        action = "<C-w>h";
      }
      {
        key = "<C-l>";
        mode = "n";
        action = "<C-w>l";
      }
      {
        key = "<C-j>";
        mode = "n";
        action = "<C-w>j";
      }
      {
        key = "<C-k>";
        mode = "n";
        action = "<C-w>k";
      }
      {
        action = "<cmd>Neotree toggle reveal<CR>";
        mode = "n";
        key = "<leader>e";
      }
      # {
      #   action = "<cmd>NvimTreeFindFileToggle<CR>";
      #   key = "<leader>e";
      #   mode = "n";
      #   desc = "Explorer";
      # }
    ];

    theme = {
      enable = true;
      name = "tokyonight";
      style = "moon";
    };

    lsp = {
      enable = true;

      formatOnSave = true;
      lspkind.enable = true;
      lspsaga.enable = false;
      lightbulb.enable = true;
      trouble.enable = true;
      lspSignature.enable = !big; # conflicts with blink
      otter-nvim.enable = big;
      nvim-docs-view.enable = big;
    };

    # debugger = {
    #   nvim-dap = {
    #     enable = true;
    #     ui.enable = true;
    #   };
    # };
    #
    # treesitter.enable = true;
    statusline.lualine.enable = true;

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
      markdown.enable = true;

      bash.enable = big;
      ts.enable = big;
      python.enable = big;
      go.enable = big;
      lua.enable = big;
      css.enable = big;
      kotlin.enable = big;
      java.enable = big;
      tailwind.enable = big;
    };

    visuals = {
      nvim-scrollbar.enable = big;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      indent-blankline.enable = true;

      # Fun
      cellular-automaton.enable = false;
    };

    autopairs.nvim-autopairs.enable = true;

    autocomplete = {
      nvim-cmp.enable = !big;
      blink-cmp.enable = big;
    };

    snippets.luasnip.enable = true;

    filetree = {
      # more features
      neo-tree.enable = true;
      # more lightweight, faster
      # nvim-tree.enable = true
    };

    tabline = {
      nvimBufferline.enable = true;
    };

    treesitter.context.enable = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false; # throws an annoying debug message
      # neogit.enable = true;
    };

    minimap = {
      minimap-vim.enable = false;
      codewindow.enable = big; # lighter, faster, and uses lua for configuration
    };

    dashboard = {
      dashboard-nvim.enable = false;
      alpha.enable = big;
    };

    notify = {
      nvim-notify.enable = true;
    };

    projects = {
      # project-nvim.enable = isMaximal;
    };

    utility = {
      ccc.enable = false;
      vim-wakatime.enable = false;
      diffview-nvim.enable = true;
      yanky-nvim.enable = false;
      # icon-picker.enable = isMaximal;
      # surround.enable = isMaximal;
      # leetcode-nvim.enable = isMaximal;
      multicursors.enable = true;
      # smart-splits.enable = isMaximal;
      undotree.enable = true;
      nvim-biscuits.enable = true;

      motion = {
        hop.enable = true;
        leap.enable = true;
        precognition.enable = big;
      };
      images = {
        image-nvim.enable = false;
        img-clip.enable = big;
      };
    };

    notes = {
      # obsidian.enable = false; # FIXME: neovim fails to build if obsidian is enabled
      # neorg.enable = false;
      # orgmode.enable = false;
      # mind-nvim.enable = isMaximal;
      todo-comments.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      modes-nvim.enable = false; # the theme looks terrible with catppuccin
      illuminate.enable = true;
      breadcrumbs = {
        enable = big;
        navbuddy.enable = big;
      };
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          # this is a freeform module, it's `buftype = int;` for configuring column position
          nix = "110";
          ruby = "120";
          java = "130";
          go = [
            "90"
            "130"
          ];
        };
      };
      fastaction.enable = true;
    };

    assistant = {
      chatgpt.enable = false;
      copilot = {
        enable = false;
        # cmp.enable = isMaximal;
      };
      codecompanion-nvim.enable = false;
      # avante-nvim.enable = isMaximal;
    };

    session = {
      nvim-session-manager.enable = false;
    };

    gestures = {
      gesture-nvim.enable = false;
    };

    comments = {
      comment-nvim.enable = true;
    };

    presence = {
      neocord.enable = false;
    };
  };
}
