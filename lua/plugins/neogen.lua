local custom_keymaps = {
  neogen = "<A-/>",
}
return {
  "danymat/neogen",
  keys = {
    ------------------------------
    -- disable default keymaps
    { "<leader>cn" },
    ------------------------------
    -- my custom keymaps
    {
      custom_keymaps.neogen,
      function()
        require("neogen").generate() -- code
      end,
      desc = "Generate Annotations (Neogen)",
    },
  },
}
