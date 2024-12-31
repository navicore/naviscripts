-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- TODO these are NOT loaded lazy as we are not using lazyvim plugin configs -- see the file above for an example of how to load lazy

vim.api.nvim_set_keymap("n", "<C-S-Down>", ":resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Left>", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Right>", ":vertical resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Up>", ":resize -5<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', 'jj', '<Esc>`^', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<CR>', ':nohlsearch<CR><CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Enter>', 'o<Esc><CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F4>', ':w<CR>:make<CR>:copen<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<esc>', ':nohlsearch<esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>Telescope media_files<cr>', {noremap = true})

vim.api.nvim_set_keymap('x', '.', ':normal .<CR>', {noremap = true})

vim.keymap.set("n", "<leader>cg", "<cmd>CellularAutomaton game_of_life<CR>")
vim.keymap.set("n", "<leader>cr", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>cs", "<cmd>CellularAutomaton scramble<CR>")
