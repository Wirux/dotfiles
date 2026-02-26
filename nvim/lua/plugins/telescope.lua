return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "debugloop/telescope-undo.nvim",
    },
    keys = {
      { "<C-u>", "<cmd>Telescope undo<cr>", desc = "Telescope Undo" },
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<cr>", desc = "Switch Buffer" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          path_display = { "smart" },
        },
        extensions = {
          undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
              preview_height = 0.8,
            },
          },
        },
      })
      pcall(telescope.load_extension, "yank_history")
    end,
  },
}
