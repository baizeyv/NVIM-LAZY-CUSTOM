local custom_keymaps = {
  left = "[[",
  right = "]]",
}

return {
  "RRethy/vim-illuminate",
  keys = {
    --------------------------
    -- disable default keymaps
    { "[[", false },
    { "]]", false },
    --------------------------
    -- my custom keymaps
  },
  config = function(_, opts)
    require("illuminate").configure(opts)

    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map(custom_keymaps.right, "next")
    map(custom_keymaps.left, "prev")

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map(custom_keymaps.right, "next", buffer)
        map(custom_keymaps.left, "prev", buffer)
      end,
    })
  end,
}
