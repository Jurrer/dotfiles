local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("general-settings", { clear = true })

-- highlight yanked text
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- restore cursor position when reopening a file
autocmd("BufReadPost", {
  group = general,
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- trim trailing whitespace on save
autocmd("BufWritePre", {
  group = general,
  pattern = { "*" },
  callback = function(event)
    if not vim.bo[event.buf].modifiable or vim.bo[event.buf].buftype ~= "" then
      return
    end
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- close some filetypes with q
autocmd("FileType", {
  group = general,
  pattern = { "qf", "help", "man", "lspinfo", "checkhealth", "notify" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- go to last loc when opening a buffer, unless it's a commit message
autocmd("FileType", {
  group = general,
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.colorcolumn = "72"
  end,
})

-- auto-create parent directories on save
autocmd("BufWritePre", {
  group = general,
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
