local keymaps = {
  switch_buffer = "<leader>sc",

  grep_root_dir = "<leader>s/",
  grep_cwd = "<leader>s?",

  find_files_root_dir = "<leader><space>",
  find_files_cwd = "<leader>sf",

  buffers = "<leader>sb",
  buffer = "<leader>ss",

  find_config_file = "<leader>sFc",
  find_git_files = "<leader>sFg",

  recent = "<leader>so",
  recent_cwd = "<leader>sO",

  git_commits = "<leader>sgc",
  git_status = "<leader>sgs",

  word_root_dir = "<leader>sw",
  word_cwd = "<leader>sW",

  document_diagnostics = "<leader>sd",
  workspace_diagnostics = "<leader>sD",

  quickfix_list = "<leader>sq",
  location_list = "<leader>sl",
  jumplist = "<leader>sj",

  jump_to_mark = "<leader>sm",

  registers = '<leader>s"',

  auto_commands = "<leader>sia",
  commands = "<leader>sic",
  keymaps = "<leader>sik",
  options = "<leader>sio",
  search_highlight_groups = "<leader>sih",
  command_history = "<leader>s:",

  resume = "<leader>sy",

  man_pages = "<leader>sM",
  help_pages = "<leader>sH",

  goto_symbol = "<leader>sv",
  goto_symbol_workspace = "<leader>sV",

  colorscheme_with_preview = "<leader>sp",
}

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    {
      "plenary.nvim",
    },
  },
  keys = {
    -------------------------------------
    -- disable default keymaps
    { "<leader>,", false },
    { "<leader>/", false },
    { "<leader>:", false },
    { "<leader><space>", false },
    { "<leader>fb", false },
    { "<leader>fc", false },
    { "<leader>ff", false },
    { "<leader>fF", false },
    { "<leader>fg", false },
    { "<leader>fr", false },
    { "<leader>fR", false },
    { "<leader>gc", false },
    { "<leader>gs", false },
    { '<leader>s"', false },
    { "<leader>sa", false },
    { "<leader>sb", false },
    { "<leader>sc", false },
    { "<leader>sC", false },
    { "<leader>sd", false },
    { "<leader>sD", false },
    { "<leader>sg", false },
    { "<leader>sG", false },
    { "<leader>sh", false },
    { "<leader>sH", false },
    { "<leader>sj", false },
    { "<leader>sk", false },
    { "<leader>sl", false },
    { "<leader>sM", false },
    { "<leader>sm", false },
    { "<leader>so", false },
    { "<leader>sR", false },
    { "<leader>sq", false },
    { "<leader>sw", false },
    { "<leader>sW", false },
    { "<leader>uC", false },
    { "<leader>ss", false },
    { "<leader>sS", false },
    -------------------------------------
    -- my custom keyamps
    {
      keymaps.switch_buffer,
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer (Telescope)",
    },
    { keymaps.grep_root_dir, LazyVim.pick("live_grep"), desc = "Grep (Root Dir) (Telescope)" },
    { keymaps.command_history, "<cmd>Telescope command_history<cr>", desc = "Command History (Telescope)" },
    { keymaps.find_files_root_dir, LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { keymaps.buffers, "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers (Telescope)" },
    { keymaps.find_config_file, LazyVim.pick.config_files(), desc = "Find Config File (Telescope)" },
    { keymaps.find_files_cwd, LazyVim.pick("files", { root = false }), desc = "Find Files (CWD) (Telescope)" },
    { keymaps.find_git_files, "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files) (Telescope)" },
    { keymaps.recent, "<cmd>Telescope oldfiles<cr>", desc = "Recent (Telescope)" },
    { keymaps.recent_cwd, LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (CWD) (Telescope)" },
    { keymaps.git_commits, "<cmd>Telescope git_commits<CR>", desc = "Git Commits (Telescope)" },
    { keymaps.git_status, "<cmd>Telescope git_status<CR>", desc = "Git Status (Telescope)" },
    { keymaps.registers, "<cmd>Telescope registers<cr>", desc = "Registers (Telescope)" },
    { keymaps.auto_commands, "<cmd>Telescope autocommands<cr>", desc = "Auto Commands (Telescope)" },
    { keymaps.buffer, "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current Buffer (Telescope)" },
    { keymaps.commands, "<cmd>Telescope commands<cr>", desc = "Commands (Telescope)" },
    {
      keymaps.document_diagnostics,
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      desc = "Document Diagnostics (Telescope)",
    },
    { keymaps.workspace_diagnostics, "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics (Telescope)" },
    { keymaps.grep_cwd, LazyVim.pick("live_grep", { root = false }), desc = "Grep (CWD) (Telescope)" },
    { keymaps.help_pages, "<cmd>Telescope help_tags<CR>", desc = "Help Pages (Telescope)" },
    { keymaps.search_highlight_groups, "<cmd>Telescope highlights<CR>", desc = "Search Highlight Groups (Telescope)" },
    { keymaps.jumplist, "<cmd>Telescope jumplist<CR>", desc = "Jumplist (Telescope)" },
    { keymaps.keymaps, "<cmd>Telescope keymaps<CR>", desc = "Keymaps (Telescope)" },
    { keymaps.location_list, "<cmd>Telescope loclist<CR>", desc = "Location List (Telescope)" },
    { keymaps.man_pages, "<cmd>Telescope man_pages<CR>", desc = "Man Pages (Telescope)" },
    { keymaps.jump_to_mark, "<cmd>Telescope marks<CR>", desc = "Jump to Mark (Telescope)" },
    { keymaps.options, "<cmd>Telescope vim_options<CR>", desc = "Options (Telescope)" },
    { keymaps.resume, "<cmd>Telescope resume<CR>", desc = "Resume (Telescope)" },
    { keymaps.quickfix_list, "<cmd>Telescope quickfix<CR>", desc = "Quickfix List (Telescope)" },
    { keymaps.word_root_dir, LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (Root Dir) (Telescope)" },
    {
      keymaps.word_cwd,
      LazyVim.pick("grep_string", { root = false, word_match = "-w" }),
      desc = "Word (CWD) (Telescope)",
    },
    { keymaps.word_root_dir, LazyVim.pick("grep_string"), mode = "v", desc = "Selection (Root Dir) (Telescope)" },
    {
      keymaps.word_cwd,
      LazyVim.pick("grep_string", { root = false }),
      mode = "v",
      desc = "Selection (CWD) (Telescope)",
    },
    {
      keymaps.colorscheme_with_preview,
      LazyVim.pick("colorscheme", { enable_preview = true }),
      desc = "Colorscheme with Preview (Telescope)",
    },
    {
      keymaps.goto_symbol,
      function()
        require("telescope.builtin").lsp_document_symbols({ symbols = LazyVim.config.get_kind_filter() })
      end,
      desc = "Goto Symbol",
    },
    {
      keymaps.goto_symbol_workspace,
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols({
          symbols = LazyVim.config.get_kind_filter(),
        })
      end,
      desc = "Goto Symbol (Workspace)",
    },
  },
  config = function(_, opts)
    local actions = require("telescope.actions")

    local function empty()
      -- nothing to do
    end

    local custom_opts = {
      defaults = {
        mappings = {
          n = {
            ["e"] = actions.move_selection_next,
            ["E"] = actions.move_selection_next
              + actions.move_selection_next
              + actions.move_selection_next
              + actions.move_selection_next
              + actions.move_selection_next,
            ["j"] = empty,
            ["u"] = actions.move_selection_previous,
            ["U"] = actions.move_selection_previous
              + actions.move_selection_previous
              + actions.move_selection_previous
              + actions.move_selection_previous
              + actions.move_selection_previous,
            ["k"] = empty,
            ["q"] = actions.close,
            ["<Esc>"] = empty,
            ["H"] = actions.move_to_top,
            ["L"] = actions.move_to_bottom,
            ["M"] = actions.move_to_middle,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
            ["<leader>a"] = actions.select_all,
            ["<leader>s"] = actions.add_selection,
            ["<leader>x"] = actions.remove_selection,
            ["<leader>t"] = actions.toggle_selection,
            ["<CR>"] = actions.select_default,
            ["<A-CR>"] = actions.select_vertical,
            ["<C-CR>"] = actions.select_horizontal,
            ["<S-CR>"] = actions.select_tab,
            ["<A-e>"] = actions.preview_scrolling_down,
            ["<A-u>"] = actions.preview_scrolling_up,
            ["<A-n>"] = actions.preview_scrolling_left,
            ["<A-i>"] = actions.preview_scrolling_right,
            ["<C-n>"] = actions.results_scrolling_left,
            ["<C-i>"] = actions.results_scrolling_right,
            ["<up>"] = actions.cycle_history_prev,
            ["<down>"] = actions.cycle_history_next,
          },
          i = {
            ["<C-e>"] = actions.move_selection_next,
            ["<C-u>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.results_scrolling_left,
            ["<C-i>"] = actions.results_scrolling_right,
            ["<C-c>"] = actions.close,
            ["<A-e>"] = actions.preview_scrolling_down,
            ["<A-u>"] = actions.preview_scrolling_up,
            ["<A-n>"] = actions.preview_scrolling_left,
            ["<A-i>"] = actions.preview_scrolling_right,
            ["<C-a>"] = actions.select_all,
            ["<C-s>"] = actions.add_selection,
            ["<C-r>"] = actions.remove_selection,
            ["<C-t>"] = actions.toggle_selection,
            ["<up>"] = actions.cycle_history_prev,
            ["<down>"] = actions.cycle_history_next,
          },
        },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
          height = 0.9,
          width = 0.9,
          preview_cutoff = 100,
          preview_width = 0.6,
          prompt_position = "top",
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        find_files = {
          previewer = false,
          layout_config = {
            height = 0.7,
            width = 0.7,
            prompt_position = "top",
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }
    opts = vim.tbl_deep_extend("force", opts, custom_opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
  end,
}
