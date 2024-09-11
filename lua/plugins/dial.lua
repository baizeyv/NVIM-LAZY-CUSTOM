local custom_keymaps = {
  increment = "<C-a>",
  decrement = "<C-x>",
  g_increment = "g<C-a>",
  g_decrement = "g<C-x>",
}

local M = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
  local mode = vim.fn.mode(true)
  -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
  local is_visual = mode == "v" or mode == "V" or mode == "\22"
  local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
  local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
  return require("dial.map")[func](group)
end

return {
  "monaqa/dial.nvim",
  keys = {
    --------------------------
    -- disable default keymaps
    { "<C-a>", false },
    { "<C-x>", false },
    { "g<C-a>", false },
    { "g<C-x>", false },
    --------------------------
    -- my custom keymaps
    {
      custom_keymaps.increment,
      function()
        return M.dial(true)
      end,
      expr = true,
      desc = "Increment",
      mode = { "n", "v" },
    },
    {
      custom_keymaps.decrement,
      function()
        return M.dial(false)
      end,
      expr = true,
      desc = "Decrement",
      mode = { "n", "v" },
    },
    {
      custom_keymaps.g_increment,
      function()
        return M.dial(true, true)
      end,
      expr = true,
      desc = "Increment",
      mode = { "n", "v" },
    },
    {
      custom_keymaps.g_decrement,
      function()
        return M.dial(false, true)
      end,
      expr = true,
      desc = "Decrement",
      mode = { "n", "v" },
    },
  },
}
