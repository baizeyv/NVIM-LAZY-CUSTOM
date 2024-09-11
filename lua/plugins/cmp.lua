local custom_keys = {
  snippet_next = "<Tab>",
  snippet_prev = "<S-Tab>",
  select_next = "<c-e>",
  select_prev = "<c-u>",
  scroll_down = "<M-e>",
  scroll_up = "<M-u>",
  complete = "<C-i>",
  abort = "<C-n>",
  confirm = "<CR>",
  confirm_replace = "<S-CR>",
  newline = "<C-CR>",
}

local auto_indent_opts = {
  lightmode = true, -- Lightmode assumes tabstop and indentexpr not change within buffer's lifetime
  indentexpr = function(lnum)
    return require("nvim-treesitter.indent").get_indent(lnum)
  end, -- Use vim.bo.indentexpr by default, see 'Custom Indent Evaluate Method'
  ignore_filetype = {}, -- Disable plugin for specific filetypes, e.g. ignore_filetype = { 'javascript' }
}

return {
  "hrsh7th/nvim-cmp",
  version = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "hrsh7th/cmp-cmdline",
      keys = { ":", "/", "?" },
    },
    {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
        search_paths = {
          vim.fn.stdpath("config") .. "/snippets",
        },
      },
      dependencies = {
        {
          "rafamadriz/friendly-snippets",
          dependencies = {
            "vidocqh/auto-indent.nvim",
          },
        },
      },
      keys = {
        {
          custom_keys.snippet_next,
          function()
            if vim.snippet.active({ direction = 1 }) then
              vim.schedule(function()
                vim.snippet.jump(1)
              end)
              return
            end
            local ok, _ = pcall(require, "auto-indent")
            if ok then
              local module = require("auto-indent.module")
              local function put_chars(indent_char, indent_num, computed_indents, colnr)
                if colnr ~= 0 then
                  return string.rep(indent_char, indent_num)
                end
                return string.rep(indent_char, computed_indents > 0 and computed_indents or indent_num)
              end

              local _, buf, row, col = require("auto-indent.module").get_current_win_buf_pos()
              if auto_indent_opts.lightmode then
                if module.indent_info_tbl[buf] == nil then
                  module.fetch_buf_indent_info(buf, auto_indent_opts.indentexpr)
                  if module.indent_info_tbl[buf] == nil then
                    return "<TAB>"
                  end
                end
                local indent_char = module.indent_info_tbl[buf].indent_char
                local indent_num = module.indent_info_tbl[buf].indent_num
                local indents = module.get_current_line_indent_light(buf, row)
                return put_chars(indent_char, indent_num, indents, col)
              else
                local indent_char = vim.bo[buf].expandtab and " " or "\t"
                local indent_num = vim.bo[buf].tabstop
                local indents = module.get_current_line_indent(buf, row, auto_indent_opts.indentexpr)
                return put_chars(indent_char, indent_num, indents, col)
              end
              return
            end
            return "<Tab>"
          end,
          expr = true,
          silent = true,
          mode = "i",
        },
        {
          custom_keys.snippet_next,
          function()
            return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<CR>" or "<Tab>"
          end,
          expr = true,
          silent = true,
          mode = "s",
        },
        {
          custom_keys.snippet_prev,
          function()
            return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(-1)<CR>" or "<S-Tab>"
          end,
          expr = true,
          silent = true,
          mode = { "i", "s" },
        },
      },
    },
  },
  opts = function(_, opts)
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    local WIDE_HEIGHT = 40
    local types = require("cmp.types")
    local auto_select = true

    local custom_opts = {
      auto_brackets = {},
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 500,
        confirm_resolve_timeout = 80,
        async_budget = 1,
        max_view_entries = 200,
      },
      preselect = types.cmp.PreselectMode.Item,
      completion = {
        autocomplete = {
          types.cmp.TriggerEvent.TextChanged,
        },
        completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1,
      },
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      window = {
        completion = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          -- border = "rounded",
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
          winblend = vim.o.pumblend,
          scrolloff = 0,
          col_offset = 0,
          side_padding = 1,
          scrollbar = true,
        },
        documentation = {
          max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)) * 3,
          max_width = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))) * 2,
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          -- border = "rounded",
          winhighlight = "FloatBorder:NormalFloat",
          winblend = vim.o.pumblend,
        },
      },
      mapping = cmp.mapping.preset.insert({
        [custom_keys.select_next] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        [custom_keys.select_prev] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        [custom_keys.scroll_down] = cmp.mapping.scroll_docs(1),
        [custom_keys.scroll_up] = cmp.mapping.scroll_docs(-1),
        [custom_keys.complete] = cmp.mapping.complete(),
        [custom_keys.abort] = cmp.mapping.abort(),
        [custom_keys.confirm] = cmp.mapping.confirm({ select = true }),
        [custom_keys.confirm_replace] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        [custom_keys.newline] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      view = {
        entries = {
          name = "custom",
          selection_order = "top_down",
          follow_cursor = true,
        },
        docs = {
          auto_open = true,
        },
      },
      enabled = function()
        -- disable completion in comments
        local context = require("cmp.config.context")
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        else
          return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        end
      end,
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
    return vim.tbl_deep_extend("force", opts, custom_opts)
  end,
}
