return {
  -- nvim-cmp configuration so to not preselect completion and require tab to select
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
      })

      opts.preselect = cmp.PreselectMode.None

      local sources = {
        { name = "emoji" },
      }
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, sources))

      -- debug
      -- vim.api.nvim_echo({ { "opts.sources: " .. vim.inspect(opts.sources), "Normal" } }, true, {})
    end,
  },
}
