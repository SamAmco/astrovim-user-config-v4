local M = {}

M.close_last_window = function()
  local all_wins = vim.api.nvim_list_wins()
  local current_win = vim.api.nvim_get_current_win()
  -- Get the last win in all wins list that isn't current_win or null
  local last_win = nil
  for i = #all_wins, 1, -1 do
    if all_wins[i] ~= current_win then
      last_win = all_wins[i]
      break
    end
  end
  if last_win == nil then return end
  vim.api.nvim_win_close(last_win, true)
end

return M
