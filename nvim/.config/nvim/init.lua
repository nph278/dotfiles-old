-- Global Options

vim.o.number = true
vim.o.smarttab = true
vim.o.cindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.hidden = true
vim.o.cmdheight = 1
vim.o.updatetime = 300
vim.o.guifont = 'JetBrains Mono:h10'
vim.o.backup = false
vim.o.writebackup = false
vim.o.showmode = false
vim.o.ruler = false
vim.o.showcmd = false
vim.o.completeopt = 'menu,menuone,noselect,preview'

-- Plugins

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Theming
Plug 'joshdick/onedark.vim'

-- Files
Plug ('ms-jpq/chadtree', {branch = 'chad', ['do'] = 'python3 -m chadtree deps'})
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

-- Navigation
Plug 'christoomey/vim-tmux-navigator'

-- Programming
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'cespare/vim-toml'
Plug 'mattn/emmet-vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug ('ms-jpq/coq_nvim', {branch = 'coq'})
Plug ('ms-jpq/coq.artifacts', {branch = 'artifacts'})
Plug ('ms-jpq/coq.thirdparty', {branch = '3p'})
--Plug 'evanleck/vim-svelte', {'branch': 'main'}
--Plug 'HerringtonDarkholme/yats.vim'
--Plug 'pangloss/vim-javascript'
--Plug 'glepnir/lspsaga.nvim'
--Plug 'simrat39/rust-tools.nvim'
--Plug 'nvim-lua/popup.nvim'
--Plug 'nvim-lua/plenary.nvim'
--Plug 'nvim-telescope/telescope.nvim'
--Plug 'mfussenegger/nvim-dap'

vim.call('plug#end')


-- Colortheme
vim.cmd('colorscheme onedark')

local lualine = require('lualine')
lualine.setup{
  options = {
    theme = 'onedark',
    component_separators = {'|', '|'}
  }
}

-- LSP and completion

local nvim_lsp = require('lspconfig')

nvim_lsp.rust_analyzer.setup{}

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

vim.g.coq_settings = {
  auto_start = true,
  keymap = {
    jump_to_mark = 't'
  }
}

-- Keybindings

-- Tabs
vim.api.nvim_set_keymap('n', '1', '1gt', {})
vim.api.nvim_set_keymap('n', '2', '2gt', {})
vim.api.nvim_set_keymap('n', '3', '3gt', {})
vim.api.nvim_set_keymap('n', '4', '4gt', {})
vim.api.nvim_set_keymap('n', '5', '5gt', {})
vim.api.nvim_set_keymap('n', '6', '6gt', {})
vim.api.nvim_set_keymap('n', '7', '7gt', {})
vim.api.nvim_set_keymap('n', '8', '8gt', {})
vim.api.nvim_set_keymap('n', '9', '9gt', {})

-- Files
vim.api.nvim_set_keymap('n', '<C-e>', ':CHADopen<CR>', {})
vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>', {})

-- Programming
vim.api.nvim_set_keymap('v', '+', '<plug>NERDCommenterToggle<CR>', {})
vim.api.nvim_set_keymap('n', '+', '<plug>NERDCommenterToggle<CR>', {})

