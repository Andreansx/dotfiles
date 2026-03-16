return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
    },
    on_colors = function(colors)
      colors.bg = "#181615"
      colors.fg = "#EADDD7"
      colors.bg_dark = "#181615"
      colors.fg_dark = "#D0C6BD"

      colors.bg_float = "#181615"
      colors.bg_highlight = "#3E3834"
      colors.bg_popup = "#181615"
      colors.bg_search = "#3E3834"
      colors.bg_sidebar = "#181615"
      colors.bg_statusline = "#181615"
      colors.bg_visual = "#3E3834"
      colors.selection = "#3E3834"

      colors.black = "#322D29"
      colors.red = "#A85A53"
      colors.red1 = "#C66D65"
      colors.green = "#7A8964"
      colors.green1 = "#92A478"
      colors.green2 = "#7BB0AB"
      colors.yellow = "#C19B52"
      colors.orange = "#D4AF37"
      colors.blue = "#5D7B8C"
      colors.blue0 = "#5D7B8C"
      colors.blue1 = "#7698AD"
      colors.blue5 = "#7698AD"
      colors.magenta = "#926B7F"
      colors.magenta2 = "#B5879F"
      colors.purple = "#926B7F"
      colors.cyan = "#638E8A"
      colors.teal = "#7BB0AB"
      colors.white = "#D0C6BD"

      colors.br_black = "#5A524C"
      colors.br_red = "#C66D65"
      colors.br_green = "#92A478"
      colors.br_yellow = "#E5C07B"
      colors.br_blue = "#7698AD"
      colors.br_magenta = "#B5879F"
      colors.br_cyan = "#7BB0AB"
      colors.br_white = "#F4F0EB"

      colors.comment = "#5A524C"
      colors.dark3 = "#5A524C"
      colors.dark5 = "#D0C6BD"
      colors.fg_float = "#EADDD7"
      colors.fg_gutter = "#5A524C"
      colors.terminal_black = "#322D29"
      colors.border = "#3E3834"
      colors.border_highlight = "#5D7B8C"

      colors.git.add = colors.green
      colors.git.change = colors.yellow
      colors.git.delete = colors.red
    end,
    on_highlights = function(highlights, colors)
      highlights.CursorLine = { bg = "#3E3834" }
      highlights.CursorLineNr = { fg = "#D4AF37", bold = true }
      highlights.FloatBorder = { fg = colors.border }
      highlights.IncSearch = { bg = "#E5C07B", fg = "#181615" }
      highlights.PmenuSel = { bg = "#5D7B8C", fg = "#F4F0EB" }
      highlights.Search = { bg = "#C19B52", fg = "#181615" }
      highlights.Visual = { bg = "#3E3834" }
      highlights.Jinja2Var = { fg = "#C66D65" }
      highlights.Jinja2Block = { fg = "#C19B52" }
      highlights.Jinja2Comment = { fg = "#5A524C", italic = true }
    end,
  },
}
