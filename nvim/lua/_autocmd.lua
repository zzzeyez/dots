local command = vim.api.nvim_command

--command("autocmd BufRead * Minimap")
--fzy = require('fzy')
command("autocmd VimEnter * if @% == '' | lua fzy.execute('fd --hidden --exclude /library --exclude /.origin --exclude /.thugpro --exclude /.cache . ~', fzy.sinks.edit_file)")
