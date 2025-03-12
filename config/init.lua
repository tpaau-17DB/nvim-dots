-- initialize plugins
require("required")

-- vim cmd settings
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.o.showmode = false
vim.opt.shortmess:append("F")
vim.opt.scrolloff = 10

-- configure line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true

-- configure folding
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- enable spell
vim.o.spell = true
vim.o.spelllang = "en_us"

-- it needs to be after `vim.opt.termguicolors = true`
require'colorizer'.setup()

-- enable colorcolumn
require("NeoColumn").setup()

-- save the position of the cursor
vim.api.nvim_exec([[
    augroup remember_cursor_position
        autocmd!
        autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END
]], false)

vim.api.nvim_exec([[
    set viewoptions-=options
    augroup remember_folds
        autocmd!
        autocmd BufWinLeave *.* mkview
        autocmd BufWinEnter *.* silent! loadview
    augroup END
]], false)

-- local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
-- if not vim.loop.fs_stat(pipepath) then
--   vim.fn.serverstart(pipepath)
-- end

-- I use Arch BTW
print("I use Arch BTW")
