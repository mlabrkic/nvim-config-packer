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
    end
  }

  -- Modern matchit implementation
  -- vim match-up: even better % 👊 navigate and highlight matching words 👊
  use { "andymass/vim-matchup", event = "VimEnter",  -- https://github.com/jdhao/nvim-config
    config = [[require('plugins.vim-matchup')]] }
  -- Adds motions g%, [%, ]%, and z%.
  -- Combines these motions into convenient text objects i% and a%.

  use { "machakann/vim-sandwich", event = "VimEnter",  -- manipulate character pairs quickly, saiw" , sr"( , sd(
    config = [[require('plugins.vim-sandwich')]] }

  use { "akinsho/bufferline.nvim", -- event = "VimEnter",
    -- cond = firenvim_not_active,
    config = [[require('plugins.bufferline')]] }

  use { 'kevinhwang91/nvim-hlslens', event = "VimEnter",   -- Show match number and index for searching
    config = [[require('plugins.hlslens')]] }

  use { 'phaazon/hop.nvim', event = "VimEnter",        -- Super fast buffer jump
    branch = 'v2', -- optional but strongly recommended
    config = [[require('plugins.nvim_hop')]] }

  use { "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require('plugins.trouble')]] }

  use { "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require('plugins.todocomments')]] }

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

------------------------------------------------------------
  -- https://github.com/jdhao/nvim-config
--[[
  use { "preservim/vim-markdown", ft = { "markdown" } }    -- Another markdown plugin
  use { "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" } }

  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  use { "godlygeek/tabular", cmd = { "Tabularize" } }

  use({ "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    -- setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })
------------------------------
  -- https://github.com/Avimitin/nvim

  use{ "mzlogin/vim-markdown-toc",
    cmd = { "GenTocGFM", },
  }

  use{ "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
  }
]]

------------------------------------------------------------

end
