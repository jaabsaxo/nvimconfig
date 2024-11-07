-- Lazy.vim plugin manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- set leader

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- set line numbers

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- splits

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.keymap.set('n', '<leader>tr', ':vsplit<CR>')
vim.keymap.set('n', '<leader>td', ':split<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- substitution

vim.opt.inccommand = 'split'

-- search

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- for good practice

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- niceness

vim.keymap.set('n', '<leader>2l', 'o<ESC>o<ESC>')

-- Load plugins

require("lazy").setup({
  spec = {
        "https://github.com/ggandor/leap.nvim"
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = false },
})

-- Config leap

local leap = require('leap')
leap.add_default_mappings()
