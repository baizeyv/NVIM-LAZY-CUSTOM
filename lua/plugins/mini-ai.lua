return {
  "echasnovski/mini.ai",
  opts = function()
    local ai = require("mini.ai")
    return {
      n_lines = 500,
      search_method = "cover_or_next",
      silent = false,
      mappings = {
        -- Main textobject prefixes
        around = "a",
        inside = "k",

        -- Next/Last variants
        around_next = "an",
        inside_next = "kn",
        around_last = "al",
        inside_last = "kl",

        -- Move cursor to corresponding edge of `a` textobject
        goto_left = "g[", -- example: g[) previous )                g]} next }
        goto_right = "g]",
      },
      custom_textobjects = {
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }),
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
        d = { "%f[%d]%d+" },
        e = { -- word with case
          { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
          "^().*()$",
        },
        i = LazyVim.mini.ai_indent, -- indent
        g = LazyVim.mini.ai_buffer, -- buffer
        U = ai.gen_spec.function_call(), -- u for "Usage"
        u = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
        w = { "()%f[%w_]%w+_?%w*()" },
        W = { "()%f[%w_]%w+_?%w*()" },
      },
    }
  end,
}

-- v2a" the second "
-- van( visual next around (
