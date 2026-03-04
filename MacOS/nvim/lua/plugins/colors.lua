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
      colors.bg = "#0D1117"
      colors.fg = "#E7E0F2"
      colors.bg_dark = "#0D1117"
      colors.bg_highlight = "#1B263B"
      colors.bg_popup = "#1B263B"
      colors.bg_statusline = "#0D1117"
      colors.bg_sidebar = "#0D1117"
      colors.bg_float = "#1B263B"

      colors.border = "#4B3D5B"
      colors.fg_dark = "#947E9C"
      colors.fg_gutter = "#4B3D5B"

      colors.blue = "#947E9C"
      colors.cyan = "#947E9C"
      colors.green = "#E05263"
      colors.yellow = "#FF4E5E"
      colors.orange = "#FF4E5E"
      colors.red = "#FF4E5E"
      colors.purple = "#4B3D5B"
      colors.magenta = "#E05263"

      colors.comment = "#4B3D5B"
    end,

    on_highlights = function(hl, c)
      hl.Normal = { fg = "#E7E0F2" }
      hl.NormalFloat = { fg = "#E7E0F2", bg = "#1B263B" }

      hl.CursorLine = { bg = "#1B263B" }
      hl.CursorLineNr = { fg = "#FF4E5E", bold = true }
      hl.LineNr = { fg = "#4B3D5B" }
      hl.Visual = { bg = "#4B3D5B" }
      hl.Search = { bg = "#FF4E5E", fg = "#0D1117" }
      hl.IncSearch = { bg = "#E05263", fg = "#0D1117" }
      hl.StatusLine = { fg = "#E05263", bg = "#1B263B" }
      hl.StatusLineNC = { fg = "#4B3D5B", bg = "#0D1117" }
      hl.Pmenu = { fg = "#947E9C", bg = "#1B263B" }
      hl.PmenuSel = { fg = "#0D1117", bg = "#FF4E5E" }
      hl.PmenuSbar = { bg = "#1B263B" }
      hl.PmenuThumb = { bg = "#4B3D5B" }
      hl.FloatBorder = { fg = "#4B3D5B", bg = "#1B263B" }
      hl.WinSeparator = { fg = "#1B263B" }
      hl.TabLine = { fg = "#4B3D5B", bg = "#0D1117" }
      hl.TabLineSel = { fg = "#FF4E5E", bg = "#1B263B" }
      hl.TabLineFill = { bg = "#0D1117" }

      hl.GitSignsAdd = { fg = "#E05263" }
      hl.GitSignsChange = { fg = "#947E9C" }
      hl.GitSignsDelete = { fg = "#FF4E5E" }

      hl.DiagnosticError = { fg = "#FF4E5E" }
      hl.DiagnosticWarn = { fg = "#E05263" }
      hl.DiagnosticInfo = { fg = "#947E9C" }
      hl.DiagnosticHint = { fg = "#4B3D5B" }

      hl.String = { fg = "#E05263" }
      hl.Character = { fg = "#E05263" }
      hl.Number = { fg = "#FF4E5E" }
      hl.Boolean = { fg = "#FF4E5E" }
      hl.Float = { fg = "#FF4E5E" }

      hl.Function = { fg = "#947E9C" }
      hl.Keyword = { fg = "#FF4E5E" }
      hl.Operator = { fg = "#E05263" }
      hl.Type = { fg = "#E05263" }
      hl.Constant = { fg = "#FF4E5E" }
      hl.Identifier = { fg = "#E7E0F2" }
      hl.Statement = { fg = "#FF4E5E" }
      hl.PreProc = { fg = "#E05263" }
      hl.Special = { fg = "#947E9C" }

      hl.Comment = { fg = "#4B3D5B", italic = true }

      hl["@string.json"] = { fg = "#E05263" }
      hl["@string.jsonc"] = { fg = "#E05263" }
      hl["@property.json"] = { fg = "#947E9C" }
      hl["@variable.member.json"] = { fg = "#947E9C" }
      hl["@property.jsonc"] = { fg = "#947E9C" }
      hl["@variable.member.jsonc"] = { fg = "#947E9C" }

      hl["@property.yaml"] = { fg = "#FF4E5E" }
      hl["@field.yaml"] = { fg = "#FF4E5E" }
      hl["@string.yaml"] = { fg = "#947E9C" }
      hl["@number.yaml"] = { fg = "#E05263" }
      hl["@boolean.yaml"] = { fg = "#E05263" }
      hl.yamlKey = { fg = "#FF4E5E" }
      hl.yamlBlockMappingKey = { fg = "#FF4E5E" }
      hl.yamlPlainScalar = { fg = "#947E9C" }
      hl.yamlConstant = { fg = "#E05263" }
      hl.yamlBlockCollectionItemStart = { fg = "#4B3D5B" }
      hl.yamlFlowString = { fg = "#947E9C" }

      hl.Jinja2Var = { fg = "#FF4E5E", bold = true }

      hl["@markup.raw"] = { fg = "#947E9C" }
      hl["@markup.raw.block"] = { fg = "#947E9C" }
      hl["@text.literal"] = { fg = "#947E9C" }
      hl.MarkdownCode = { fg = "#947E9C" }
      hl.MarkdownCodeBlock = { fg = "#947E9C" }
    end,
  },
}
