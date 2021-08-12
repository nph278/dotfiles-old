set number
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set noshowmode
set noruler
set noshowcmd

syntax on

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
	Plug 'joshdick/onedark.vim'
	Plug 'preservim/nerdtree'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'evanleck/vim-svelte', {'branch': 'main'}
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'scrooloose/nerdcommenter'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'itchyny/lightline.vim'
  Plug 'LnL7/vim-nix'
  Plug 'mattn/emmet-vim'
call plug#end()

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-svelte', 
  \ 'coc-sh',
  \ 'coc-rls',
  \ 'coc-clangd',
  \ 'coc-git',
  \ 'coc-vimlsp',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-html-css-support',
  \ 'coc-toml',
  \ 'coc-python',
  \ 'coc-emmet'
  \ ]

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

colorscheme onedark

vmap + <plug>NERDCommenterToggle
nmap + <plug>NERDCommenterToggle

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>

nmap <F2> <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt

inoremap <silent><expr> <c-space> coc#refresh()

" transperent bg
hi Normal guibg=NONE ctermbg=NONE

let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
let g:user_emmet_leader_key='<C-a>'


