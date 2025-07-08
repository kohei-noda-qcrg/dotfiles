-- plugins setup
require("lazy").setup({
    require("plugins.lsp"),
    -- Appearance
    {
        "sainnhe/everforest",
        config = function()
            vim.g.everforest_background = "hard"
            vim.cmd("colorscheme everforest")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                indent = { enable = true }
            })
        end
    },
    "lewis6991/gitsigns.nvim",
    "vim-airline/vim-airline",
    "ntpeters/vim-better-whitespace",

    -- Utilities
    "junegunn/vim-easy-align",
    "honza/vim-snippets",
    "tpope/vim-surround",

    -- external command utilities
    "fresh2dev/zellij.vim",
    "github/copilot.vim",
})
