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
require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			visible = true,
		},
		window = {
			mappings = {
				["/"] = "",
			},
		},
	},
})
