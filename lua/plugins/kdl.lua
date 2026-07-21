return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add({
        extension = {
          kdl = "kdl",
        },
      })
      if type(opts.ensure_installed) == "table" then
        table.insert(opts.ensure_installed, "kdl")
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kdl_lsp = {
          cmd = { "kdl-lsp" },
          filetypes = { "kdl" },
          root_dir = function(fname)
            local lspconfig = require("lspconfig")
            return lspconfig.util.root_pattern(".git")(fname) or lspconfig.util.path.dirname(fname)
          end,
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        kdl = { "kdlfmt" },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "kdlfmt")
    end,
  },
}
