return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  -- Plugin Wakatime
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  -- Plugin Neocord (buat notifikasi di Discord)
  {
    "IogaMaster/neocord",
    event = "VeryLazy",
    config = function()
      require "configs.neocord"
    end,
  },

  -- Plugin Hlchunk
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.hlchunk"
      --- require("hlchunk").setup {}
    end,
  },

  -- Dependency Plugin dari Nvzone
  {
    "nvzone/volt",
    lazy = true,
  },

  -- Plugin Menu (klik kanan)
  {
    "nvzone/menu",
    lazy = true,
  },

  -- Plugin Timerly (pomodoro)
  {
    "nvzone/timerly",
    dependencies = "nvzone/volt",
    cmd = "TimerlyToggle",
    opts = {}, -- optional
  },

  -- Plugin Minty (color picker)
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },

  -- Plugin Typr (latihan mengetik)
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },

  -- Plugin Floaterm (munculin terminal)
  {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = "FloatermToggle",
  },

  -- Plugin show keys
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      timeout = 1,
      maxkeys = 5,
      -- more opts
    },
  },

  -- Plugin Triforce
  {
    "gisketch/triforce.nvim",
    dependencies = { "nvzone/volt" },
    opts = {},
    config = function()
      require "configs.triforce"
    end,
  },

  -- Plugin Lazygit
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
