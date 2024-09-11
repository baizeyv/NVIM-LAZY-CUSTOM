local keymaps = {
  restore_session = "<leader>qr",
  select_session = "<leader>qs",
  restore_last_session = "<leader>qR",
  no_save = "<leader>qx",
}

return {
  "folke/persistence.nvim",
  keys = {
    -----------------------------
    -- disable default keymaps
    { "<leader>qs", false },
    { "<leader>qS", false },
    { "<leader>ql", false },
    { "<leader>qd", false },
    -----------------------------
    -- my custom keymaps
    {
      keymaps.restore_session,
      function()
        require("persistence").load()
      end,
      desc = "Restore Session",
    },
    {
      keymaps.select_session,
      function()
        require("persistence").select()
      end,
      desc = "Select Session",
    },
    {
      keymaps.restore_last_session,
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Restore Last Session",
    },
    {
      keymaps.no_save,
      function()
        require("persistence").stop()
      end,
      desc = "Don't Save Current Session",
    },
  },
}
