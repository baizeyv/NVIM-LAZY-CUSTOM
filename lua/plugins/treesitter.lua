local keymaps = {
  init_select = "<S-Space>",
  node_incremental = "<S-Space>",
  node_decremental = "<S-BS>",
}

return {
  "nvim-treesitter/nvim-treesitter",
  keys = {
    ---------------------------------------
    -- disable default keymaps
    { "<c-space>", false },
    { "<bs>", false },
    ---------------------------------------
    -- my custom keymaps
    { keymaps.node_incremental, desc = "Increment Selection" },
    { keymaps.node_decremental, desc = "Decrement Selection", mode = "x" },
  },
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = keymaps.init_select,
        node_incremental = keymaps.node_incremental,
        scope_incremental = false,
        node_decremental = keymaps.node_decremental,
      },
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]a"] = "@parameter.outer",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
          ["]A"] = "@parameter.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
          ["[a"] = "@parameter.outer",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
          ["[A"] = "@parameter.outer",
        },
      },
    },
  },
}
