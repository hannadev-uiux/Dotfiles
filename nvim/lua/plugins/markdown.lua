-- Renderização bonita de Markdown direto no editor (render-markdown.nvim).
-- O plugin em si vem do extra "lang.markdown" (ativado no lazyvim.json).
-- Aqui só damos um tapa visual com a sua cara: títulos rosa, listas e
-- caixinhas de tarefa fofas. 💗
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      -- Renderiza em modo normal/comando/terminal. Na LINHA onde o cursor
      -- está, ele mostra o markdown "cru" pra você editar com calma.
      heading = {
        -- ícone na frente de cada nível de título (#, ##, ###, ...)
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        width = "block", -- fundo do título ocupa um bloco (fica em destaque)
        left_pad = 1,
        right_pad = 4,
      },
      code = {
        width = "block", -- blocos de código com fundo em "cartão"
        left_pad = 2,
        right_pad = 2,
      },
      bullet = {
        -- marcadores das listas (nível 1, 2, 3, 4)
        icons = { "●", "○", "◆", "◇" },
      },
      checkbox = {
        -- listas de tarefa:  - [ ]  vira caixinha,  - [x]  vira check
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 ", scope_highlight = "@markup.strikethrough" },
      },
    },
  },

  -- Toque rosa nos títulos (combina com o Dracula). Reaplicado sempre que
  -- o tema mudar, pra nunca perder a cor.
  {
    "Mofiqul/dracula.nvim",
    optional = true,
    config = function()
      local function pintar_titulos()
        vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#ff79c6", bold = true })
        vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#ff92d0", bold = true })
        vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#bd93f9", bold = true })
        vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#3a2733" })
        vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#34283a" })
      end
      pintar_titulos()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = pintar_titulos })
    end,
  },
}
