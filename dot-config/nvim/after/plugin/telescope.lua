local builtin = require('telescope.builtin')
-- Fuzzy find files in working dir
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Searches for string input in files in working dir
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
-- Fuzzy finds files git ls-files outputs
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Searches for string under cursor in working dir
vim.keymap.set('n', '<C-s>', builtin.grep_string, {})
