local custom_keymaps = {
  yank_history = "<leader>sk",
  yank = "y",
  put_after_cursor = "p",
  put_before_cursor = "P",
  put_after_selection = "gp",
  put_before_selection = "gP",
  cycle_forward = "[y",
  cycle_backward = "]y",
  put_indent_after_linewise = "]p",
  put_indent_before_linewise = "[p",
  put_indent_after_shift_right = ">p",
  put_indent_after_shift_left = "<p",
  put_indent_before_shift_right = ">P",
  put_indent_before_shift_left = "<P",
  put_after_filter = "=p",
  put_before_filter = "=P",
}
return {
  "gbprod/yanky.nvim",
  keys = {
    ------------------------
    -- disable default keymaps
    { "y", false },
    { "p", false },
    { "P", false },
    { "gp", false },
    { "gP", false },
    { "[y", false },
    { "]y", false },
    { "]p", false },
    { "[p", false },
    { "[P", false },
    { "]P", false },
    { ">p", false },
    { "<p", false },
    { ">P", false },
    { "<P", false },
    { "=p", false },
    { "=P", false },
    { "<leader>p", false },

    ------------------------
    -- my custom keymaps
    {
      custom_keymaps.yank_history,
      function()
        if LazyVim.pick.picker.name == "telescope" then
          require("telescope").extensions.yank_history.yank_history({})
        else
          vim.cmd([[YankyRingHistory]])
        end
      end,
      mode = { "n", "x" },
      desc = "Open Yank History",
    },
        -- stylua: ignore
    { custom_keymaps.yank, "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
    { custom_keymaps.put_after_cursor, "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
    {
      custom_keymaps.put_before_cursor,
      "<Plug>(YankyPutBefore)",
      mode = { "n", "x" },
      desc = "Put Text Before Cursor",
    },
    {
      custom_keymaps.put_after_selection,
      "<Plug>(YankyGPutAfter)",
      mode = { "n", "x" },
      desc = "Put Text After Selection",
    },
    {
      custom_keymaps.put_before_selection,
      "<Plug>(YankyGPutBefore)",
      mode = { "n", "x" },
      desc = "Put Text Before Selection",
    },
    { custom_keymaps.cycle_forward, "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
    { custom_keymaps.cycle_backward, "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
    {
      custom_keymaps.put_indent_after_linewise,
      "<Plug>(YankyPutIndentAfterLinewise)",
      desc = "Put Indented After Cursor (Linewise)",
    },
    {
      custom_keymaps.put_indent_before_linewise,
      "<Plug>(YankyPutIndentBeforeLinewise)",
      desc = "Put Indented Before Cursor (Linewise)",
    },
    {
      custom_keymaps.put_indent_after_shift_right,
      "<Plug>(YankyPutIndentAfterShiftRight)",
      desc = "Put and Indent Right",
    },
    {
      custom_keymaps.put_indent_after_shift_left,
      "<Plug>(YankyPutIndentAfterShiftLeft)",
      desc = "Put and Indent Left",
    },
    {
      custom_keymaps.put_indent_before_shift_right,
      "<Plug>(YankyPutIndentBeforeShiftRight)",
      desc = "Put Before and Indent Right",
    },
    {
      custom_keymaps.put_indent_before_shift_left,
      "<Plug>(YankyPutIndentBeforeShiftLeft)",
      desc = "Put Before and Indent Left",
    },
    { custom_keymaps.put_after_filter, "<Plug>(YankyPutAfterFilter)", desc = "Put After Applying a Filter" }, --粘贴到下一行并重新缩进
    { custom_keymaps.put_before_filter, "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Applying a Filter" }, -- 粘贴到上一行并重新缩进
  },
}
