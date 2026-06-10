return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",

        keys = {
            { "<leader>t", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Terminal", mode = { "n", "t" } },
            { "<leader>t", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Terminal", mode = { "t" } },
        },

        config = function()
            require("toggleterm").setup({
                direction = "horizontal",
                size = 15,
            })
            -- Function to set terminal-only keys
            function _G.set_terminal_keymaps()
                local opts = { buffer = 0 }
                vim.keymap.set('t', '<esc>', "<Cmd>q<CR>", opts)
                vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)

                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            end

            -- Tell Neovim to load these keys whenever a terminal opens
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end,

    }
}
