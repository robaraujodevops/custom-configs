return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
      local opts = {
        theme = "hyper",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            {
              icon = "󰊳 ",
              icon_hl = "@variable",
              desc = "Update",
              group = "@property",
              action = "Lazy update",
              key = "u",
            },
            {
              icon = "󰊳 ",
              icon_hl = "@variable",
              desc = "Install",
              group = "@property",
              action = "Lazy install",
              key = "i",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              group = "Label",
              action = "lua LazyVim.pick()()",
              desc = " Find File",
              key = "f",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Apps",
              group = "DiagnosticHint",
              action = "Telescope app",
              key = "a",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Dotfiles",
              group = "Number",
              action = "Telescope dotfiles",
              key = "d",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              action = "ene | startinsert",
              desc = "New File",
              key = "n",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              action = 'lua LazyVim.pick("live_grep")()',
              desc = "Find Text",
              key = "g",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              action = "LazyExtras",
              desc = "Lazy Extras",
              key = "x",
            },
          },
          packages = { enable = true },
          project = {
            enable = true,
            limit = 8,
            icon = " Projects",
            label = "",
            action = "Telescope find_files cwd=",
          },
          mru = {
            enable = true,
            limit = 10,
            icon = " Files",
            label = "",
            cwd_only = false,
          },
          footer = {},
          -- function()
          --  local stats = require("lazy").stats()
          --  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          --  return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          -- end,
        },
      }

      -- open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
}
