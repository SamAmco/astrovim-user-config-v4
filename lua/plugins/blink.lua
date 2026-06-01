-- Completion is now handled by blink.cmp in AstroNvim v6 (replaces nvim-cmp).
-- This override preserves the customizations previously held in nvim-cmp.lua and
-- cmp-cmdline.lua. Note: <C-j>/<C-k> for next/prev and "no preselect" are already
-- blink defaults in AstroNvim v6, so they no longer need to be configured here.
---@type LazySpec
return {
  "saghen/blink.cmp",
  dependencies = { "moyiz/blink-emoji.nvim" }, -- emoji source (was cmp-emoji); remove if unwanted
  opts = {
    -- opts_extend on sources.default means these are appended, not replacing the defaults
    sources = {
      default = { "emoji" },
      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15,
          opts = { insert = true },
        },
      },
    },
    keymap = {
      -- <C-l> expands/jumps a snippet (was the luasnip expand_or_jump map in nvim-cmp)
      ["<C-l>"] = { "snippet_forward", "fallback" },
    },
    -- cmdline navigation with <C-j>/<C-k> (was cmp-cmdline.lua); path + cmdline
    -- sources are provided by blink's cmdline defaults already.
    cmdline = {
      keymap = {
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
    },
  },
}
