lua require('plugins')

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
" default to create new tab when launch file from quickfix list
set switchbuf+=usetab,newtab
