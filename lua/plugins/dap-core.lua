local custom_keymaps = {
  prefix = "<leader>d",
  breakpoint_condition = "<leader>dB",
  toggle_breakpoint = "<leader>db",
  continue = "<leader>dc",
  continue_with_args = "<leader>da",
  run_to_cursor = "<Leader>dC",
  go_to_line = "<leader>dg",
  step_into = "<leader>dk",
  down = "<leader>de",
  up = "<leader>du",
  run_last = "<leader>dl",
  step_out = "<leader>do",
  step_over = "<leader>dO",
  pause = "<leader>dp",
  toggle_REPL = "<leader>dr",
  session = "<leader>ds",
  terminate = "<leader>dt",
  widgets = "<leader>dw",
  ui_toggle = "<leader>dv",
  ui_eval = "<leader>dz",
}

return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      ------------------------------
      -- disable default keymaps
      { "<leader>d", false },
      { "<leader>dB", false },
      { "<leader>db", false },
      { "<leader>dc", false },
      { "<leader>da", false },
      { "<leader>dC", false },
      { "<leader>dg", false },
      { "<leader>di", false },
      { "<leader>dj", false },
      { "<leader>dk", false },
      { "<leader>dl", false },
      { "<leader>do", false },
      { "<leader>dO", false },
      { "<leader>dp", false },
      { "<leader>dr", false },
      { "<leader>ds", false },
      { "<leader>dt", false },
      { "<leader>dw", false },
      ------------------------------
      -- my custom keymaps
      { custom_keymaps.prefix, "", desc = "+debug", mode = { "n", "v" } },
      {
        custom_keymaps.breakpoint_condition,
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        custom_keymaps.toggle_breakpoint,
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        custom_keymaps.continue,
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        custom_keymaps.continue_with_args,
        function()
          require("dap").continue({ before = get_args })
        end,
        desc = "Run with Args",
      },
      {
        custom_keymaps.run_to_cursor,
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        custom_keymaps.go_to_line,
        function()
          require("dap").goto_()
        end,
        desc = "Go to Line (No Execute)",
      },
      {
        custom_keymaps.step_into,
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        custom_keymaps.down,
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        custom_keymaps.up,
        function()
          require("dap").up()
        end,
        desc = "Up",
      },
      {
        custom_keymaps.run_last,
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        custom_keymaps.step_out,
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        custom_keymaps.step_over,
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        custom_keymaps.pause,
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        custom_keymaps.toggle_REPL,
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        custom_keymaps.session,
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        custom_keymaps.terminate,
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        custom_keymaps.widgets,
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      ------------------------------
      -- disable default keymaps
      { "<leader>du", false },
      { "<leader>de", false },
      ------------------------------
      -- my custom keymaps
      {
        custom_keymaps.ui_toggle,
        function()
          require("dapui").toggle({})
        end,
        desc = "Dap UI",
      },
      {
        custom_keymaps.ui_eval,
        function()
          require("dapui").eval()
        end,
        desc = "Eval",
        mode = { "n", "v" },
      },
    },
  },
}
