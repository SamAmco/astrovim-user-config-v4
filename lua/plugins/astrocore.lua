-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `.` and `,`
        ["<Leader>."] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["<Leader>,"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        ["gt"] = {
          function()
            if vim.v.count > 0 then require("astrocore.buffer").nav_to(vim.v.count) end
          end,
          desc = "Go to buffer",
        },
        ["<Leader>q"] = {
          function() require("astrocore.buffer").close() end,
          desc = "Close Window",
        },
        -- open this file in neo tree
        ["<Leader>i"] = {
          function()
            require("neo-tree.command").execute {
              source = "filesystem",
              action = "focus",
              reveal = true,
            }
          end,
          desc = "Open in neo tree",
        },
        ["<Leader>c"] = {
          function() require("plugins.local.close-last-window").close_last_window() end,
          desc = "Close last window",
        },
        ["<Leader>a"] = { desc = "AI Tools" },
        ["<Leader>at"] = {
          desc = "Copilot chat",
          function()
            require("CopilotChat").toggle()
          end
        },
        ["<Leader>aa"] = {
          desc = "Copilot explain selected",
          function()
            vim.api.nvim_command("CopilotChatExplain")
          end
        },
        ["<Leader>ac"] = {
          desc = "Add current file to Copilot chat",
          function()
            require("plugins.local.copilot-add-context-to-chat").add_current_file_to_chat()
          end
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { name = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },

      v = {
        ["<Leader>aa"] = {
          desc = "Copilot explain selected",
          function()
            vim.api.nvim_command("CopilotChatExplain")
          end
        },
      },

      t = {
        ["kj"] = "<C-\\><C-n>",
      },

      i = {
        ["kj"] = "<Esc>",
      },

      -- Yeah they're all the same, it's annoying but yeah
      o = {
        ["ie"] = {
          function() require("various-textobjs").entireBuffer() end,
          desc = "Entire Buffer",
        },
        ["ae"] = {
          function() require("various-textobjs").entireBuffer() end,
          desc = "Entire Buffer",
        },
      },
      x = {
        ["ie"] = {
          function() require("various-textobjs").entireBuffer() end,
          desc = "Entire Buffer",
        },
        ["ae"] = {
          function() require("various-textobjs").entireBuffer() end,
          desc = "Entire Buffer",
        },
      },
    },
  },
}
