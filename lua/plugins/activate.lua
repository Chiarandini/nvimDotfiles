return {
  "roobert/activate.nvim",
  keys = {
    {
      "<space>P",
      '<CMD>lua require("activate").list_plugins()<CR>',
      desc = "Download new Plugins",
    },
  }
}
