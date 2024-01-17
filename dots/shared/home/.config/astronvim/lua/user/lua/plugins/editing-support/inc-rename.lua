return {
  "smjonas/inc-rename.nvim",
 enabled = false,
  opts = {},
  keys = {
    {
      "<leader>lr",
      function()
        require "inc_rename"
        return ":IncRename " .. vim.fn.expand "<cword>"
      end,
      expr = true,
      desc = "IncRename",
    },
  },
}
