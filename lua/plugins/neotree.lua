return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,                      -- neo-tree will lazily load itself

        config = function()
            vim.keymap.set("n", "<leader>pt", "<cmd>Neotree filesystem reveal left<CR>", { desc = "Explorer filesystem" })
            vim.keymap.set("n", "<leader>gt", "<cmd>Neotree git_status<CR>", { desc = "Explorer git status" })
            vim.keymap.set("n", "<leader>ee", "<cmd>Neotree focus<CR>", { desc = "Focus explorer" })
            vim.keymap.set("n", "<leader>ct", "<cmd>Neotree close<CR>", { desc = "Close explorer" })
        end
    }
}
