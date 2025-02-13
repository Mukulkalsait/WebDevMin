-- jQuery specific configuration
return {
  -- LSP configuration for jQuery
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Add jQuery specific LSP settings
        quick_data = {
          -- This is specifically for jQuery intellisense
          cmd = { "quick-data" },
          filetypes = { "javascript", "html" },
          root_dir = function(fname)
            return vim.loop.cwd()
          end,
          settings = {
            jquery = {
              -- Enable jQuery specific features
              completion = true,
              hover = true,
              validate = true,
              -- Add paths to your jQuery files if needed
              paths = {
                "jquery.js",
                "jquery.min.js",
              },
            },
          },
          on_attach = function(client, bufnr)
            -- jQuery specific keybindings
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "<leader>jq",
              "<cmd>lua vim.lsp.buf.hover()<CR>",
              { noremap = true, silent = true, desc = "jQuery Docs" }
            )
          end,
        },
      },
    },
  },

  -- Add jQuery specific snippets
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      ls.add_snippets("javascript", {
        s("jq", {
          t("$("),
          i(1, "selector"),
          t(")."),
          i(2, "method"),
          t("("),
          i(3),
          t(");"),
        }),
        s("ready", {
          t("$(document).ready(function() {"),
          t({ "", "\t" }),
          i(1),
          t({ "", "});" }),
        }),
        -- Add more jQuery-specific snippets as needed
      })

      return opts
    end,
  },

  -- Treesitter configuration for better jQuery syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "javascript", -- Make sure JavaScript parser is installed
        })
      end
      return opts
    end,
  },
}
