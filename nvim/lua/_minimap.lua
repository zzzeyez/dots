--vim.g.minimap_auto_start = 1
--vim.g.minimap_width = 6
--vim.g.minimap_cursor_color = minimapCursor
--vim.g.minimap_range_color = minimapRange

vim.cmd ([[
  let g:minimap_cursor_color = 'MinimapCursor'
  let g:minimap_range_color = 'MinimapRange'
  let g:minimap_base_highlight = 'MinimapBase'
  let g:minimap_highlight = 'MinimapCurrentLine'
  hi MinimapBase ctermfg=8 ctermbg=NONE
  hi MinimapCurrentLine ctermfg=1 ctermbg=3
  hi minimapCursor ctermfg=NONE ctermbg=NONE
	hi minimapRange ctermfg=8 ctermbg=NONE
]])

vim.g.minimap_enable_highlight_colorgroup = 1
vim.g.minimap_width = 6
vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1
vim.g.minimap_highlight_range = 1
vim.g.minimap_highlight = "minimapCurrent"
