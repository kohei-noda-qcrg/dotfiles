return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvimtools/none-ls.nvim",
        "williamboman/mason.nvim",
    },
    config = function()
        require('mason-null-ls').setup({
            ensure_installed = {
                "fprettify",
                "shellcheck",
                "shfmt",
            },
        })
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Fortran formatter
                null_ls.builtins.formatting.fprettify.with({
                    command = "fprettify",
                    args = {"--silent", "-"},
                    filetypes = { "fortran" },
                }),
            },
        })
    end,
}
