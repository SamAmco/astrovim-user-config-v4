return {
  -- custom config which piggybacks on the copilot extras in lazy.lua.
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          layout = {
            position = "right",
            ratio = 0.3,
          }
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          accept = true,
          keymap = {
            accept = "<Tab>",
            next = "<C-]>",
            prev = "<C-[>",
            dismiss = "<C-d>",
          },
        },
        filetypes = {
          markdown = true,
        },
      }
    end,
  },
}
