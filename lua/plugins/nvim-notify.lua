return {
  "rcarriga/nvim-notify",
  keys = {
    ----------------------------
    -- disable default keymaps
    { "<leader>un", false },
    ----------------------------
    -- my custom keybinds
    {
      "<localleader><localleader>z",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss All Notifications",
    },
  },
}
