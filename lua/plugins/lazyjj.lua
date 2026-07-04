return {
  {
    "swaits/lazyjj.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "LazyJJ", "LazyJJCurrentFile", "LazyJJToggle" },
    keys = {
      { "jj", "<cmd>LazyJJ<cr>", desc = "Git (Jujutsu): Open lazyjj" },
      { "<leader>jf", "<cmd>LazyJJCurrentFile<cr>", desc = "Git (Jujutsu): lazyjj current file" },
    },
    opts = {},
  },
}
