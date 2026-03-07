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
      colors.bg = "#1E1E2E"
      colors.fg = "#CDD6F4"
      colors.bg_dark = "#11111B"
      colors.fg_dark = "#BAC2DE"

      colors.bg_float = "#181825"
      colors.selection = "#45475A"

      colors.black = "#313244"
      colors.red = "#F38BA8"
      colors.green = "#A6E3A1"
      colors.yellow = "#F9E2AF"
      colors.blue = "#89B4FA"
      colors.magenta = "#CBA6F7"
      colors.cyan = "#94E2D5"
      colors.white = "#CDD6F4"

      colors.br_black = "#585B70"
      colors.br_red = "#F38BA8"
      colors.br_green = "#A6E3A1"
      colors.br_yellow = "#F9E2AF"
      colors.br_blue = "#89B4FA"
      colors.br_magenta = "#F5C2E7"
      colors.br_cyan = "#94E2D5"
      colors.br_white = "#A6ADC8"

      colors.border = "#313244"

      colors.git.add = colors.green
      colors.git.change = colors.yellow
      colors.git.delete = colors.red
    end,
  },
}
