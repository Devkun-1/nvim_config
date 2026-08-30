require("config.options") -- options
require("config.keymaps") -- keymaps
require("config.autocmd") -- autocmd

-- icons
local icons = require("config.icons")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
  ui = {
    icons = icons.lazy,
    border = "double",
  },
})

-- vim.cmd("colorscheme solarized-osaka")
-- vim.cmd("colorscheme catppuccin")
vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme ansi")
-- vim.cmd("colorscheme zen")
-- vim.cmd("colorscheme onedarker")

local colorbuddy = require("colorbuddy")
local styles = colorbuddy.styles
local colors = colorbuddy.colors
local Group = colorbuddy.Group

Group.new("visual", colors.none, colors.none, styles.reverse, colors.none)
Group.new("BlinkCmpMenuSelection", colors.none, colors.none, styles.reverse, colors.none)
