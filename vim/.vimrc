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
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" seoul256.vim is a low-contrast Vim color scheme based on Seoul Colors.
Plug 'junegunn/seoul256.vim'

" LeaderF for fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'jremmen/vim-ripgrep'
Plug 'hsanson/vim-android'

" gen & manage tags
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" git in vim
Plug 'tpope/vim-fugitive'

" dirdiff
Plug 'will133/vim-dirdiff'

" slimv
Plug 'kovisoft/slimv'

" asyncrun other tasks
Plug 'skywind3000/asyncrun.vim'

" auto complete for c/c++ code
Plug 'justmao945/vim-clang'

" Underlines the word under the cursor
Plug 'itchyny/vim-cursorword'

" rust-lang/rust.vim
Plug 'rust-lang/rust.vim'

Plug 'cdelledonne/vim-cmake'

" Plug 'xolox/vim-misc'

" Plug 'xolox/vim-notes'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

" config for plugins
"
" seoul256
" Unified color scheme (default: dark)
colo seoul256
let g:seoul256_srgb = 1

" Leaderf
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_CommandMap = {'<C-T>': ['<CR>']}

" NERDTreeToggle
noremap <c-e> :NERDTreeToggle<cr>

" vim-notes
let g:notes_directories = ['~/Documents/notes']

" gutentags
" note about the default keymap of gutentags
"keymap	        desc
"<leader>cs	Find symbol (reference) under cursor
"<leader>cg	Find symbol definition under cursor
"<leader>cd	Functions called by this function
"<leader>cc	Functions calling this function
"<leader>ct	Find text string under cursor
"<leader>ce	Find egrep pattern under cursor
"<leader>cf	Find file name under cursor
"<leader>ci	Find files #including the file name under cursor
"<leader>ca	Find places where current symbol is assigned
"<leader>cz	Find current word in ctags database
"
set statusline+=%{gutentags#statusline()}
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_project_root = ['.git', '.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

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
" slimv
let g:lisp_rainbow=1
