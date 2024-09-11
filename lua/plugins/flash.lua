return {
  "folke/flash.nvim",
  keys = {
    --------------------------------------------------------
    -- disable default keymaps
    { "s", mode = { "n", "x", "o" }, false }, -- flash search jump
    { "S", mode = { "n", "x", "o" }, false }, -- treesitter
    { "r", mode = { "o" }, false }, -- remote mode
    { "R", mode = { "o", "x" }, false }, -- treesitter search
    { "<c-s>", mode = { "c" }, false },
    --------------------------------------------------------
    -- my custom keymaps
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash search",
    },
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
