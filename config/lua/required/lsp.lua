-- Import the LSP and completion modules
local nvim_lsp = require('lspconfig')
local cmp = require('cmp')

-- Set up nvim-cmp for autocompletion
cmp.setup({
  snippet = {
    expand = function(args)
      -- Uncomment and use if you have vsnip installed
      -- vim.fn["vsnip#anonymous"](args.body)  
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- ['<CR>'] = cmp.mapping.complete(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
})

-- Define a simple `on_attach` function to be used with LSPs
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end
end

-- List of LSP servers to configure
local servers = { 'pyright', 'ts_ls', 'clangd', 'glsl_analyzer', 'omnisharp' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  })
end


nvim_lsp.omnisharp.setup{
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  on_attach = function(client, bufnr)
  end,
}

nvim_lsp.glsl_analyzer.setup({
  cmd = { "glsl_analyzer", "--stdio" },
  filetypes = { "glsl", "frag", "vert", "comp", "gdshader" },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
})

nvim_lsp.clangd.setup({
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
})

-- Custom highlight for LSP-defined symbols
-- You should probably disable this if you are using a different theme
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, 'Function', { fg = '#7a9d9d', ctermfg = 14 })
    vim.api.nvim_set_hl(0, 'Operator', { fg = '#ab96ba', ctermfg = 14 })
    vim.api.nvim_set_hl(0, '@variable', { fg = '#B1B5B4', ctermfg = 14 })
    vim.api.nvim_set_hl(0, 'Type', { fg = '#87AFD7', ctermfg = 14 })
    vim.api.nvim_set_hl(0, 'TSFunction', { fg = '#7a9d9d', ctermfg = 14 })
    vim.api.nvim_set_hl(0, 'LspFunction', { fg = '#7a9d9d', ctermfg = 14 })
  end,
})
