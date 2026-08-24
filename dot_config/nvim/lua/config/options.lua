local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ui
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.scrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = "┆ ", trail = "·", nbsp = "±" }
opt.wrap = false

-- editing
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"
opt.completeopt = { "menu", "menuone", "noselect" }

-- files / undo
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undolevels = 10000

-- behaviour
opt.mouse = ""
opt.clipboard = "unnamedplus"
opt.hidden = true
opt.updatetime = 250
opt.timeoutlen = 400
opt.confirm = true

if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep --smart-case"
  opt.grepformat = "%f:%l:%c:%m"
end
