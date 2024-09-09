vim.cmd("set clipboard=unnamedplus")
vim.cmd("set cmdheight=1")
vim.cmd("set number relativenumber")
vim.cmd("set cmdheight=0")
vim.cmd("set nuw=1")
vim.cmd("set nowrap")
vim.cmd("set smartcase ignorecase")
vim.cmd("set tabstop=2 softtabstop=2 shiftwidth=2")

vim.opt.undofile = true
vim.opt.hlsearch = true

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


vim.g.lsp_zero_extend_lspconfig = 0
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>th", ":ToggleTerm size=7 direction=horizontal<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { noremap = true })
vim.keymap.set("n", "<C-S-h>", ":vertical resize -2<CR>", { noremap = true })
vim.keymap.set("n", "<C-S-j>", ":resize +2<CR>", { noremap = true })
vim.keymap.set("n", "<C-S-k>", ":resize -2<CR>", { noremap = true })
vim.keymap.set("n", "<C-S-l>", ":vertical resize +2<CR>", { noremap = true })
vim.keymap.set("n", "<Esc>", ":noh<return>")



local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)
map('n', '<leader>bb', '<Cmd>BufferPick<CR>', opts)
map('n', "<leader>e", "<cmd>Neotree toggle<cr>", opts)


require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").jedi_language_server.setup {}
require("lspconfig").clangd.setup {}
require("autoclose").setup()


local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
		['<CR>'] = cmp.mapping.confirm({select = false}),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.c", "*.cpp", "*.h", "*.hpp"},
  callback = function()
    vim.cmd('noautocmd silent! %!clang-format -style=file')
  end,
})


