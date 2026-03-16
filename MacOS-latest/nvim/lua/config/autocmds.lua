-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local jinja_match_group = vim.api.nvim_create_augroup("jinja_custom_matches", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = jinja_match_group,
  pattern = { "yaml", "yml", "jinja", "jinja2", "htmldjango" },
  callback = function()
    if vim.w.jinja_match_ids then
      for _, id in ipairs(vim.w.jinja_match_ids) do
        pcall(vim.fn.matchdelete, id)
      end
    end

    vim.w.jinja_match_ids = {
      vim.fn.matchadd("Jinja2Var", "{{.\\{-}}}"),
      vim.fn.matchadd("Jinja2Block", "{%\\_.\\{-}%}"),
      vim.fn.matchadd("Jinja2Comment", "{#\\_.\\{-}#}"),
    }
  end,
})
