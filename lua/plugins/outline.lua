local custom_keymaps = {
  outline = "<A-7>",
}
return {
  "hedyhli/outline.nvim",
  keys = {
    --------------------------
    -- disable default keymaps
    { "<leader>cs", false },
    --------------------------
    -- my custom keymaps
    { custom_keymaps.outline, "<cmd>Outline<cr>", desc = "Toggle Outline" },
  },
}
