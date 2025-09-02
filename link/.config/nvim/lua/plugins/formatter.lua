return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                -- Fortran
                fortran = { "fprettify" },

                -- Shell
                sh = { "shfmt" },
                bash = { "shfmt" },

                -- Meson
                meson = { "meson_fmt" },
            },
            formatters = {
                fprettify = {
                    command = "fprettify",
                    args = { "--silent", "-" },
                    stdin = true,
                },
                meson_fmt = {
                    command = "meson",
                    args = { "fmt", "-" },
                    stdin = true,
                },
            },
        })
    end,
}
