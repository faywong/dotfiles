-- Adjust the default theme's font and size.
if not CURSES then
  view:set_theme('light', {font = 'Source Code Variable', size = 18})
end

-- Always use tabs for indentation.
buffer.use_tabs = true
buffer.tab_width = 4

-- Always strip trailing spaces on save, automatically highlight the current
-- word, and use C99-style line comments in C code.
textadept.editing.strip_trailing_spaces = true
textadept.editing.highlight_words = textadept.editing.HIGHLIGHT_CURRENT
textadept.editing.comment_string.ansi_c = '//'
textadept.editing.autocomplete_all_words = true

require('ctags')
require('file_diff')
require('spellcheck')
textredux = require 'textredux'
keys['ctrl+p'] = textredux.fs.open_file
textredux.core.style.fs_directory = {underlined = true}
-- open PDF's with Okular
-- textadept.run.compile_commands.tex = 'mtxrun --autogenerate --script context --purge --synctex=-1 "%f"' and 'xdg-open "%e.pdf"'
