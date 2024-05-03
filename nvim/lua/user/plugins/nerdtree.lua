return {
	{'preservim/nerdtree',
		dependencies = {
			'ryanoasis/vim-devicons',
			'Xuyuanp/nerdtree-git-plugin',
			'tiagofumo/vim-nerdtree-syntax-highlight',
			'PhilRunninger/nerdtree-buffer-ops',
			'PhilRunninger/nerdtree-visual-selection',
		},
		config = function()
      vim.g.NERDTreeWinSize = 40
		end,
	  init = function()
        vim.go.NERDTreeGitStatusUseNerdFonts = 1
        vim.go.NERDTreeDirArrowExpandable    = ''
        vim.go.NERDTreeDirArrowCollapsible   = ''
        vim.go.NERDTreeShowHidden            = 1
	  end,
	},
	{'Xuyuanp/nerdtree-git-plugin'},
	{'tiagofumo/vim-nerdtree-syntax-highlight'},
	{'PhilRunninger/nerdtree-buffer-ops'},
	{'PhilRunninger/nerdtree-visual-selection'},
}
