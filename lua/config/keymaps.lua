-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Mode           | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
-- Command        +------+-----+-----+-----+-----+-----+------+------+
-- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |
-- opts -> "<buffer>", "<nowait>", "<silent>", "<script>", "<expr>" and "<unique>"
------------------------------------------------------------------------------------------
-- My Custom Keymaps
local map = function(modes, lhs, rhs, opts)
  if #modes > 0 then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(modes, lhs, rhs, opts)
  end
end

-- 格式: {rhs, {lhs, mode, opts}}
local keybinds = {
  toggle_case = { "~", { "~", { "n", "x" }, { silent = true } } },
  goto_mark_exact = { "`", { "`", { "n", "x" }, { silent = true } } },
  play_macro = { "@", { "@", "n", {} } },
  prev_identifier_under_cursor = { "#", { "#", { "n", "x", "o" }, {} } },
  end_of_line = { "$", { "I", { "n", "x", "o" }, {} } },
  goto_match = { "%", { "%", { "n", "x", "o" }, {} } },
  soft_begin_of_line = { "^", { "N", { "n", "x", "o" }, {} } },
  repeat_subsititute = { "&", { "&", "n", {} } },
  next_identifier_under_cursor = { "*", { "*", { "n", "x", "o" }, {} } },
  begin_sentence = { "(", { "(", { "n", "x", "o" }, {} } },
  end_sentence = { ")", { ")", { "n", "x", "o" }, {} } },
  hard_begin_of_line = { "0", { "^", { "n", "x", "o" }, {} } },
  cur_line_bol = { "_", { "_", { "n", "x", "o" }, {} } },
  prev_line_bol = { "-", { "-", { "n", "x", "o" }, {} } },
  next_line_bol = { "+", { "+", { "n", "x", "o" }, {} } },
  auto_format = { "=", { "=", "n", {} } },
  ex_mode = { "Q", { "Q", "n", {} } },
  record_macro = { "q", { "q", "n", {} } },
  next_word_begin = { "w", { "w", { "n", "x", "o" }, {} } },
  next_word_begin_include_symbol = { "W", { "W", { "n", "x", "o" }, {} } },
  next_word_end = { "e", { "h", { "n", "x", "o" }, {} } },
  next_word_end_include_symbol = { "E", { "E", { "n", "x", "o" }, {} } },
  replace_word = { "r", { "r", "n", {} } },
  replace_word_until = { "R", { "R", "n", {} } },
  next_char_until = { "t", { "t", { "n", "x", "o" }, {} } },
  prev_char_until = { "T", { "T", { "n", "x", "o" }, {} } },
  copy = { "y", { "y", { "n", "x" }, {} } },
  copy_line = { "Y", { "Y", { "n", "x" }, {} } },
  undo = { "u", { "l", "n", {} } },
  undo_line = { "U", { "L", "n", {} } },
  --insert = { "i", { "k", { "n", "x", "o" }, { remap = false } } },
  insert = { "i", { "k", { "n", "x", "o" }, {} } }, -- 使用了mini.ai,所以不需要重新映射x,o两个模式，这个插件会帮我重新映射,如果没有用这个插件则需要重新映射, 但是不映射的话类似yiw (my: ykw) 会导致k向上移动一行,所以还是映射上
  insert_bol = { "I", { "K", { "n", "x", "o" }, {} } },
  insert_next_line = { "o", { "o", "n", {} } },
  insert_prev_line = { "O", { "O", "n", {} } },
  paste_next_line = { "p", { "p", "n", {} } },
  paste_prev_line = { "P", { "P", "n", {} } },
  begin_of_paragraph = { "{", { "{", { "n", "x", "o" }, {} } },
  end_of_paragraph = { "}", { "}", { "n", "x", "o" }, {} } },
  misc_left = { "[", { "[", "n", {} } },
  misc_right = { "]", { "]", "n", {} } },
  append_after_cursor = { "a", { "a", "n", {} } },
  append_eol = { "A", { "A", { "n", "x" }, {} } },
  subst_char = { "s", { "s", { "n", "x" }, {} } },
  subst_line = { "S", { "S", { "n", "x" }, {} } },
  del = { "d", { "d", { "n", "x" }, {} } },
  del_to_eol = { "D", { "D", { "n", "x" }, {} } },
  find_next_char = { "f", { "f", { "n", "x", "o" }, {} } },
  find_prev_char = { "F", { "F", { "n", "x", "o" }, {} } },
  extra_g = { "g", { "g", { "n", "x", "o" }, {} } },
  goto_eof = { "G", { "G", { "n", "x", "o" }, {} } },
  left = { "h", { "n", { "n", "x", "o" }, {} } },
  top_screen = { "H", { "gu", { "n", "x", "o" }, {} } },
  down = { "v:count == 0 ? 'gj' : 'j'", { "e", { "n", "x", "o" }, { expr = true } } },
  join_lines = { "J", { "J", { "n", "x" }, {} } },
  up = { "v:count == 0 ? 'gk' : 'k'", { "u", { "n", "x", "o" }, { expr = true } } },
  man_page_identifier = { "K", { "<leader>h", { "n", "x" }, {} } },
  right = { "l", { "i", { "n", "x", "o" }, {} } },
  bottom_screen = { "L", { "ge", { "n", "x", "o" }, {} } },
  repeat_tfTF = { ";", { "j", { "n", "x" }, {} } },
  register = { '"', { '"', { "n", "x" }, {} } },
  goto_mark_bol = { "'", { "'", { "n", "x", "o" }, {} } },
  goto_col_num = { "|", { "|", { "n", "x", "o" }, {} } },
  quit = { "Z", { "Z", "n", {} } }, -- ZZ -> quit ZQ -> quit not save
  extra_z = { "z", { "z", { "n", "x" }, {} } },
  del_char = { "x", { "x", { "n", "x" }, {} } },
  del_char_backspace = { "X", { "X", { "n", "x" }, {} } },
  select_chars = { "v", { "v", "n", {} } },
  select_lines = { "V", { "V", "n", {} } },
  prev_word_begin = { "b", { "b", { "n", "x", "o" }, {} } },
  prev_word_begin_include_symbol = { "B", { "B", { "n", "x", "o" }, {} } },
  next_find = { "n", { ".", { "n", "x", "o" }, {} } },
  prev_find = { "N", { ",", { "n", "x", "o" }, {} } },
  set_mark = { "m", { "m", "n", {} } },
  middle_screen = { "M", { "M", { "n", "x", "o" }, {} } },
  undent = { "<<", { "<<", "n", {} } },
  indent = { ">>", { ">>", "n", {} } },
  reverse_ftFT = { ",", { "$", { "n", "x", "o" }, {} } },
  repeat_cmd = { ".", { "0", "n", {} } },
  ---------------------------------------------------------------------------------
  visual_block = { "<C-v>", { "<C-v>", { "n", "x" }, {} } },
  ---------------------------------------------------------------------------------
  cursor_center = { "zz", { "zz", "n", {} } },
  cursor_top = { "zt", { "zt", "n", {} } },
  cursor_bottom = { "zb", { "zb", "n", {} } },
  ---------------------------------------------------------------------------------
  scroll_down_whole = { "<C-f>", { "<M-.>", { "n", "x" }, {} } },
  scroll_up_whole = { "<C-b>", { "<M-,>", { "n", "x" }, {} } },
  scroll_down_line = { "<C-e>", { "<C-.>", { "n", "x" }, {} } },
  scroll_up_line = { "<C-y>", { "<C-,>", { "n", "x" }, {} } },
  scroll_down_half = { "<C-d>", { "<C->>", { "n", "x" }, {} } },
  scroll_up_half = { "<C-u>", { "<C-<>", { "n", "x" }, {} } },
  ---------------------------------------------------------------------------------
  redo = { "<C-r>", { "<C-r>", "n", {} } },
  ---------------------------------------------------------------------------------
  split_window_horizontal = { "<C-w>s", { "<C-w>s", "n", {} } },
  split_window_vertical = { "<C-w>v", { "<C-w>v", "n", {} } },
  toggle_window = { "<C-w>w", { "<C-w>w", "n", {} } },
  close_window = { "<C-w>q", { "<C-w>q", "n", {} } },
  swap_window = { "<C-w>x", { "<C-w>x", "n", {} } },
  switch_left_window = { "<C-w>h", { "<C-w>n", "n", {} } },
  switch_right_window = { "<C-w>l", { "<C-w>i", "n", {} } },
  switch_up_window = { "<C-w>k", { "<C-w>u", "n", {} } },
  switch_down_window = { "<C-w>j", { "<C-w>e", "n", {} } },
  window_same_width_height = { "<C-w>=", { "<C-w>=", "n", {} } },
  window_move_left_edge = { "<C-w>H", { "<C-w>N", "n", {} } },
  window_move_right_edge = { "<C-w>L", { "<C-w>I", "n", {} } },
  window_move_up_edge = { "<C-w>K", { "<C-w>U", "n", {} } },
  window_move_down_edge = { "<C-w>J", { "<C-w>E", "n", {} } },
  ---------------------------------------------------------------------------------
  insert_backspace = { "<BS>", { "<C-h>", "i", {} } },
  insert_del_prev_word = { "<C-w>", { "<C-w>", "i", {} } },
  insert_cr = { "<C-j>", { "<C-j>", "i", {} } },
  insert_indent = { "<C-t>", { "<C-t>", "i", {} } },
  insert_undent = { "<C-d>", { "<C-d>", "i", {} } },
  insert_cmp_next = { "<C-n>", { "<C-e>", "i", {} } },
  insert_cmp_prev = { "<C-p>", { "<C-u>", "i", {} } },
  insert_register = { "<C-r>", { "<C-r>", "i", {} } },
  insert_temp_normal = { "<C-o>", { "<C-o>", "i", {} } },
  ---------------------------------------------------------------------------------
  visual_block_corner = { "O", { "O", "x", {} } },
  visual_block_change = { "o", { "o", "x", {} } },
  ---------------------------------------------------------------------------------
  visual_indent = { ">", { ">", "x", {} } },
  visual_undent = { "<", { "<", "x", {} } },
  visual_yank = { "y", { "y", "x", {} } },
  visual_del = { "d", { "d", "x", {} } },
  visual_caps = { "~", { "~", "x", {} } },
  visual_lowercase = { "u", { "l", "x", {} } },
  visual_uppercase = { "U", { "L", "x", {} } },
  ---------------------------------------------------------------------------------
}

