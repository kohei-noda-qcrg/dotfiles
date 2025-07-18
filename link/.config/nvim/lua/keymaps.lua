-- keybindings
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { silent = true })
vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, { silent = true })
vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, { silent = true })
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, { silent = true })
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { silent = true })
vim.keymap.set("n", "<C-s>", function() vim.lsp.buf.signature_help() end, { silent = true })
vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, { silent = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true })
