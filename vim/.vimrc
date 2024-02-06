" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'junegunn/vim-github-dashboard'

Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" seoul256.vim is a low-contrast Vim color scheme based on Seoul Colors.
Plug 'junegunn/seoul256.vim'

" LeaderF for fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'jremmen/vim-ripgrep'

" git in vim
Plug 'tpope/vim-fugitive'

" for common lisp develop
Plug 'vlime/vlime', {'rtp': 'vim/'}

" Underlines the word under the cursor
Plug 'itchyny/vim-cursorword'

Plug 'brookhong/cscope.vim'

" TMux - Vim integration
"
Plug 'christoomey/vim-tmux-navigator'

Plug 'dkprice/vim-easygrep'

" gruvbox colorscheme
Plug 'morhetz/gruvbox'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'vim-scripts/VimCompletesMe'
Plug 'rust-lang/rust.vim'

" Initialize plugin system
call plug#end()

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

" config for plugins
"
" Unified color scheme (default: dark)
let g:gruvbox_contrast_dark='medium'
set background=dark
colorscheme gruvbox

" Leaderf
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_CommandMap = {'<C-T>': ['<CR>']}

" indent
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

" for rust-lang/rust.vim
syntax enable
filetype plugin indent on

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
" default to create new tab when launch file from quickfix list
set switchbuf+=usetab,newtab

" vim 101 articles
" Quick Movement: https://medium.com/usevim/vim-101-quick-movement-c12889e759e0
"
" set GUI Font(MacVim, GVIM)
set guifont=Fira\ Code:h18

"" clang_complete is installed into ~/.vim without Plug management, how to
" install: git clone https://github.com/xavierd/clang_complete.git /tmp/clang_complete
" cp -r /tmp/clang_complete/* ~/.vim
" Compiler options can be configured in a .clang_complete file in each project root
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

noremap <c-e> :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>

nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>


" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
let g:tmux_navigator_no_mappings = 1

noremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
noremap <silent> <C-w> :<C-U>TmuxNavigatePrevious<cr>

" vlime config
let g:vlime_enable_autodoc = v:true
let g:vlime_window_settings = {'sldb': {'pos': 'belowright', 'vertical': v:true}, 'inspector': {'pos': 'belowright', 'vertical': v:true}, 'preview': {'pos': 'belowright', 'size': v:null, 'vertical': v:true}}
