-- if true then return {} end

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      mappings = {
        accept_diff = {
          normal = "<C-a>",
          insert = "",
        },
        reset = {
          normal = "R",
          insert = "",
        },
      },
      window = {
        width = 0.4,
      },
      model = "claude-sonnet-4",
      tools = { "neovim" },
      -- sticky = "> @neovim",
      -- debug = true,
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}

--You can run this with :luafile % to see the current model
-- local chat = require('CopilotChat')
-- print('hello: ' .. chat.resolve_model())
