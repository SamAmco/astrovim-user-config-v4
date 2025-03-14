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
          normal = "A",
          insert = ""
        },
        reset = {
          normal = "R",
          insert = ""
        }
      },
      window = {
        width = 0.4,
      }
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
