return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  opts = function()
    vim.keymap.del("n", "<leader>ut")
    -- local tsc = require("treesitter-context")

    -- LazyVim.toggle.map("<leader>ut", {
    --   name = "Treesitter Context",
    --   get = tsc.enabled,
    --   set = function(state)
    --     if state then
    --       tsc.enable()
    --     else
    --       tsc.disable()
    --     end
    --   end,
    -- })

    return { mode = "cursor", max_lines = 3 }
  end,
}
