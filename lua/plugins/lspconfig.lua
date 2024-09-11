return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable all built-in lsp keybinds
    keys[#keys + 1] = { "<leader>cl", false } -- remove lsp info keybind
    keys[#keys + 1] = { "gd", false }
    keys[#keys + 1] = { "gr", false }
    keys[#keys + 1] = { "gI", false }
    keys[#keys + 1] = { "gy", false }
    keys[#keys + 1] = { "gD", false }
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gK", false }
    keys[#keys + 1] = { "<c-k>", false }
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>cc", false }
    keys[#keys + 1] = { "<leader>cC", false }
    keys[#keys + 1] = { "<leader>cR", false }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "<leader>cA", false }
    keys[#keys + 1] = { "]]", false }
    keys[#keys + 1] = { "[[", false }
    keys[#keys + 1] = { "<a-n>", false }
    keys[#keys + 1] = { "<a-p>", false }
    -------------------------------------------
    -- my custom lsp keybinds
    keys[#keys + 1] = { "<leader>;cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" }
    keys[#keys + 1] = { "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" }
    keys[#keys + 1] = { "gr", vim.lsp.buf.references, desc = "References", nowait = true }
    keys[#keys + 1] = { "gi", vim.lsp.buf.implementation, desc = "Goto Implementation" }
    keys[#keys + 1] = { "gt", vim.lsp.buf.type_definition, desc = "Goto Type Definition" }
    keys[#keys + 1] = { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" }
    keys[#keys + 1] = { "<leader>h", vim.lsp.buf.hover, desc = "Hover" }
    keys[#keys + 1] = { "gh", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" }
    keys[#keys + 1] =
      { "<c-;>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" }
    keys[#keys + 1] =
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
    keys[#keys + 1] =
      { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" }, has = "codeLens" }
    keys[#keys + 1] = {
      "<leader>cC",
      vim.lsp.codelens.refresh,
      desc = "Refresh & Display Codelens",
      mode = { "n" },
      has = "codeLens",
    }
    keys[#keys + 1] = {
      "<leader>cR",
      LazyVim.lsp.rename_file,
      desc = "Rename File",
      mode = { "n" },
      has = { "workspace/didRenameFiles", "workspace/willRenameFiles" },
    }
    keys[#keys + 1] = { "<leader>ct", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    keys[#keys + 1] = { "<leader>cA", LazyVim.lsp.action.source, desc = "Source Action", has = "codeAction" }
    keys[#keys + 1] = {
      "]]",
      function()
        LazyVim.lsp.words.jump(vim.v.count1, true)
      end,
      has = "documentHighlight",
      desc = "Next Reference",
      cond = function()
        return LazyVim.lsp.words.enabled
      end,
    }
    keys[#keys + 1] = {
      "[[",
      function()
        LazyVim.lsp.words.jump(-vim.v.count1, true)
      end,
      has = "documentHighlight",
      desc = "Prev Reference",
      cond = function()
        return LazyVim.lsp.words.enabled
      end,
    }
  end,
}
