return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    -----------------------------------
    -- disable default keymaps
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>ge", false },
    { "<leader>be", false },
    -----------------------------------
    -- my custom keymaps
    {
      "<A-1>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<A-2>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<A-3>",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "Git Explorer",
    },
    {
      "<A-4>",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true })
      end,
      desc = "Buffer Explorer",
    },
  },
}
