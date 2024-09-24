local ensure_packer =  function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 
            "git", 
            "clone", 
            "--depth", 
            "1", 
            "https://github.com/wbthomason/packer.nvim", 
            install_path 
        })
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
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-telescope/telescope.nvim', { tag = '0.1.5' })

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {
                map_cr = true
            }
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

	use {
		'catppuccin/nvim',
		as = 'catppuccin',
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				transparent_background = true,
			})
		end,
	 	run = ':colorscheme catppuccin',
	}
	
	if packer_bootstrap then
		require('packer').sync()
	end
end)
