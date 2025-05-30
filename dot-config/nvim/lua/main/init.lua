require("main.keymap")
require("main.options")
require("main.paq")
require('main.cmp')
require("main.lsp")
require("main.diagnostic")
require("main.color")

-- Set tab length for certain file types --
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {"*.c", "*.h", "*.cpp", "*.hpp", "*.cc"},
  callback = function()
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 8
    vim.opt.expandtab = false
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {"*.html", "*.js", "*.scss", "*.ts"},
  callback = function()
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end,
})
