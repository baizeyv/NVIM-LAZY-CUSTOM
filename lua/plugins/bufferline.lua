return {
  "akinsho/bufferline.nvim",
  keys = {
    --------------------------------------------------------
    -- disable default keymaps
    { "<leader>bl", false },
    { "<leader>bp", false },
    { "<leader>bP", false },
    { "<leader>bo", false },
    { "<leader>br", false },
    { "<S-h>", false },
    { "<S-l>", false },
    { "[b", false },
    { "]b", false },
    { "[B", false },
    { "]B", false },
    --------------------------------------------------------
    -- my custom keymaps
    { "<leader>bn", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
    { "<leader>bi", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    --------------------------------------------------------
    { "<leader>bN", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer previous" },
    { "<leader>bI", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    --------------------------------------------------------
    { "<leader>bcn", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete Buffers to the Left" },
    { "<leader>bci", "<cmd>BufferLineCloseRight<cr>", desc = "Delete Buffers to the Right" },
    { "<leader>bco", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
    --------------------------------------------------------
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete Non-Pined Buffers" },
  },
}
