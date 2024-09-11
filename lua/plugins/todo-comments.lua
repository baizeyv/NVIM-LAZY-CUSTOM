-- NOTE:
-- keywords: FIX, TODO, HACK, BUG, FIXME, FIXIT, ISSUE, WARN, PERF, OPTIM, PERFORMANCE, OPTIMIZE, NOTE, INFO, TEST, TESTING, PASSED, FAILED

local keymaps = {
  next_todo = "]t",
  prev_todo = "[t",
  todo_toggle = "<leader>xt",
  todo_tag_toggle = "<leader>xT",
  todo_telescope = "<leader>sT",
  todo_tag_telescope = "<leader>st",
}

return {
  "folke/todo-comments.nvim",
  keys = {
    ---------------------------------------
    -- disable default keymaps
    { "]t", false },
    { "[t", false },
    { "<leader>xt", false },
    { "<leader>xT", false },
    { "<leader>st", false },
    { "<leader>sT", false },
    ---------------------------------------
    -- my custom keymaps
    {
      keymaps.next_todo,
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next Todo Comment",
    },
    {
      keymaps.prev_todo,
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous Todo Comment",
    },
    { keymaps.todo_toggle, "<cmd>Trouble todo toggle<CR>", desc = "TODO (Trouble)" },
    {
      keymaps.todo_tag_toggle,
      "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<CR>",
      desc = "TODO/FIX/FIXME (Trouble)",
    },
    { keymaps.todo_telescope, "<cmd>TodoTelescope<CR>", desc = "TODO" },
    { keymaps.todo_tag_telescope, "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>", desc = "Todo/Fix/Fixme" },
  },
}
