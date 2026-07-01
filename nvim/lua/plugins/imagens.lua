-- Renderização de IMAGENS de verdade dentro do Neovim (image.nvim). 💗
-- Mostra PNG/JPG/GIF/WEBP inline no markdown (ex: ![alt](foto.png)) e também
-- ao abrir um arquivo de imagem direto. O Ghostty desenha usando o protocolo
-- de gráficos do kitty.
--
-- Obs.: a renderização automática de diagramas Mermaid foi removida de
-- propósito — ela chamava o Chrome a cada tecla digitada e deixava o
-- editor lento. Aqui ficou só o que é leve e rápido.
return {
  {
    "3rd/image.nvim",
    build = false, -- versões novas não precisam compilar nada
    opts = {
      backend = "kitty", -- o Ghostty entende esse "idioma" de imagens
      processor = "magick_cli", -- usa o comando `magick` (sem luarock chato)
      max_width = 100, -- limita o tamanho pra imagem não estourar a tela
      max_height = 20,
      integrations = {
        markdown = {
          enabled = true, -- imagens aparecem dentro dos .md
          only_render_image_at_cursor = true, -- só desenha a imagem da linha do cursor = bem leve
        },
      },
    },
  },
}
