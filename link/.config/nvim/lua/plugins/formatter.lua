return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    config = function()
        require("conform").setup({
            format_on_save = function(bufnr)
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return { timeout_ms = 500, lsp_fallback = true }
            end,
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
