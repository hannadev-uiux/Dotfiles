-- Customizações da Hanna (inspiradas no setup do marido, com toque de design).
return {
  -- Mostra as cores reais dos códigos hex (#ff69b4 fica rosa!) — ótimo p/ design
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup({ "*" }, { css = true, names = false })
    end,
  },

  -- Explorador escondendo pastas pesadas (não polui a árvore)
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = false, -- aperte H dentro do explorador pra mostrar tudo
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = { ".DS_Store", "node_modules", "dist", "coverage", ".next", ".turbo" },
        },
      },
    },
  },

  -- Busca (picker = snacks) ignorando pastas pesadas
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = { exclude = { "node_modules", "dist", "coverage", ".next", ".turbo" } },
          grep = { exclude = { "node_modules", "dist", "coverage", ".next", ".turbo" } },
        },
      },
    },
  },

  -- Formatar com Prettier ao salvar (o extra de formatação cuida do resto)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
    },
  },
}
