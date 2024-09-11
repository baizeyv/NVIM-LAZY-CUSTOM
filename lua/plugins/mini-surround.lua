local custom_keymaps = {
  add = "<leader>ka",
  delete = "<leader>kd",
  find = "<leader>kf",
  find_left = "<leader>kF",
  highlight = "<leader>kh",
  replace = "<leader>kr",
  update_n_lines = "<leader>kn",
  suffix_last = "l",
  suffix_next = "n",
}

return {
  "echasnovski/mini.surround",
  keys = {
    { custom_keymaps.add, desc = "Add Surround", mode = { "n", "v" } },
    { custom_keymaps.delete, desc = "Delete Surround" },
    { custom_keymaps.find, desc = "Find Next Surround" },
    { custom_keymaps.find_left, desc = "Find Prev Surround" },
    { custom_keymaps.highlight, desc = "Find Highlight Surround" },
    { custom_keymaps.replace, desc = "Replace Surround" },
    { custom_keymaps.update_n_lines, desc = "Update n lines" },
  },
  opts = {
    -- Add custom surroundings to be used on top of builtin ones. For more
    -- information with examples, see `:h MiniSurround.config`.
    custom_surroundings = nil,

    -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
    highlight_duration = 500,

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      add = custom_keymaps.add, -- Add surrounding in Normal and Visual modes
      delete = custom_keymaps.delete, -- Delete surrounding
      find = custom_keymaps.find, -- Find surrounding (to the right)
      find_left = custom_keymaps.find_left, -- Find surrounding (to the left)
      highlight = custom_keymaps.highlight, -- Highlight surrounding
      replace = custom_keymaps.replace, -- Replace surrounding
      update_n_lines = custom_keymaps.update_n_lines, -- Update `n_lines`

      suffix_last = custom_keymaps.suffix_last, -- Suffix to search with "prev" method e.g.: <Leader>sdl"
      suffix_next = custom_keymaps.suffix_next, -- Suffix to search with "next" method e.g.: <Leader>sdn"
    },

    -- Number of lines within which surrounding is searched
    n_lines = 20,

    -- Whether to respect selection type:
    -- - Place surroundings on separate lines in linewise mode.
    -- - Place surroundings on each line in blockwise mode.
    respect_selection_type = false,

    -- How to search for surrounding (first inside current line, then inside
    -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
    -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
    -- see `:h MiniSurround.config`.
    search_method = "cover",

    -- Whether to disable showing non-error feedback
    silent = false,
  },
}
