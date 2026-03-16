return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local ensure = {
        "bash",
        "html",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "vim",
        "yaml",
      }

      opts.ensure_installed = opts.ensure_installed or {}
      for _, parser in ipairs(ensure) do
        if not vim.tbl_contains(opts.ensure_installed, parser) then
          table.insert(opts.ensure_installed, parser)
        end
      end

      opts.highlight = opts.highlight or {}
      if opts.highlight.additional_vim_regex_highlighting ~= true then
        local regex = opts.highlight.additional_vim_regex_highlighting or {}
        if type(regex) ~= "table" then
          regex = {}
        end
        if not vim.tbl_contains(regex, "yaml") then
          table.insert(regex, "yaml")
        end
        opts.highlight.additional_vim_regex_highlighting = regex
      end
    end,
  },
}
