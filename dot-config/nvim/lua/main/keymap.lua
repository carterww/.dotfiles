vim.g["mapleader"] = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>ff", function () vim.lsp.buf.format() end)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>t", ":vs | :term<CR>")

vim.keymap.set("n", "<C-Up>", ":cnewer<CR>")
vim.keymap.set("n", "<C-Down>", ":colder<CR>")
vim.keymap.set("n", "<C-Left>", ":cprev<CR>")
vim.keymap.set("n", "<C-Right>", ":cnext<CR>")
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.keymap.set('n', '<CR>', function()
      local line = vim.fn.line('.')
      vim.cmd('cc ' .. line)
    end, { buffer = true, noremap = true })
  end,
})

vim.keymap.set('n', 'gd', '<Plug>(wiki-link-follow)', { silent = true })
vim.keymap.set('n', '<leader>jj', ':WikiJournal<CR>', { silent = true })
