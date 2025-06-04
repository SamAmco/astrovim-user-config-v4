-- Customize None-ls sources

---@type LazySpec

local setup_custom_ktlint = function()
    local null_ls = require "null-ls"
    local h = require "null-ls.helpers"
    local methods = require "null-ls.methods"

    local FORMATTING = methods.internal.FORMATTING

    local custom_ktlint = h.make_builtin {
      name = "Custom ktlint",
      meta = {
        url = "https://ktlint.github.io/",
        description = "An anti-bikeshedding Kotlin linter with built-in formatter.",
      },
      method = FORMATTING,
      filetypes = { "kotlin" },
      generator_opts = {
        command = "ktlint",
        args = {
          "--format",
          "--stdin",
          "--editorconfig=/Users/sam/Documents/deliveroo/.editorconfig",
          "--log-level=none",
          -- "**/*.kt",
          -- "**/*.kts",
        },
        to_stdin = true,
      },
      factory = h.formatter_factory,
    }

    null_ls.register(custom_ktlint)
    null_ls.setup({
        debug = true,
    })
end


return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    -- local null_ls = require "null-ls"
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      -- null_ls.builtins.formatting.ktlint,
    })

    -- setup_custom_ktlint()
  end,
}
