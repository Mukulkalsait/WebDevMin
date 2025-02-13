-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.laststatus = 2 -- Always show status line
vim.opt.showmode = false -- Disable mode display (already in status line)
-- vim.opt.lazyredraw = true -- Improve scrolling performance
vim.opt.syntax = "on" -- Enable syntax highlighting
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Faster key sequences
vim.filetype.add({ extension = { rgvp = "php" } })
-- vim.cmd("colorscheme carbonfox")
vim.cmd("colorscheme tokyonight-night")
