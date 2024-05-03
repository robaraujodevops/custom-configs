local api = vim.api

-- Theming
api.nvim_create_autocmd("VimEnter", {
   pattern = {"*"},
   command = [[ hi Normal ctermbg=none ]]
})
-- Startify
api.nvim_create_autocmd(
    "VimEnter",
    { pattern="*", command = "Startify" }
)
-- NERDTree
api.nvim_create_autocmd(
    "VimEnter",
    { pattern="*", command = "NERDTree | wincmd p" }
)
api.nvim_create_autocmd(
    "StdinReadPre",
    { pattern="*", command="let s:std_in=1"}
)
api.nvim_create_autocmd(
    "VimEnter",
    { pattern="*", command="if argc() == 0 && !exists('s:std_in') | NERDTree | endif"}
)
api.nvim_create_autocmd(
    "VimEnter",
    { pattern="*", command="NERDTree | if argc() > 0 || exists('s:std_in') | wincmd p | endif"}
)
api.nvim_create_autocmd(
    "BufEnter",
    { pattern="*", command="if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"}
)
-- COC
-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
api.nvim_create_augroup("CocGroup", {})
api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})
-- Setup formatexpr specified filetype(s)
api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})
-- Update signature help on jump placeholder
api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Add `:Format` command to format current buffer
api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})