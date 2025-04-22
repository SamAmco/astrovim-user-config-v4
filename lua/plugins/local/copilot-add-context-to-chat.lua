local M = {}

-- Function to find the Copilot Chat window
local function find_copilot_chat_window()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    -- Check if the buffer name contains "copilot-chat"
    if buf_name:match "copilot[-_]chat" then return win, buf end
  end
  return nil, nil
end

-- Function to add files to chat
local function add_files_to_chat(files)
  -- Find the Copilot Chat window and buffer
  local chat_win, chat_buf = find_copilot_chat_window()

  if not chat_win or not chat_buf then
    vim.notify("Copilot Chat window not found", vim.log.levels.ERROR)
    return
  end

  -- Add each file as a context line
  for _, file in ipairs(files) do
    local context_line = "> #file:`" .. file .. "`"
    vim.api.nvim_buf_set_lines(chat_buf, -1, -1, false, { context_line })
  end

  -- Position cursor at the end
  vim.api.nvim_win_set_cursor(chat_win, { vim.api.nvim_buf_line_count(chat_buf), 0 })
end

function M.add_current_file_to_chat()
  -- Check if we're in Neo-tree
  if vim.bo.filetype == "neo-tree" then
    local api = require "neo-tree.sources.manager"
    local state = api.get_state "filesystem"
    if not state then
      vim.notify("Could not get Neo-tree state", vim.log.levels.ERROR)
      return
    end

    local node = state.tree:get_node()
    if not node then
      vim.notify("No node found under cursor", vim.log.levels.ERROR)
      return
    end

    if node.type == "directory" then
      vim.notify("Cannot add directory to chat context", vim.log.levels.ERROR)
      return
    end

    -- Single file under cursor
    add_files_to_chat { node.path }
  else
    -- Regular buffer - get current file
    local current_file = vim.fn.expand "%:p"
    add_files_to_chat { current_file }
  end
end

return M
