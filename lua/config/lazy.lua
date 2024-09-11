local key = {
  home = { "H" },
  install = { "T", "t" },
  update = { "A", "a" },
  sync = { "S" },
  clean = { "X", "x" },
  check = { "C", "c" },
  log = { "L", "l" },
  restore = { "R", "r" },
  profile = { "P" },
  debug = { "D" },
  help = { "?" },
  build = { "nil", "gb" },
}

local function load_lazy_keymap()
  local command = require("lazy.view.config").commands
  for key, value in pairs(key) do
    for idx, k in ipairs(value) do
      if idx == 1 and k ~= "nil" then
        command[key].key = k
      elseif idx == 2 then
        command[key].key_plugin = k
      end
    end
  end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

load_lazy_keymap()

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
        ---@type string|fun()
        colorscheme = function()
          require("tokyonight").load()
        end,
        -- load the default settings
        defaults = {
          autocmds = true, -- lazyvim.config.autocmds
          keymaps = false, -- lazyvim.config.keymaps
          -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
          -- if you want to disable loading options, add `package.loaded["lazyvim.config.options"] = true` to the top of your init.lua
        },
        news = {
          -- When enabled, NEWS.md will be shown when changed.
          -- This only contains big new features and breaking changes.
          lazyvim = true,
          -- Same but for Neovim's news.txt
          neovim = false,
        },
        -- icons used by other plugins
        -- stylua: ignore
        icons = {
          misc = {
            dots = "󰇘",
          },
          ft = {
            octo = "",
          },
          dap = {
            Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
            Breakpoint          = " ",
            BreakpointCondition = " ",
            BreakpointRejected  = { " ", "DiagnosticError" },
            LogPoint            = ".>",
          },
          diagnostics = {
            Error = " ",
            Warn  = " ",
            Hint  = " ",
            Info  = " ",
          },
          git = {
            added    = " ",
            modified = " ",
            removed  = " ",
          },
          kinds = {
            Array         = " ",
            Boolean       = "󰨙 ",
            Class         = " ",
            Codeium       = "󰘦 ",
            Color         = " ",
            Control       = " ",
            Collapsed     = " ",
            Constant      = "󰏿 ",
            Constructor   = " ",
            Copilot       = " ",
            Enum          = " ",
            EnumMember    = " ",
            Event         = " ",
            Field         = " ",
            File          = " ",
            Folder        = " ",
            Function      = "󰊕 ",
            Interface     = " ",
            Key           = " ",
            Keyword       = " ",
            Method        = "󰊕 ",
            Module        = " ",
            Namespace     = "󰦮 ",
            Null          = " ",
            Number        = "󰎠 ",
            Object        = " ",
            Operator      = " ",
            Package       = " ",
            Property      = " ",
            Reference     = " ",
            Snippet       = " ",
            String        = " ",
            Struct        = "󰆼 ",
            TabNine       = "󰏚 ",
            Text          = " ",
            TypeParameter = " ",
            Unit          = " ",
            Value         = " ",
            Variable      = "󰀫 ",
          },
        },
        ---@type table<string, string[]|boolean>?
        kind_filter = {
          default = {
            "Class",
            "Constructor",
            "Enum",
            "Field",
            "Function",
            "Interface",
            "Method",
            "Module",
            "Namespace",
            "Package",
            "Property",
            "Struct",
            "Trait",
          },
          markdown = false,
          help = false,
          -- you can specify a different filter for each filetype
          lua = {
            "Class",
            "Constructor",
            "Enum",
            "Field",
            "Function",
            "Interface",
            "Method",
            "Module",
            "Namespace",
            -- "Package", -- remove package since luals uses it for control flow structures
            "Property",
            "Struct",
            "Trait",
          },
        },
      },
    },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "catppuccin", "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
