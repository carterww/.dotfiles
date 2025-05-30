-- Configure diagnostic settings with custom signs
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN]  = "W",
      [vim.diagnostic.severity.INFO]  = "I",
      [vim.diagnostic.severity.HINT]  = "H",
    },
    texthl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
      [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
      [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
    }
  },
  float = {
    scope = 'line',
    border = "single",
    focusable = false,
    style = "minimal",
    source = "always"
  },
})
