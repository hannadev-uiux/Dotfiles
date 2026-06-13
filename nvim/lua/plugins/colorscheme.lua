-- =====================================================================
--  Tema: Catppuccin 🌸 (colorido, com sotaque rosa)
--  Variantes: latte (claro), frappe, macchiato, mocha (escuro)
--  Troque "flavour" abaixo para experimentar.
-- =====================================================================
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- carrega antes de tudo
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",          -- 🌙 escuro e colorido
      transparent_background = false,
      term_colors = true,
      color_overrides = {
        mocha = {
          -- Um toque mais rosado no fundo
          base = "#1e1d2e",
          mantle = "#1a1925",
          crust = "#15141f",
        },
      },
      custom_highlights = function(colors)
        return {
          -- Realça cursor, seleção e linha atual em tons de rosa
          CursorLineNr = { fg = colors.pink, bold = true },
          Visual = { bg = colors.surface1 },
          LineNr = { fg = colors.overlay0 },
        }
      end,
      integrations = {
        treesitter = true,
        telescope = true,
        neotree = true,
        gitsigns = true,
        which_key = true,
        cmp = true,
        indent_blankline = { enabled = true, colored_indent_levels = true },
        native_lsp = { enabled = true },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
