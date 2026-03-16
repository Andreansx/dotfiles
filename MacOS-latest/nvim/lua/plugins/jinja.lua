return {
  {
    "Glench/Vim-Jinja2-Syntax",
    ft = { "jinja", "jinja2", "htmldjango" },
    init = function()
      vim.g.jinja2_enable = 1
    end,
  },

  {
    "pearofducks/ansible-vim",
    ft = { "yaml", "yml", "ansible" },
    init = function()
      vim.g.ansible_enable_taskwarrior = 0
    end,
  },
}
