return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("illuminate").configure({
      -- Textual matching (same word anywhere in the buffer, incl. strings
      -- and comments) instead of LSP-only semantics -> VS Code-like.
      providers = { "regex" },
      case_insensitive_regex = false,
      delay = 120,
      large_file_cutoff = 4000,
      filetypes_denylist = {
        "NvimTree",
        "TelescopePrompt",
        "neo-tree",
      },
    })

    -- VS Code-like subtle highlight for the other occurrences
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
  end,
}
