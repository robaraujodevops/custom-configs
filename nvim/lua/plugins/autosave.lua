return {
  "pocco81/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" }, -- Triggers autosave
  opts = {
    enabled = true, -- AutoSave enabled by default
    execution_message = {
      message = function()
        return ""
      end, -- Hide autosave messages
    },
    debounce_delay = 1000, -- Save after 1 second of inactivity
  },
}
