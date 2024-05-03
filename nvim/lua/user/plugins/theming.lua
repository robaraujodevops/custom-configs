return {
  {'ryanoasis/vim-devicons'},
  {'gruvbox-community/gruvbox'},
  {'dracula/vim',
    name='dracula',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme dracula]])
    end,
  },
  {
    'tpope/vim-fugitive',
    tag='*'
  },
  {'vim-airline/vim-airline-themes'},
  {
    'vim-airline/vim-airline',
    dependencies = {
      'vim-airline/vim-airline-themes'
    },
    init = function()
      vim.g.airline_theme='minimalist'
      vim.g['airline#extensions#tabline#enabled'] = 1
      vim.g['airline#extensions#tabline#buffer_nr_show'] = 1
      vim.g['airline#extensions#tabline#formatter'] = 'unique_tail_improved'
    end,
  },
  {'mhinz/vim-startify'},
}
