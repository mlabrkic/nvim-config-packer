return function(use)

-- use({
-- 	"folke/which-key.nvim",
-- 	config = function()
-- 		require("which-key").setup({})
-- 	end
-- })

  use { 'windwp/nvim-autopairs', event = "InsertEnter",   -- autopair, Lua
    config = function()
      require('nvim-autopairs').setup()
    end,
  }

  use { "akinsho/bufferline.nvim", event = "BufReadPre",
    -- cond = firenvim_not_active,
    config = [[require('plugins.bufferline')]], }

  use { 'kevinhwang91/nvim-hlslens', event = "BufReadPre",   -- Show match number and index for searching
    config = [[require('plugins.hlslens')]], }

  use { 'phaazon/hop.nvim',     -- Super fast buffer jump
    cmd = "HopWord",
    module = "hop",
    keys = { "f", "F", "t", "T" },
    branch = 'v2', -- optional but strongly recommended
    disable = false,
    config = [[require('plugins.nvim_hop')]], }

  use { "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require('plugins.trouble')]], }

  use { "folke/todo-comments.nvim",
    -- cmd = { "TodoQuickfix", "TodoTrouble", "TodoTelescope" },
    requires = "nvim-lua/plenary.nvim",
    config = [[require('plugins.todocomments')]], }

------------------------------------------------------------
  -- Vim Script

  -- vim match-up: even better % 👊 navigate and highlight matching words 👊
  use { "andymass/vim-matchup", event = "CursorMoved",
    config = [[require('plugins.v_vim-matchup')]], }

  -- manipulate character pairs quickly, saiw" , sr"( , sd(
  use { "machakann/vim-sandwich", event = "VimEnter",
    config = [[require('plugins.v_vim-sandwich')]], }

------------------------------------------------------------
  -- https://github.com/rockerBOO/awesome-neovim#markdown-and-latex
  -- INFO: Markdown

  -- https://github.com/jdhao/nvim-config

  -- Another markdown plugin
  use { "preservim/vim-markdown", ft = { "markdown" },
    config = [[require('plugins.v_vim-markdown')]], }

  -- Faster footnote generation
  use { "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" }, }
    -- config = [[require('plugins.v_vim-markdownfootnotes')]] }

  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  use { "godlygeek/tabular", cmd = { "Tabularize" }, }
    -- config = [[require('plugins.v_tabular')]] }

  -- Please make sure that you have installed node.js .
  use {
    "iamcco/markdown-preview.nvim", ft = { "markdown" },
    run = "cd app && npm install",
    -- requires = { "zhaozg/vim-diagram", "aklt/plantuml-syntax" },
    config = [[require('plugins.v_markdown-preview')]],
  }

------------------------------
  -- https://github.com/Avimitin/nvim

  -- use{ "mzlogin/vim-markdown-toc",
  --   cmd = { "GenTocGFM", },
  -- }
  --
  -- use{ "dhruvasagar/vim-table-mode",
  --   cmd = "TableModeToggle",
  -- }

------------------------------------------------------------

  -- use({"wellle/targets.vim", event = "VimEnter"})

  -- Colorize color codes
  -- use {
  --   'norcalli/nvim-colorizer.lua',
  --   -- config = [[require('configs.colorizer')]],
  --   config = function()
  --     require'colorizer'.setup()
  --   end
  --   -- ft = {'css', 'javascript', 'json', 'scss', 'vim'}
  --   -- ft = {}
  -- }

  -- use 'junegunn/vim-easy-align'
  -- https://github.com/junegunn/vim-easy-align

  -- use 'rafcamlet/nvim-luapad'

  -- use { "max397574/better-escape.nvim", event = { "InsertEnter" },
  --   config = function()
  --     require("better_escape").setup {
  --       -- mapping = { "jk" },
  --       mapping = { "jj" },
  --       timeout = vim.o.timeoutlen,
  --       keys = "<ESC>",
  --     }
  --   end,
  -- }

------------------------------------------------------------

end
