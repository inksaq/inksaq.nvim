--  This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'folke/tokyonight.nvim',
	  config = function()
		  vim.cmd('colorscheme tokyonight-storm')
	  end
  })
  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup(
	{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<c-\>]], -- Change to your preferred keybinding
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2, -- the degree by which to darken to terminal color, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal', -- or 'vertical' or 'float'
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
}
 )
end}
use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require'nvim-tree'.setup {
            -- Add your configuration options here
        }

        -- Key mappings
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Toggle nvim-tree with \
         map('n', '\\', ':NvimTreeToggle<CR>', opts)

    end
}

end)

