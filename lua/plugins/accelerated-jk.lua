return {
  "rainbowhxch/accelerated-jk.nvim",
  event = "User KEYMAP-SETUP",
  opts = {
    mode = "time_driven",
    enable_deceleration = false,
    acceleration_motions = {},
    acceleration_limit = 150,
    acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
    -- when enable_deceleration = true
    deceleration_table = { { 150, 9999 } },
  },
  config = function(_, opts)
    require("accelerated-jk").setup(opts)
    local jk = require("accelerated-jk")

    local down_func = function()
      if vim.v.count == 0 then
        jk.move_to("gj")
      else
        jk.move_to("j")
      end
    end
    local up_func = function()
      if vim.v.count == 0 then
        jk.move_to("gk")
      else
        jk.move_to("k")
      end
    end
    local quick_down_func = function()
      if vim.v.count == 0 then
        for _ = 1, 5 do
          jk.move_to("gj")
        end
      else
        for _ = 1, 5 do
          jk.move_to("j")
        end
      end
    end
    local quick_up_func = function()
      if vim.v.count == 0 then
        for i = 1, 5 do
          jk.move_to("gk")
        end
      else
        for i = 1, 5 do
          jk.move_to("k")
        end
      end
    end

    local map = vim.keymap.set

    map({ "n", "x", "o" }, "e", down_func, { silent = true, desc = "[Move] Down" })
    map({ "n", "x", "o" }, "u", up_func, { silent = true, desc = "[Move] Up" })
    map({ "n", "x", "o" }, "U", quick_up_func, { silent = true, desc = "[Move] Up Quickly" })
    map({ "n", "x", "o" }, "E", quick_down_func, { silent = true, desc = "[Move] Down Quickly" })
  end,
}
