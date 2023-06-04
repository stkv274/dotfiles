local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Packer not installed...")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Packer
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colorschemes
  use "nyoom-engineering/oxocarbon.nvim"
  use "LunarVim/Colorschemes"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "overcache/NeoSolarized"
  use "xiyaowong/transparent.nvim" -- transparent background

  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Cmp
  use "hrsh7th/cmp-nvim-lsp" -- completion lsp
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/nvim-cmp" -- completions itself
  use "hrsh7th/cmp-nvim-lua" -- for lua completions

  -- Snippets
  use "L3MON4D3/LuaSnip" -- Snippets engine
  use "saadparwaiz1/cmp_luasnip" -- snippets completions
  use "rafamadriz/friendly-snippets" -- some snippets

  -- LSP
  use "neovim/nvim-lspconfig" -- lsp engine
  use "williamboman/mason.nvim" -- to install lsp for new languages
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer

  -- Formatters
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  use {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  }

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  -- Go plugin
  use "fatih/vim-go"

  -- indent line
  use "lukas-reineke/indent-blankline.nvim"

  -- Nvimtree
  use "nvim-tree/nvim-tree.lua"

  -- Maps helpers
  use "folke/which-key.nvim"

  -- lualine
  use {
    "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- git integration
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  }

  -- telescope
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    requires = { {"nvim-lua/plenary.nvim"} }
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
