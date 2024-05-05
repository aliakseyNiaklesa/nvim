require("core.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1



-- NVIM-TREE
require("nvim-tree").setup({
  view = {
    relativenumber = true,
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "—",
          arrow_open = "|",
        }
      }
    }
  }

})

local api = require "nvim-tree.api"

vim.keymap.set('n', '<leader>ee', api.tree.toggle, { desc = "NvimTree: Toggle" })
vim.keymap.set('n', '<leader>ef', api.tree.find_file, { desc = "NvimTree: Find File" })
vim.keymap.set('n', '<leader>ec', api.tree.collapse_all, { desc = "NvimTree: Collapse" })
vim.keymap.set('n', '<leader>er', api.tree.reload, { desc = "NvimTree: Tree Refresh" })
vim.keymap.set('n', '?',     api.tree.toggle_help)

-- TELESTOPE
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope: Find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope: Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope: Buffer" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope: Help" })

