return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    -----------------------------------
    -- disable default keymaps
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>ge", false },
    { "<leader>be", false },
    -----------------------------------
    -- my custom keymaps
    {
      "<A-1>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<A-2>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<A-3>",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "Git Explorer",
    },
    {
      "<A-4>",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true })
      end,
      desc = "Buffer Explorer",
    },
  },
  opts = {
    use_default_mappings = false,
    window = {
      mappings = {
        ["zz"] = {
          "toggle_node",
          nowait = true, -- disable `nowait` if you have existing combos starting with this char that you want to use
        },
        ["zc"] = "close_all_nodes",
        ["zo"] = "expand_all_nodes",

        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",

        ["<esc>"] = "cancel", -- close preview or floating neo-tree window

        ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        ["<A-e>"] = { "scroll_preview", config = { direction = -10 } },
        ["<A-u>"] = { "scroll_preview", config = { direction = 10 } },
        -- Read `# Preview Mode` for more information
        ["f"] = "focus_preview",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        -- ["S"] = "split_with_window_picker",
        -- ["s"] = "vsplit_with_window_picker",
        ["t"] = "open_tabnew",
        -- ["<cr>"] = "open_drop",
        -- ["t"] = "open_tab_drop",
        ["w"] = "open_with_window_picker",
        --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
        -- ["zc"] = "close_node",
        -- ["zo"] = "expand_node",
        -- ['C'] = 'close_all_subnodes',
        ["a"] = {
          "add",
          -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            show_path = "none", -- "none", "relative", "absolute"
          },
        },
        ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
        -- ["c"] = {
        --  "copy",
        --  config = {
        --    show_path = "none" -- "none", "relative", "absolute"
        --  }
        --}
        ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["l"] = "show_file_details",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["O"] = {
          function(state)
            require("lazy.util").open(state.tree:get_node().path, { system = true })
          end,
          desc = "Open with System Application",
        },
      },
    },
    -- filesystem = {
    --   window = {
    --     mappings = {
    --       ["<bs>"] = "navigate_up",
    --       ["."] = "set_root",
    --       ["H"] = "toggle_hidden",
    --       ["/"] = "fuzzy_finder",
    --       ["D"] = "fuzzy_finder_directory",
    --       ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
    --       -- ["D"] = "fuzzy_sorter_directory",
    --       ["f"] = "filter_on_submit",
    --       ["<c-x>"] = "clear_filter",
    --       ["[g"] = "prev_git_modified",
    --       ["]g"] = "next_git_modified",
    --       ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
    --       ["oc"] = { "order_by_created", nowait = false },
    --       ["od"] = { "order_by_diagnostics", nowait = false },
    --       ["og"] = { "order_by_git_status", nowait = false },
    --       ["om"] = { "order_by_modified", nowait = false },
    --       ["on"] = { "order_by_name", nowait = false },
    --       ["os"] = { "order_by_size", nowait = false },
    --       ["ot"] = { "order_by_type", nowait = false },
    --       -- ['<key>'] = function(state) ... end,
    --     },
    --     fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
    --       ["<down>"] = "move_cursor_down",
    --       ["<C-n>"] = "move_cursor_down",
    --       ["<up>"] = "move_cursor_up",
    --       ["<C-p>"] = "move_cursor_up",
    --       -- ['<key>'] = function(state, scroll_padding) ... end,
    --     },
    --   },
    -- },
    -- buffers = {
    --   window = {
    --     mappings = {
    --       ["bd"] = "buffer_delete",
    --       ["<bs>"] = "navigate_up",
    --       ["."] = "set_root",
    --       ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
    --       ["oc"] = { "order_by_created", nowait = false },
    --       ["od"] = { "order_by_diagnostics", nowait = false },
    --       ["om"] = { "order_by_modified", nowait = false },
    --       ["on"] = { "order_by_name", nowait = false },
    --       ["os"] = { "order_by_size", nowait = false },
    --       ["ot"] = { "order_by_type", nowait = false },
    --     },
    --   },
    -- },
    git_status = {
      window = {
        mappings = {
          -- ["A"] = "git_add_all",
          -- ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gG"] = "git_commit_and_push",
          -- ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
          -- ["oc"] = { "order_by_created", nowait = false },
          -- ["od"] = { "order_by_diagnostics", nowait = false },
          -- ["om"] = { "order_by_modified", nowait = false },
          -- ["on"] = { "order_by_name", nowait = false },
          -- ["os"] = { "order_by_size", nowait = false },
          -- ["ot"] = { "order_by_type", nowait = false },
        },
      },
    },
  },
}
