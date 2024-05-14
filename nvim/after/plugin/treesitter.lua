require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { 
	  "c",
--	  "lua", -- commented because for some reason are breaking the bootstrap, 
--	         -- says that lua's setup file already exist (maybe it is some cache 
--	         -- because the bug accours in the $./tmp folder) (i realy want to fix this, but not now <(º~º<))
	  "vim",
	  "vimdoc",
	  "query",
	  "bash",
	  "arduino",
	  "c_sharp",
	  "cmake",
	  "comment",
	  "cpp",
	  "css",
	  "csv",
	  "git_config",
	  "git_rebase",
	  "gitattributes",
	  "gitcommit",
	  "gitignore",
	  "go",
	  "gomod",
	  "gosum",
	  "gpg",
	  "graphql",
	  "helm",
	  "html",
	  "http",
	  "javascript",
	  "json",
	  "make",
	  "python",
	  "regex",
	  "requirements",
	  "rust",
	  "scss",
	  "sql",
	  "ssh_config",
	  "toml",
	  "typescript",
	  "tsx",
	  "vue",
	  "xml",
	  "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,
    
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
