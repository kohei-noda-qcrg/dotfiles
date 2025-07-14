-- LSP
return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "bashls", "clangd", "fortls", "mesonlsp", "pyright", "ruff", "yamlls" }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        require("mason-lspconfig").setup()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("cmp").setup({
            snippet = {
                -- Configure snippet expansion to use LuaSnip
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = require("cmp").mapping.preset.insert({
                ["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
                ["<C-f>"] = require("cmp").mapping.scroll_docs(4),
                ["<C-k>"] = require("cmp").mapping.complete(),
                ["<C-e>"] = require("cmp").mapping.abort(),
                ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = require("cmp").config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
        })

        vim.lsp.config('*', {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
        -- Bash
        vim.lsp.config('bashls', {
            settings = {
                bashls = {
                    shellFormatter = "shfmt",
                    shellfmtPath = "shfmt",
                    shfmtArgs = { "--apply-ignore" },
                },
            },
        })
        -- C/C++
        vim.lsp.config('clangd', {
            cmd = { "clangd", "--enable-config" },
        })
        -- Python
        vim.lsp.config('pyright', {
            settings = {
                python = {
                    disableOrganizeImports = true,
                    analysis = { autoSearchPaths = true },
                },
            },
        })
        -- Yaml
        vim.lsp.config('yamlls', {
            settings = {
                yaml = {
                    format = {
                        enable = true,
                    },
                },
            },
        })
    end
}
