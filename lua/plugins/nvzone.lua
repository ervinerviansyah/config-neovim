return {

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
    keys = {
      keys = {
        {
          "<leader>tt",
          function()
            vim.o.showtabline = 0
            vim.o.laststatus = 0
            vim.wo.number = false
            vim.o.scl = "no"
            vim.o.cmdheight = 0
            vim.cmd("TimerlyToggle")
          end,
          desc = "Start Focus Timer",
        },
      },
    },
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
    keys = {
      { "<C-p>", "<cmd>FloatermToggle<cr>", mode = "n", silent = true, desc = "Toggle Floaterm" },
    },
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
}
