-- This is a bit shitty but i'm just keeping it here as a backup for now since i have a license
if true then return {} end

return {
  'Exafunction/codeium.vim',
  config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
}
