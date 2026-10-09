---@type LazySpec
return {
  "wt-command",
  virtual = true,
  lazy = false,
  config = function()
    vim.api.nvim_create_user_command("Wt", function(opts)
      local extension = opts.args:gsub("^%.", "")
      if extension ~= "" and not extension:match("^[%w][%w._-]*$") then
        vim.notify("Invalid file extension: " .. opts.args, vim.log.levels.ERROR)
        return
      end

      local path = vim.fn.tempname() .. (extension ~= "" and "." .. extension or "")
      local ok, err = pcall(vim.cmd, "saveas! " .. vim.fn.fnameescape(path))
      if not ok then
        vim.notify("Could not write temporary file: " .. err, vim.log.levels.ERROR)
        return
      end
      vim.notify("Wrote buffer to " .. path)
    end, { nargs = "?", desc = "Write the current buffer to a temporary file" })

    -- User commands must start with a capital letter, so expose :Wt as :wt too.
    vim.cmd [[cnoreabbrev <expr> wt (getcmdtype() ==# ':' && getcmdline() ==# 'wt') ? 'Wt' : 'wt']]
  end,
}
