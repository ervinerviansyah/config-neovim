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
        "typst",
        "astro",
        "markdown",
        "markdown_inline",
        "yaml",
        "javascript",
        "typescript",
        "tsx",
        "rust",
        "ron",
        "bash",
      },
      auto_install = true,
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
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

  -- Plugin Typst Preview
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },

  -- Plugin Setup Rust
  {
    "mrcjkb/rustaceanvim",
    -- To avoid being surprised by breaking changes,
    -- I recommend you set a version range
    version = "^9",
    -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
    -- No need for lazy.nvim to lazy-load it.
    lazy = false,
  },

  -- Plugin Setup Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load { plugins = { "markdown-preview.nvim" } }
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd [[do FileType]]
    end,
  },

  -- Plugin Render Markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
      checkbox = {
        enabled = false,
      },
    },
  },

  -- Plugin Linter
  {
    "nvimtools/none-ls.nvim",
    ft = { "markdown", "sh", "bash", "yaml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require "null-ls"

      null_ls.setup {
        sources = {
          -- Linter Markdown
          null_ls.builtins.diagnostics.markdownlint,

          -- Linter Shell
          null_ls.builtins.diagnostics.shellcheck,

          -- Linter Yaml
          null_ls.builtins.diagnostics.yamllint,
        },
      }
    end,
  },

  -- Plugin Auto-Tag
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact", "typescriptreact", "astro", "markdown" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Plugin Commentstring
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = false,
  },

  -- Dependency Commentstring
  {
    "numToStr/Comment.nvim",
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  -- Plugin Todo-comment
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
    opts = {},
  },

  -- Plugin Project
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      }
      require("telescope").load_extension "projects"
    end,
  },

  -- Plugin Lazyjj

  {
    "swaits/lazyjj.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "LazyJJ", "LazyJJCurrentFile", "LazyJJToggle" },
    opts = {},
    config = function(_, opts)
      require("lazyjj").setup(opts)
    end,
  },
}
