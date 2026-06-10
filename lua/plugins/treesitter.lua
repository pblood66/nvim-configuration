return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "vim",
                "javascript",
                "typescript",
                "gitignore",
                "json",
                "html",
            },
            auto_install = true,  -- auto install when you open a file with no parser
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
