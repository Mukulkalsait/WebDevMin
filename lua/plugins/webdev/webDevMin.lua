return {
  -- PHP (PHPactor)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {
          filetypes = { "php", "rgvp" }, -- Treat .rgvp files as PHP
          on_attach = function(client, bufnr)
            -- Custom keybindings for PHP
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "gd",
              "<cmd>lua vim.lsp.buf.definition()<CR>",
              { noremap = true, silent = true }
            )
          end,
        },
      },
    },
  },

  -- HTML, CSS, JavaScript, Tailwind
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {
          filetypes = { "html", "php", "rgvp" }, -- Add PHP and .rgvp files
          on_attach = function(client, bufnr)
            -- Custom keybindings for HTML
          end,
        },
        cssls = {}, -- CSS
        tsserver = {}, -- JavaScript/TypeScript
        tailwindcss = {}, -- Tailwind CSS
      },
    },
  },

  -- ESLint LSP for JavaScript
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "php", "rgvp" }, -- Add PHP and .rgvp files
          on_attach = function(client, bufnr)
            -- Custom keybindings for ESLint
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "<leader>cf",
              "<cmd>EslintFixAll<CR>",
              { noremap = true, silent = true }
            )
          end,
        },
      },
    },
  },

  -- Prettierd for formatting
  {
    "stevearc/conform.nvim", -- A lightweight formatter plugin
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
      },
      format_on_save = false, -- Disable format on save (use manual formatting)
    },
  },

  -- TypeScript LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          cmd = { "typescript-language-server", "--stdio" }, -- Use the correct binary
          on_attach = function(client, bufnr)
            -- Custom keybindings for TypeScript
          end,
        },
      },
    },
  },

  -- React (optional)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          on_attach = function(client, bufnr)
            -- Custom keybindings for React
          end,
        },
      },
    },
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "php", -- PHP
        "html", -- HTML
        "css", -- CSS
        "javascript", -- JavaScript
        "typescript", -- TypeScript
        "tsx", -- TSX (React)
      },
    },
  },

  -- Emmet LSP for HTML completions in PHP and .rgvp files
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          filetypes = { "html", "php", "rgvp" }, -- Add PHP and .rgvp files
          on_attach = function(client, bufnr)
            -- Custom keybindings for Emmet
          end,
        },
      },
    },
  },
}
