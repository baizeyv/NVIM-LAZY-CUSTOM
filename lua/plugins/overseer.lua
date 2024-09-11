local custom_keymaps = {
  task_list = "<leader>ol",
  run_task = "<leader>or",
  action_recent_task = "<leader>oq",
  overseer_info = "<leader>oi",
  task_builder = "<leader>ob",
  task_action = "<leader>ot",
  clear_cache = "<leader>oc",
}

return {
  "stevearc/overseer.nvim",
  keys = {
    --------------------------------------
    -- disable default keymaps
    { "<leader>ow", false },
    { "<leader>oo", false },
    { "<leader>oq", false },
    { "<leader>oi", false },
    { "<leader>ob", false },
    { "<leader>ot", false },
    { "<leader>oc", false },
    --------------------------------------
    -- my custom keymaps
    { custom_keymaps.task_list, "<cmd>OverseerToggle<cr>", desc = "Task list" },
    { custom_keymaps.run_task, "<cmd>OverseerRun<cr>", desc = "Run task" },
    { custom_keymaps.action_recent_task, "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
    { custom_keymaps.overseer_info, "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
    { custom_keymaps.task_builder, "<cmd>OverseerBuild<cr>", desc = "Task builder" },
    { custom_keymaps.task_action, "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
    { custom_keymaps.clear_cache, "<cmd>OverseerClearCache<cr>", desc = "Clear cache" },
  },
}
