-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add({
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- })
--

-- This unmaps the annoying fuzzy finder logic of neo-tree and just falls back to
-- a normal search
require("neo-tree").setup {
  filesystem = {
    window = {
      mappings = {
        ["/"] = "",
        ["z"] = "",
        ["zM"] = "close_all_nodes",
      },
    },
  },
}

vim.api.nvim_create_user_command(
  "FormatJsonWithJQ", -- The name of your custom command (e.g., :FormatJsonWithJQ)
  function()
    -- Check if 'jq' is available in the system's PATH
    local handle = io.popen "which jq"

    if not handle then
      -- If 'which' command fails, show an error message
      vim.notify("Error: Unable to check for jq. Please ensure jq is installed and available in your PATH.", vim.log.levels.ERROR)
      return
    end

    local jq_path = handle:read "*a"
    handle:close()

    if jq_path:gsub("%s+", "") == "" then
      -- If jq is not found, show an error message
      vim.notify("Error: jq not found in your PATH. Please install jq to use :FormatJsonWithJQ.", vim.log.levels.ERROR)
      return
    end

    -- Check if the current buffer's filetype is 'json'
    local filetype = vim.bo.filetype -- 'vim.bo' refers to buffer-local options
    if filetype == "json" then
      -- Execute the 'jq .' command on the entire buffer (:%!)
      -- %! filters the entire buffer through an external command
      -- 'jq .' formats the JSON input
      vim.cmd "%!jq ."
      vim.notify("Buffer formatted with jq.", vim.log.levels.INFO)
    else
      -- If not a JSON file, show a message
      vim.notify("Current buffer is not a JSON file. Use :FormatJsonWithJQ only on JSON files.", vim.log.levels.WARN)
    end
  end,
  {
    desc = "Formats the current JSON buffer using jq", -- Description for :h :FormatJsonWithJQ
    -- This is the key part: only enable the command if the filetype is 'json'.
    -- However, nvim_create_user_command's `filetype` option applies to the *definition*
    -- of the command, not its runtime availability. The `if filetype == 'json'`
    -- check inside the function is more robust for runtime conditional execution.
    -- For true conditional *availability*, we'd typically use an autocommand,
    -- but for a simple "do nothing if not json" this internal check is fine.
    -- To make it truly *only available* for json, you'd define it in an autocommand
    -- for FileType json, but that makes it harder to discover.
    -- The current approach (always available, but warns if not json) is often preferred.
  }
)
