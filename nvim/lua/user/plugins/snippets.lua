return {
  {
    'honza/vim-snippets'
  },
  {
    'neoclide/coc.nvim' ,
    branch='master',
    build='yarn install --frozen-lockfile',
    init = function()
      vim.g.nobackup = true
      vim.g.nowritebackup = true 
      vim.g.updatetime=300
      vim.g.signcolumn='yes'
      -- Add (Neo)Vim's native statusline support
      -- NOTE: Please see `:h coc-status` for integrations with external plugins that
      -- provide custom statusline: lightline.vim, vim-airline
      -- vim.o.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
    end
  },
  {
    'ms-jpq/coq_nvim',
    branch='coq'
  },
  {
    'ms-jpq/coq.artifacts',
    branch='artifacts'
  },
  {
    'ms-jpq/coq.thirdparty',
    branch='3p'
  },
  {
    'mattn/emmet-vim'
  }
}
