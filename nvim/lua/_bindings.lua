local map = require("utils").map

-- ;
map("n", ";", ":", {})

-- redo
map("n", "U", "<C-R>", {})

-- fff
map(
  "n",
  "f",
  ":F<CR>",
  {
    noremap = true,
    silent = true
  }
)

-- commenter
map("n", "c", ":SingleCommenterToggle<CR>", {silent = true})
map("n", "C", ":MultiCommenterToggle<CR>", {silent = true})

-- formatter
map("n", ";p", ":Format<CR>", {silent = true})

-- minimap
map("n", "m", ":MinimapToggle<CR>", {silent = true})

-- limelight
map("n", "l", ":Limelight<CR>", {silent = true})
map("n", "L", ":Limelight!<CR>", {silent = true})
