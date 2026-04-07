-- user defined commands
vim.cmd [[cnoreabbrev bash botright terminal]]
-- vash is a short-term for 'vertical bash'
vim.cmd [[cnoreabbrev vash vertical botright terminal]]

-- Create commands to toggle formatting
vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- :FormatDisable! disables just for this buffer
        vim.b.disable_autoformat = true
    else
        -- :FormatDisable disables globally
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})
