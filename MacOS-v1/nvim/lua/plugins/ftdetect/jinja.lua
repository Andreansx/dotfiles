vim.filetype.add({
  pattern = {
    ["*.j2"] = "jinja",
    ["*.jinja"] = "jinja",
    ["*.jinja2"] = "jinja",
    ["templates/*"] = "jinja",
  },
})
