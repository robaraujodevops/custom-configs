return {
  {
  	'prettier/vim-prettier',
    build='yarn install --frozen-lockfile --production',
    init = function()
      vim.g['prettier#config#tab_width'] = 2
    end,
  },
  {
  	'terryma/vim-multiple-cursors',
  	init = function()
		vim.g.multi_cursor_use_default_mapping = 0
		vim.g.multi_cursor_start_word_key      = '<C-n>'
		vim.g.multi_cursor_select_all_word_key = '<A-n>'
		vim.g.multi_cursor_start_key           = 'g<C-n>'
		vim.g.multi_cursor_select_all_key      = 'g<A-n>'
		vim.g.multi_cursor_next_key            = '<C-n>'
		vim.g.multi_cursor_prev_key            = '<C-p>'
		vim.g.multi_cursor_skip_key            = '<C-x>'
		vim.g.multi_cursor_quit_key            = '<Esc>'
  	end,
  },
  {
    'dense-analysis/ale',
    config = function()
        -- Configuration goes here.
        local g = vim.g
  
        g.ale_ruby_rubocop_auto_correct_all = 1
  
        g.ale_linters = {
            lua = {'lua_language_server'},
            javascript = {}
        }
    end
  },
  {'mg979/vim-visual-multi', branch='master'},
  {'sheerun/vim-polyglot'},
  {'cohama/lexima.vim'},
  {'pangloss/vim-javascript'}, --JavaScript
  {'HerringtonDarkholme/yats.vim'}, -- Ts
  {'leafgarland/typescript-vim'}, -- Ts
  {'maxmellon/vim-jsx-pretty'}, -- Jsx
  {'chemzqm/vim-jsx-improve'}, -- Jsx
  {'jparise/vim-graphql'}, -- GraphQL
  {'fatih/vim-go', cmd='GoUpdateBinaries'}, -- GO
  {'gregsexton/MatchTag'}, -- HTML Tags
  {'nathanaelkane/vim-indent-guides'}, -- Identation Highlits
  {'Yggdroot/indentLine'} -- Identation Highlits
}









