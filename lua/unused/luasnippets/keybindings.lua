require("luasnippets.setup")

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.jumpable(-1) then ls.jump(-1) end
end, { silent = true })

-- expand current snippet if it is a snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, {})

vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then ls.change_choice(1) end
end)
