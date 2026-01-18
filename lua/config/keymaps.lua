-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Better window navigation
vim.keymap.set("n", "<C-S-Down>", ":resize +5<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -5<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-S-Right>", ":vertical resize +5<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-S-Up>", ":resize -5<CR>", { desc = "Decrease window height" })

-- LSP
vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, { desc = "Code action" })

-- Quick escape
vim.keymap.set("i", "jj", "<Esc>`^", { desc = "Quick escape to normal mode" })

-- File explorer
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Search
vim.keymap.set("n", "<CR>", ":nohlsearch<CR><CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "<Enter>", "o<Esc><CR>", { desc = "Insert new line below" })
-- Removed escape mapping that was interfering with command-line mode

-- Build
vim.keymap.set("n", "<F4>", ":w<CR>:make<CR>:copen<CR>", { desc = "Save, build, and open quickfix" })

-- Telescope
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope media_files<cr>", { desc = "Media files" })

-- Visual mode repeat
vim.keymap.set("x", ".", ":normal .<CR>", { desc = "Repeat last command" })

-- Cellular Automaton (fun animations)
vim.keymap.set("n", "<leader>cg", "<cmd>CellularAutomaton game_of_life<CR>", { desc = "Game of Life animation" })
vim.keymap.set("n", "<leader>cr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it rain animation" })
vim.keymap.set("n", "<leader>cs", "<cmd>CellularAutomaton scramble<CR>", { desc = "Scramble animation" })

-- Indent Blankline
vim.keymap.set("n", "<leader>i", ":IBLToggle<CR>", { silent = true, desc = "Toggle indent lines" })

-- Symbols outline
vim.keymap.set("n", "<leader>s", "<cmd>Symbols<CR>", { desc = "Show symbols outline" })
vim.keymap.set("n", "<leader>S", "<cmd>SymbolsClose<CR>", { desc = "Close symbols outline" })
