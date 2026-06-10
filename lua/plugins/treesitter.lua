return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  init = function() 
      local parsers = {
          "lua", 
          "vim",
          "javascript",
          "typescript",
          "gitignore",
          "json",
          "html",
      }
  end
}
