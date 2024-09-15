require("main.keymap")
require("main.options")
require("main.paq")

-- Set tab length for certain file types --
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {"*.c", "*.h", "*.cpp", "*.hpp", "*.cc"},
  callback = function()
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 8
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {"*.html", "*.js", "*.scss", "*.ts"},
  callback = function()
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end,
})

-- Automatically format C files on save --
vim.api.nvim_create_autocmd("BufWrite", {
  pattern = {"*.c", "*.h"},
  callback = function()
    vim.lsp.buf.format()
  end,
})
