local custom_keymaps = {
  cwd = "<leader>gG",
  root = "<leader>gg",
}
return {
  "williamboman/mason.nvim",
  keys = {
    ------------------------------
    -- disable default keymaps
    { "<leader>gG", false },
    { "<leader>gg", false },
    ------------------------------
    -- my custom keymaps
    {
      custom_keymaps.cwd,
      function()
        LazyVim.terminal.open({ "gitui" }, { esc_esc = false, ctrl_hjkl = false })
      end,
      desc = "GitUi (cwd)",
    },
    {
      custom_keymaps.root,
      function()
        LazyVim.terminal.open({ "gitui" }, { cwd = LazyVim.root.get(), esc_esc = false, ctrl_hjkl = false })
      end,
      desc = "GitUi (Root Dir)",
    },
  },
}
