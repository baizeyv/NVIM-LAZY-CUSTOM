local custom_keymaps = {
  prefix = "<leader>r",
  v_pick_refactor = "<leader>rs",
  nv_inline_variable = "<leader>ri",
  extract_block = "<leader>rb",
  extract_block_to_file = "<leader>rf",
  debug_print = "<leader>rP",
  debug_print_variable = "<leader>rp",
  v_debug_print_variable = "<leader>rp",
  debug_cleanup = "<leader>rc",
  v_extract_function = "<leader>rf",
  v_extract_function_to_file = "<leader>rF",
  extract_variable = "<leader>rv",
}

local pick = function()
  if LazyVim.pick.picker.name == "telescope" then
    return require("telescope").extensions.refactoring.refactors()
  elseif LazyVim.pick.picker.name == "fzf" then
    local fzf_lua = require("fzf-lua")
    local results = require("refactoring").get_refactors()
    local refactoring = require("refactoring")

    local opts = {
      fzf_opts = {},
      fzf_colors = true,
      actions = {
        ["default"] = function(selected)
          refactoring.refactor(selected[1])
        end,
      },
    }
    fzf_lua.fzf_exec(results, opts)
  end
end

return {
  "ThePrimeagen/refactoring.nvim",
  keys = {
    ------------------------------------
    -- disable default keymaps
    { "<leader>r", false },
    { "<leader>rc", false },
    { "<leader>ri", false },
    { "<leader>rb", false },
    { "<leader>rf", false },
    { "<leader>rP", false },
    { "<leader>rp", false },
    { "<leader>rc", false },
    { "<leader>rF", false },
    { "<leader>rx", false },
    ------------------------------------
    -- my custom keymaps
    { custom_keymaps.prefix, "", desc = "+refactor", mode = { "n", "v" } },
    {
      custom_keymaps.v_pick_refactor,
      pick,
      mode = "v",
      desc = "Refactor",
    },
    {
      custom_keymaps.nv_inline_variable,
      function()
        require("refactoring").refactor("Inline Variable")
      end,
      mode = { "n", "v" },
      desc = "Inline Variable",
    },
    {
      custom_keymaps.extract_block,
      function()
        require("refactoring").refactor("Extract Block")
      end,
      desc = "Extract Block",
    },
    {
      custom_keymaps.extract_block_to_file,
      function()
        require("refactoring").refactor("Extract Block To File")
      end,
      desc = "Extract Block To File",
    },
    {
      custom_keymaps.debug_print,
      function()
        require("refactoring").debug.printf({ below = false })
      end,
      desc = "Debug Print",
    },
    {
      custom_keymaps.debug_print_variable,
      function()
        require("refactoring").debug.print_var({ normal = true })
      end,
      desc = "Debug Print Variable",
    },
    {
      custom_keymaps.debug_cleanup,
      function()
        require("refactoring").debug.cleanup({})
      end,
      desc = "Debug Cleanup",
    },
    {
      custom_keymaps.v_extract_function,
      function()
        require("refactoring").refactor("Extract Function")
      end,
      mode = "v",
      desc = "Extract Function",
    },
    {
      custom_keymaps.v_extract_function_to_file,
      function()
        require("refactoring").refactor("Extract Function To File")
      end,
      mode = "v",
      desc = "Extract Function To File",
    },
    {
      custom_keymaps.extract_variable,
      function()
        require("refactoring").refactor("Extract Variable")
      end,
      mode = "v",
      desc = "Extract Variable",
    },
    {
      custom_keymaps.v_debug_print_variable,
      function()
        require("refactoring").debug.print_var()
      end,
      mode = "v",
      desc = "Debug Print Variable",
    },
  },
}
