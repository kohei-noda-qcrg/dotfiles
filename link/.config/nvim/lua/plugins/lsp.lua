-- LSP
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()
        local lspconfig = require("lspconfig")
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
                ["<C-Space>"] = require("cmp").mapping.complete(),
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
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Bash
        lspconfig.bashls.setup({
            capabilities = capabilities,
            settings = {
                bashls = {
                    shellFormatter = "shfmt",
                    shellfmtPath = "shfmt",
                    shfmtArgs = { "--apply-ignore" },
                },
            },
        })
        -- C/C++
        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = { "clangd", "--enable-config" },
            filetypes = { "c", "cpp", "objc", "objcpp" },
        })
        -- Python
        lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
                python = {
                    disableOrganizeImports = true,
                    analysis = { autoSearchPaths = true },
                },
            },
        })
        lspconfig.ruff.setup({ capabilities = capabilities })
    end
}
