-- initialize plugins
require("required")

-- vim cmd settings
vim.opt.termguicolors = true -- wider color palette
vim.opt.number = true -- show line number
vim.opt.tabstop = 4 -- space characters in a tab
vim.opt.shiftwidth = 4 -- space characters when doing << or >>
vim.o.showmode = false -- looks weird with lualine
vim.opt.scrolloff = 10 -- the minimum amounts of lines visible

-- configure line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true

-- configure folding
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- configure spell
vim.o.spell = true
vim.o.spelllang = "en_us"

-- needs to be after `vim.opt.termguicolors = true`
require'colorizer'.setup()

-- Yeah, so I use Arch BTW
print("I use Arch BTW")
