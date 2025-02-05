local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- Define the Kotlin private function snippet
local kotlin_private_function = s("private fun", {
  t "private fun ",
  i(1, "functionName"),
  t "(",
  i(2, "parameters"),
  t "): ",
  i(3, "ReturnType"),
  t { " {", "\t" },
  i(0),
  t { "", "}" },
})

-- Add the snippet to the luasnip snippets table
ls.add_snippets("kotlin", {
  kotlin_private_function,
})
