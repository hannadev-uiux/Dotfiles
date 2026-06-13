-- ~/.config/nvim/lua/plugins/ptbr.lua
-- Toques em português: rótulos do which-key em PT-BR.
-- (O tema Catppuccin é configurado em colorscheme.lua, não aqui.)

return {
  -- Menu do which-key com rótulos em PORTUGUÊS.
  -- É o que ela mais vê: aperta espaço e o menu explica cada grupo.
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>f", group = "buscar arquivos" },
        { "<leader>s", group = "buscar (texto/símbolos)" },
        { "<leader>c", group = "código" },
        { "<leader>g", group = "git" },
        { "<leader>b", group = "abas (buffers)" },
        { "<leader>w", group = "janelas" },
        { "<leader>x", group = "erros/avisos" },
        { "<leader>u", group = "aparência" },
        { "<leader>q", group = "sair / sessão" },
        { "<leader>t", group = "testes" },
      },
    },
  },
}
