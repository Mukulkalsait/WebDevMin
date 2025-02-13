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
        }, -- HTML
        cssls = {}, -- CSS
        tsserver = {}, -- JavaScript/TypeScript
        tailwindcss = {}, -- Tailwind CSS
      },
    },
  },

  -- ESLint for JavaScript
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.diagnostics.eslint_d, -- ESLint for diagnostics
          null_ls.builtins.formatting.eslint_d, -- ESLint for formatting
        },
        on_attach = function(client, bufnr)
          -- Attach ESLint to PHP and .rgvp files
          if vim.bo[bufnr].filetype == "php" or vim.bo[bufnr].filetype == "rgvp" then
            null_ls.enable({ bufnr = bufnr })
          end
        end,
      }
    end,
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
}
