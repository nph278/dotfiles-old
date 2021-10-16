-- Global Options

vim.o.number = true
vim.o.smarttab = true
vim.o.cindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.hidden = true
vim.o.termguicolors = true
vim.o.cmdheight = 1
vim.o.updatetime = 300
vim.o.guifont = 'JetBrains Mono:h10'
vim.o.backup = false
vim.o.writebackup = false
vim.o.showmode = false
vim.o.ruler = false
vim.o.showcmd = false
vim.o.completeopt = 'menu,menuone,noselect,preview'
vim.o.relativenumber = true

-- Plugins

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Theming
Plug 'joshdick/onedark.vim'

-- Files
Plug ('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
--Plug 'junegunn/fzf'
--Plug 'junegunn/fzf.vim'

-- Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-sneak'

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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
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
    jump_to_mark = '<C-t>'
  }
}

-- Files

-- following options are the default
require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  lsp_diagnostics     = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = '100%',
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}

require('nvim-treesitter').setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = false,
    disable = {}
  },
  ensure_installed = {
    "toml",
    "rust"
  }
}

require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.5 }
    },
    preview = {
      treesitter = true
    },
    border = false
  },
})

-- Keybindings

-- Tabs
vim.api.nvim_set_keymap('n', '<A-1>', '1gt', {})
vim.api.nvim_set_keymap('n', '<A-2>', '2gt', {})
vim.api.nvim_set_keymap('n', '<A-3>', '3gt', {})
vim.api.nvim_set_keymap('n', '<A-4>', '4gt', {})
vim.api.nvim_set_keymap('n', '<A-5>', '5gt', {})
vim.api.nvim_set_keymap('n', '<A-6>', '6gt', {})
vim.api.nvim_set_keymap('n', '<A-7>', '7gt', {})
vim.api.nvim_set_keymap('n', '<A-8>', '8gt', {})
vim.api.nvim_set_keymap('n', '<A-9>', '9gt', {})

-- Files
vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', {})
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<space>co', ':Telescope git_commits<CR>', {})
vim.api.nvim_set_keymap('n', '<space>br', ':Telescope git_branches<CR>', {})
vim.api.nvim_set_keymap('n', '<space>fn', ':Telescope lsp_document_symbols<CR>', {})
vim.api.nvim_set_keymap('n', 'gr', ':Telescope lsp_references<CR>', {})
vim.api.nvim_set_keymap('n', '<space>di', ':Telescope lsp_workspace_diagnostics<CR>', {})

-- Programming
vim.api.nvim_set_keymap('v', '+', '<plug>NERDCommenterToggle<CR>', {})
