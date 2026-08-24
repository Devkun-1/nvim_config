return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
  },

  config = function()
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●", -- Or any other icon you like
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "  ",
        },
      },
    })

    -- lua
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
          codeLens = {
            enable = true,
          },
          completion = {
            callSnippet = "Replace",
          },
          doc = {
            privateName = { "^_" },
          },
          hint = {
            enable = true,
            setType = false,
            paramType = true,
            paramName = "Disable",
            semicolon = "Disable",
            arrayIndex = "Disable",
          },
        },
      },
    })

    -- clangd and arduino
    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--background-index=false",
        "--clang-tidy=false",
        "--completion-style=detailed",
        "--header-insertion=never",
      },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "ino" },
    })

    --emmet
    vim.lsp.config("emmet_language_server", {
      cmd = {
        { "emmet-language-server", "--stdio" },
      },
      filetypes = {
        "astro",
        "css",
        "eruby",
        "html",
        "htmlangular",
        "htmldjango",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "svelte",
        "typescriptreact",
        "vue",
      },
    })
  end,
}
