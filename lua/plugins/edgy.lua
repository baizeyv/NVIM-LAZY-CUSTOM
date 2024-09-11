return {
  "folke/edgy.nvim",
  keys = {
    ---------------------------
    -- disable default keymaps
    { "<leader>ue", false },
    ---------------------------
    -- my custom keymaps
  },
  config = function(_, opts)
    local custom_opts = {
      animate = {
        cps = 1000,
      },
      keys = {
        -- close window
        ["q"] = function(win)
          win:close()
        end,
        -- hide window
        ["<c-q>"] = function(win)
          win:hide()
        end,
        -- close sidebar
        ["Q"] = function(win)
          win.view.edgebar:close()
        end,
        -- next open window
        ["]w"] = function(win)
          win:next({ visible = true, focus = true })
        end,
        -- previous open window
        ["[w"] = function(win)
          win:prev({ visible = true, focus = true })
        end,
        -- next loaded window
        ["]W"] = function(win)
          win:next({ pinned = false, focus = true })
        end,
        -- prev loaded window
        ["[W"] = function(win)
          win:prev({ pinned = false, focus = true })
        end,
        -- increase width
        ["<c-Right>"] = function(win)
          win:resize("width", 2)
        end,
        -- decrease width
        ["<c-Left>"] = function(win)
          win:resize("width", -2)
        end,
        -- increase height
        ["<c-Up>"] = function(win)
          win:resize("height", 2)
        end,
        -- decrease height
        ["<c-Down>"] = function(win)
          win:resize("height", -2)
        end,
        -- reset all custom sizing
        ["<c-w>="] = function(win)
          win.view.edgebar:equalize()
        end,
      },
    }
    opts = vim.tbl_deep_extend("force", opts, custom_opts)
    require("edgy").setup(opts)
  end,
}
