local highlight = {
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowCyan",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowRed",
}
local rainbow_delimiters_opts = {
  query = {
    [""] = "rainbow-delimiters",
  },
  priority = {
    [""] = 110,
    lua = 210,
  },
  highlight = highlight,
}

return {
  {
    "echasnovski/mini.indentscope",
    event = "User FILE-SETUP",
    version = "*",
    opts = {
      -- Draw options
      draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 100,

        -- Animation rule for scope's first drawing. A function which, given
        -- next and total step numbers, returns wait time (in ms). See
        -- |MiniIndentscope.gen_animation| for builtin options. To disable
        -- animation, use `require('mini.indentscope').gen_animation.none()`.
        -- animation = --<function: implements constant 20ms between steps>,
        -- Symbol priority. Increase to display on top of more symbols.
        priority = 2,
      },

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Textobjects
        object_scope = "ki",
        object_scope_with_border = "ai",

        -- Motions (jump to respective border line; if not present - body line)
        goto_top = "[i",
        goto_bottom = "]i",
      },

      -- Options which control scope computation
      options = {
        -- Type of scope's border: which line(s) with smaller indent to
        -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
        border = "both",

        -- Whether to use cursor column when computing reference indent.
        -- Useful to see incremental scopes with horizontal cursor movements.
        indent_at_cursor = true,

        -- Whether to first check input line to be a border of adjacent scope.
        -- Use it if you want to place cursor on function header to get scope of
        -- its body.
        try_as_border = true,
      },

      -- Which character to use for drawing scope indicator
      -- symbol = '╎',
      symbol = "▎",
    },
  },
  vim.g.neovide and {} or { -- when launch with neovide, disable this plugin
    "echasnovski/mini.animate",
    event = "User PLUGIN-SETUP",
    opts = function()
      local animate = require("mini.animate")
      return {
        -- Cursor path
        cursor = {
          -- Whether to enable this animation
          enable = true,

          -- Timing of animation (how steps will progress in time)
          -- timing = --<function: implements linear total 250ms animation duration>,

          -- Path generator for visualized cursor movement
          -- path = --<function: implements shortest line path>,
        },

        -- Vertical scroll
        scroll = {
          -- Whether to enable this animation
          enable = true,

          -- Timing of animation (how steps will progress in time)
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }), --<function: implements linear total 250ms animation duration>,

          -- Subscroll generator based on total scroll
          -- subscroll = --<function: implements equal scroll with at most 60 steps>,
        },

        -- Window resize
        resize = {
          -- Whether to enable this animation
          enable = true,

          -- Timing of animation (how steps will progress in time)
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }), --<function: implements linear total 250ms animation duration>,

          -- Subresize generator for all steps of resize animations
          -- subresize = --<function: implements equal linear steps>,
        },

        -- Window open
        open = {
          -- Whether to enable this animation
          enable = true,

          -- Timing of animation (how steps will progress in time)
          -- timing = --<function: implements linear total 250ms animation duration>,

          -- Floating window config generator visualizing specific window
          -- winconfig = --<function: implements static window for 25 steps>,

          -- 'winblend' (window transparency) generator for floating window
          -- winblend = --<function: implements equal linear steps from 80 to 100>,
        },

        -- Window close
        close = {
          -- Whether to enable this animation
          enable = true,

          -- Timing of animation (how steps will progress in time)
          -- timing = --<function: implements linear total 250ms animation duration>,

          -- Floating window config generator visualizing specific window
          -- winconfig = --<function: implements static window for 25 steps>,

          -- 'winblend' (window transparency) generator for floating window
          -- winblend = --<function: implements equal linear steps from 80 to 100>,
        },
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
      "HiPhish/rainbow-delimiters.nvim",
      "mini.indentscope",
    },
    opts = function()
      local white_highlight = {
        "CursorColumn",
        "Whitespace",
      }
      local scope_highlight = {
        "MiniIndentscopeSymbol",
      }
      local hooks = require("ibl.hooks")

      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#ced4da" })
      end)

      return {
        scope = { highlight = scope_highlight, show_start = true, show_end = true },
        indent = {
          char = "╎",
          tab_char = "╎",
          highlight = highlight,
        },
        whitespace = {
          highlight = white_highlight,
          remove_blankline_trail = false,
        },
      }
    end,
    config = function(_, opts)
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      require("ibl").setup(opts)
      require("rainbow-delimiters.setup").setup(rainbow_delimiters_opts)
    end,
  },
}