--- 加载自定义基础键位
local LoadCustomKeymaps = function()
  for _, value in pairs(keybinds) do
    if value[1] ~= value[2][1] then
      map(value[2][2], value[2][1], value[1], value[2][3])
    end
  end
end

LoadCustomKeymaps()
---------------------------------------------------------------------------------
-- 加载额外自定义键位

-- MOve to window using the <leader> ueni keys
map("n", "<leader>n", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<leader>i", "<C-w>l", { desc = "Go to Right Window", remap = true })
map("n", "<leader>u", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<leader>e", "<C-w>j", { desc = "Go to Lower Window", remap = true })

-- Resize window use <Ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-e>", "<cmd>m .+1<CR>==", { desc = "Move Down" })
map("n", "<A-u>", "<cmd>m .-2<CR>==", { desc = "Move Up" })
map("i", "<A-e>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-u>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-e>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-u>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- TODO: buffers

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- tabs
map("n", "<leader><tab>x", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>n", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>i", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>I", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>N", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })

-- windows
LazyVim.toggle.map("<C-w>m", LazyVim.toggle.maximize)

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", ".", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", ".", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", ".", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", ",", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", ",", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", ",", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better indenting
map("v", "<<", "<gv")
map("v", ">>", ">gv")

-- TODO: Clear search, diff update and redraw

-- keywordprg
map("n", "<leader>H", "<cmd>normal! K<cr>", { desc = "Keywordprg" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Localtion List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

map({ "n", "v" }, "<localleader>f", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- TODO: diagnostic
--

map({ "n", "x", "o" }, "E", "5j")
map({ "n", "x", "o" }, "U", "5k")

map({ "n" }, "zn", "<C-o>")
map({ "n" }, "zi", "<C-i>")

------------------------------------------------
vim.api.nvim_exec_autocmds("User", {
  pattern = "KEYMAP-SETUP",
  modeline = false,
})
