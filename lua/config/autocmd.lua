vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.o.autoformat = false
  end,
})
