-- set the leader key to space
vim.g.mapleader = " "

-- open telescope-nvim
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>',
{ noremap = true, silent = true })

-- toggle folding
vim.api.nvim_set_keymap('n', 'zc', 'za', { noremap = true, silent = true })

-- toggle colorcolumn
vim.keymap.set("n", "<leader>h", "<cmd>ToggleNeoColumn<cr>",
{ noremap = true, silent = true })
