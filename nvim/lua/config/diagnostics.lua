vim.diagnostic.config({
  float = {
    source = true, -- show source of diagnostics
    border = "rounded", -- add a rounded border to the floating window
    focusable = false, -- disable focus so that you can keep editing
    wrap = true, -- enable wrapping of diagnostic messages
    header = "", -- remove header text if any
    prefix = "", -- no prefix before each diagnostic
  },
  severity_sort = true, -- sort by severity
  underline = true, -- underline the text with errors
  virtual_text = {
    spacing = 4,
    prefix = "●", -- you can choose any prefix
  },
})
