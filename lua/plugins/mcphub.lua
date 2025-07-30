return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  config = function() require("mcphub").setup() end,

  extensions = {
  -- This is from here: https://github.com/CopilotC-Nvim/CopilotChat.nvim/discussions/1204
    copilotchat = {
      enabled = true,
      convert_tools_to_functions = true,
      convert_resources_to_functions = true,
      add_mcp_prefix = false,
    },
  },
}
