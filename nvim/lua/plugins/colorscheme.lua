-- Tema Dracula (igual ao do seu marido) 🧛
return {
  { "Mofiqul/dracula.nvim", name = "dracula", priority = 1000 },

  -- Diz pro LazyVim usar o Dracula como tema padrão
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
