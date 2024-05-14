local ensure_packer =  function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
	use('nvim-lua/plenary.nvim')
	use('wbthomason/packer.nvim')
	use('nvim-lualine/lualine.nvim')
	use('nvim-telescope/telescope.nvim', { tag = '0.1.5' })
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('christoomey/vim-tmux-navigator', { lazy = false })
	use('tpope/vim-fugitive')

	use {
		'catppuccin/nvim',
		as = 'catppuccin',
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
			})
		end,
		run = ':colorscheme catppuccin',
	}

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	
	if packer_bootstrap then
		require('packer').sync()
	end
end)
