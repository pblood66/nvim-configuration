return {
    -- Mason: installs LSP servers, linters, formatters
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    -- Bridges mason <-> lspconfig
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            -- List servers to auto-install here, e.g.:
            ensure_installed = { "lua_ls", "ts_ls", "pyright" },
        },
    },

    -- LSP config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "saghen/blink.cmp", -- so capabilities are set up before LSP attaches
        },
        config = function()
            -- Feed blink.cmp capabilities into every LSP server
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Keymaps that apply when any LSP attaches to a buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP keymaps",
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", vim.lsp.buf.definition, "Go to Definition")
                    map("gD", vim.lsp.buf.declaration, "Go to Declaration")
                    map("gi", vim.lsp.buf.implementation, "Go to Implementation")
                    map("gr", vim.lsp.buf.references, "Go to References")
                    map("go", vim.lsp.buf.type_definition, "Go to Type Definition")
                    map("K", vim.lsp.buf.hover, "Hover Docs")
                    map("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                    map("<leader>d", vim.diagnostic.open_float, "Show Diagnostics")
                    map("[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
                end,
            })

            -- Configure your servers here
            local lspconfig = require("lspconfig")

            -- Example: Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = { completion = { callSnippet = "Replace" } },
                },
            })

            -- Example: TypeScript/JavaScript
            -- lspconfig.ts_ls.setup({ capabilities = capabilities })

            -- Example: Python
            -- lspconfig.pyright.setup({ capabilities = capabilities })
        end,
    },
}
