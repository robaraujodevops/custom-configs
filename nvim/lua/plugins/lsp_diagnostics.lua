return {
  {
    "neovim/nvim-lspconfig",
    --- Add or modify the `opts` table for diagnostics
    opts = function(_, opts)
      -- If there's already an opts.diagnostics table, we merge/override.
      opts.diagnostics = {
        -- Show diagnostics as virtual text (inline) with full message
        virtual_text = {
          -- By default, Neovim may truncate messages; this attempts to show the entire message.
          source = "always", -- Show the name of the source (language server)
          spacing = 4,
          -- You can customize the format if you like, e.g.:
          -- format = function(diagnostic)
          --   return string.format("%s (%s)", diagnostic.message, diagnostic.source)
          -- end,
        },
        -- Also show diagnostics in a floating window when you hover
        float = {
          source = "always",
        },
        -- You can also turn on/off signs, underline, etc.:
        -- underline = true,
        -- signs = true,
        -- update_in_insert = false,
      }

      return opts
    end,
  },
}
