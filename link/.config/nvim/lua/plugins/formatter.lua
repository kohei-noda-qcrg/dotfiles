return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Fortran formatter
                null_ls.builtins.formatting.fprettify.with({
                    command = "fprettify",
                    args = { "--silent", "-" },
                    filetypes = { "fortran" },
                }),
            },
        })
    end,
}
