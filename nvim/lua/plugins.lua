return function(use)

-- use({
-- 	"folke/which-key.nvim",
-- 	config = function()
-- 		require("which-key").setup({})
-- 	end
-- })

-- https://www.chiarulli.me/Neovim-2/03-plugins/
-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

  -- Automatically source and re-compile packer whenever you save this init.lua
  -- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
  -- vim.api.nvim_create_autocmd('BufWritePost', {
  --   pattern = 'plugins.lua',
  --   command = 'source <afile> | PackerCompile',
  --   group = packer_group,
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

  -- INFO: First install other plugins. After that uncomment this
  -- Uncomment No_ 02:

  -- use { "folke/todo-comments.nvim",
  --   -- cmd = { "TodoQuickfix", "TodoTrouble", "TodoTelescope" },
  --   requires = "nvim-lua/plenary.nvim",
  --   config = [[require('plugins.todocomments')]], }

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
  -- MARKDOWN

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
  -- INFO: First install other plugins. After that uncomment this
  -- Uncomment No_ 03:

  -- use {
  --   "iamcco/markdown-preview.nvim", ft = { "markdown" },
  --   run = "cd app && npm install",
  --   -- requires = { "zhaozg/vim-diagram", "aklt/plantuml-syntax" },
  --   config = [[require('plugins.v_markdown-preview')]],
  -- }

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
