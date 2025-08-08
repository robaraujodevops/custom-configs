-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keyset = vim.keymap.set

-- Buffer Things
keyset("n", "<A-w>", ":bp<cr>", { remap = true, silent = false })
keyset("n", "<A-Right>", ":bn<cr>", { remap = true, silent = true })
keyset("n", "<A-q>", ":bp<bar>sp<bar>bn<bar>bd<cr>", { remap = true, silent = true })

-- Toggle auto save
keyset("n", "<leader>as", ":ASToggle<CR>", { desc = "Toggle AutoSave" })

-- Normal + Visual: <Home> -> start of line, <End> -> end of line
keyset({ "n", "v" }, "<Home>", "0", { desc = "Go to start of line" })
keyset({ "n", "v" }, "<End>", "$", { desc = "Go to end of line" })

-- (Optional) Insert mode: <Home> -> move cursor to start, <End> -> move cursor to end
keyset("i", "<Home>", "<C-o>0", { desc = "Go to start of line (insert)" })
keyset("i", "<End>", "<C-o>$", { desc = "Go to end of line (insert)" })
