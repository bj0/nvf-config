{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        # To import a flake module
        # 1. Add foo to inputs
        # 2. Add foo as a parameter to the outputs function
        # 3. Add here: foo.flakeModule
      ];
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        # Per-system attributes can be defined here. The self' and inputs'
        # module parameters provide easy access to attributes of the same
        # system.

        # Equivalent to  inputs'.nixpkgs.legacyPackages.hello;
        packages.default =
          (inputs.nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [
              {
                config.vim = {
                  keymaps = [
                    {
                      key = "<leader>fk";
                      mode = "n";
                      action = "<cmd>Telescope keymaps<CR>";
                    }
                  ];

                  theme = {
                    enable = true;
                    name = "tokyonight";
                    style = "night";
                  };

                  lsp = {
                    enable = true;

                    formatOnSave = true;
                    lspkind.enable = true;
                    lightbulb.enable = true;
                    trouble.enable = true;
                    lspSignature.enable = false; # conflicts with blink
                    otter-nvim.enable = true;
                    nvim-docs-view.enable = true;
                  };

                  treesitter.enable = true;
                  statusline.lualine.enable = true;

                  languages = {
                    enableFormat = true;
                    enableTreesitter = true;
                    enableExtraDiagnostics = true;

                    nix.enable = true;
                    ts.enable = true;
                    python.enable = true;
                    markdown.enable = true;
                    go.enable = true;
                    lua.enable = true;
                    bash.enable = true;
                    css.enable = true;
                    kotlin.enable = true;
                    java.enable = true;
                    tailwind.enable = true;
                  };

                  visuals = {
                    # nvim-scrollbar.enable = isMaximal;
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
                    # nvim-cmp.enable = false;
                    blink-cmp.enable = true;
                  };

                  snippets.luasnip.enable = true;

                  filetree = {
                    neo-tree = {
                      enable = true;
                    };
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
                    codewindow.enable = true; # lighter, faster, and uses lua for configuration
                  };

                  dashboard = {
                    dashboard-nvim.enable = false;
                    alpha.enable = true;
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
                      precognition.enable = true;
                    };
                    images = {
                      image-nvim.enable = false;
                      img-clip.enable = true;
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
                      enable = true;
                      navbuddy.enable = true;
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
            ];
          }).neovim;
      };
      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.
      };
    };
}
