local keymaps = {
  diagnostics_trouble = "<leader>xX",
  diagnostics_buffer_trouble = "<leader>xx",
  symbols_toggle = "<leader>xs",
  lsp_toggle = "<leader>xS",
  loclist_toggle = "<leader>xl",
  qflist_toggle = "<leader>xq",
  previous_item = "[q",
  next_item = "]q",
}

return {
  "folke/trouble.nvim",
  keys = {
    ---------------------------------------
    -- disable default keymaps
    { "<leader>xx", false },
    { "<leader>xX", false },
    { "<leader>cs", false },
    { "<leader>cS", false },
    { "<leader>xL", false },
    { "<leader>xQ", false },
    { "[q", false },
    { "]q", false },
    ---------------------------------------
    -- my custom keymaps
    { keymaps.diagnostics_trouble, "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
    {
      keymaps.diagnostics_buffer_trouble,
      "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    { keymaps.symbols_toggle, "<cmd>Trouble symbols toggle<CR>", desc = "Symbols (Trouble)" },
    { keymaps.lsp_toggle, "<cmd>Trouble lsp toggle<CR>", desc = "LSP references/definitions/... (Trouble)" },
    { keymaps.loclist_toggle, "<cmd>Trouble loclist toggle<CR>", desc = "Localtion List (Trouble)" },
    { keymaps.qflist_toggle, "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
    {
      keymaps.previous_item,
      function()
        if require("trouble").is_open() then
          require("trouble").prev({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous Trouble/Quickfix Item",
    },
    {
      keymaps.next_item,
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next Trouble/Quickfix Item",
    },
  },
}
