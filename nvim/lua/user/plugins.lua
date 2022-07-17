local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
  use({ "lewis6991/impatient.nvim" })

	use({ "wbthomason/packer.nvim"}) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim"}) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs"}) -- Autopairs, integrates with both cmp and treesitter
  use "windwp/nvim-ts-autotag"

  -- Debugger
  -- use "dstein64/vim-startuptime"
  -- use "tweekmonster/startuptime.vim"
  -- use("nathom/filetype.nvim")

  use "tpope/vim-surround"
	use "numToStr/Comment.nvim"
	use "JoosepAlviste/nvim-ts-context-commentstring"
	use({ "kyazdani42/nvim-web-devicons"})
	use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
	use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" })
--	use({ "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" })
	-- use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" })
--	use("folke/which-key.nvim")
  use 'ggandor/lightspeed.nvim'

	-- Colorschemes
  use 'Mofiqul/dracula.nvim'
	-- use("lunarvim/darkplus.nvim")

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig"}) -- enable LSP
	use({ "williamboman/nvim-lsp-installer"}) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim"}) -- for formatters and linters

	-- Telescope
	use({ "nvim-telescope/telescope.nvim"})

  -- Telescope plugins
  -- This requires `gcc` or `clang` and `make` to be work
  -- *** If there is an error --> try run `make` command in ..
  -- this plugin dir .../site/pack/packer/start/telescope-fzf-native dir
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- use 'nvim-telescope/telescope-fzy-native.nvim'

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
	})

	-- Git
	use({ "lewis6991/gitsigns.nvim"})

  -- Utils

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
