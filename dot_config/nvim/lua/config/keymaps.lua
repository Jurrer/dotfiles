local map = vim.keymap.set

-- clear search highlight
map("n", "<leader><space>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- window resize with arrows
map("n", "<Up>", "<cmd>resize -2<cr>")
map("n", "<Down>", "<cmd>resize +2<cr>")
map("n", "<Left>", "<cmd>vertical resize -2<cr>")
map("n", "<Right>", "<cmd>vertical resize +2<cr>")

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bp<bar>bd! #<cr>", { desc = "Delete buffer, keep window" })

-- move selected lines
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- keep the cursor in place while joining lines
map("n", "J", "mzJ`z", { desc = "Join lines, keep cursor" })

-- toggle diagnostics list
map("n", "<leader>xx", "<cmd>lopen<cr>", { desc = "Location list" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix list" })
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<cr>", { desc = "Prev quickfix" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- diagnostics
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- quick save/quit
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
