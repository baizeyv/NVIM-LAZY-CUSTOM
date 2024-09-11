local keymaps = {
  next_hunk = "]h",
  prev_hunk = "[h",
  first_hunk = "[H",
  last_hunk = "]H",
  stage_hunk = "<localleader>ghs",
  reset_hunk = "<localleader>ghr",
  stage_buffer = "<localleader>ghS",
  undo_stage_hunk = "<localleader>ghu",
  reset_buffer = "<localleader>ghR",
  preview_hunk_inline = "<localleader>ghp",
  blame_line = "<localleader>ghb",
  blame_buffer = "<localleader>ghB",
  diff_this = "<localleader>ghd",
  diff_this_wave = "<localleader>ghD",
  gitsigns_select_hunk = "<localleader>h",
}

return {
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end
      map("n", keymaps.next_hunk, function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "Next Hunk")
      map("n", keymaps.prev_hunk, function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "Previous Hunk")
      map("n", keymaps.last_hunk, function()
        gs.nav_hunk("last")
      end, "Last Hunk")
      map("n", keymaps.first_hunk, function()
        gs.nav_hunk("first")
      end, "First Hunk")
      map({ "n", "v" }, keymaps.stage_hunk, ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, keymaps.reset_hunk, ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", keymaps.stage_buffer, gs.stage_buffer, "Stage Buffer")
      map("n", keymaps.undo_stage_hunk, gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", keymaps.reset_buffer, gs.reset_buffer, "Reset Buffer")
      map("n", keymaps.preview_hunk_inline, gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", keymaps.blame_line, function()
        gs.blame_line({ full = true })
      end, "Blame Line")
      map("n", keymaps.blame_buffer, function()
        gs.blame()
      end, "Blame Buffer")
      map("n", keymaps.diff_this, gs.diffthis, "Diff This")
      map("n", keymaps.diff_this_wave, function()
        gs.diffthis("~")
      end, "Diff This ~")
      map({ "o", "x" }, keymaps.gitsigns_select_hunk, ":<C-U>GitSigns select_hunk<CR>", "GitSigns Select Hunk")
    end,
  },
}
