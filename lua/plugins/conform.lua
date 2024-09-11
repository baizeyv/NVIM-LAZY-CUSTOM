return {
  "stevearc/conform.nvim",
  keys = {
    --------------------------------------------------------
    -- disable default keymaps
    { "<leader>cF", mode = { "n", "v" }, false },
    --------------------------------------------------------
    -- my custom keymaps
    {
      "<localleader>F",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Languages",
    },
  },
}
