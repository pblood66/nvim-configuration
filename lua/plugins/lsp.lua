return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function()
        require("conform").setup({
            formatters_by_ft = {}
        })

        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()

        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

        -- Set capabilities globally for all servers
        vim.lsp.config("*", { capabilities = capabilities })

        -- Custom server configs
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    format = { enable = true },
                },
            },
        })

        vim.lsp.config("zls", {
            root_markers = { ".git", "build.zig", "zls.json" },
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    enable_snippets = true,
                    warn_style = true,
                },
            },
        })
        vim.g.zig_fmt_parse_errors = 0
        vim.g.zig_fmt_autosave = 0

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "vtsls",
                "tailwindcss",
            },
            -- No handlers needed — vim.lsp.enable() is called automatically
        })
    end,
}
