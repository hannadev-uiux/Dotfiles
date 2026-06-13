-- Toques em português: rótulos do menu (which-key) em PT-BR.
-- É o que a Hanna mais vê: aperta ESPAÇO e o menu explica cada grupo.
return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>f", group = "arquivos / buscar" },
        { "<leader>s", group = "buscar (texto / símbolos)" },
        { "<leader>c", group = "código" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "git hunks" },
        { "<leader>b", group = "abas (buffers)" },
        { "<leader>w", group = "janelas" },
        { "<leader>x", group = "erros / lista" },
        { "<leader>u", group = "aparência (UI)" },
        { "<leader>q", group = "sair / sessão" },
        { "<leader>t", group = "testes / terminal" },
        { "<leader>d", group = "depurar (debug)" },
        { "<leader>n", group = "notificações" },
        { "<leader>r", group = "renomear / refatorar" },
      },
    },
  },
}
