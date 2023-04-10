local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.skip_server_setup({'rust_analyzer'})

lsp.setup()

-- Initialize rust_analyzer with rust-tools
local rt = require('rust-tools')
local rust_lsp = lsp.build_options('rust_analyzer',
{
    on_attach = function(_, bufnr)
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        vim.keymap.set("n", "<C-a>", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
})
rt.setup({server = rust_lsp})
