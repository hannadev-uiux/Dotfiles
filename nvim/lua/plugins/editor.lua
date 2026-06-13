-- =====================================================================
--  Ferramentas do editor: explorador, busca, syntax, git, ajuda
-- =====================================================================
return {
  -- Treesitter: syntax highlighting colorido e preciso
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- API clássica e estável (.configs)
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "javascript", "typescript", "tsx",
          "html", "css", "scss", "json", "markdown", "markdown_inline",
          "bash", "python", "yaml",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Explorador de arquivos (barra lateral)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorador de arquivos" },
    },
    -- Carrega o neo-tree quando o nvim abre direto numa pasta (nvim . / code .)
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.uv.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        hijack_netrw_behavior = "open_default", -- abrir uma pasta mostra o neo-tree
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = { hide_dotfiles = false, hide_gitignored = true },
      },
      window = { width = 32 },
      -- Ícones coloridos de pastas e arquivos (precisa da Nerd Font do terminal)
      default_component_configs = {
        indent = { with_markers = true, indent_marker = "│", last_indent_marker = "└" },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
    },
  },

  -- Telescope: busca fuzzy de arquivos, texto e projetos
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar arquivos" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto (grep)" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Listar abas abertas" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Arquivos recentes" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Ajuda do Neovim" },
      { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Trocar tema" },
    },
    opts = {
      defaults = {
        prompt_prefix = "🌸 ",
        selection_caret = " ",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
      },
    },
  },

  -- Sinais de git na lateral (linhas adicionadas/alteradas/removidas)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
      },
    },
  },

  -- which-key: mostra os atalhos disponíveis enquanto você digita
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Fecha parênteses/aspas/colchetes automaticamente
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Comentar/descomentar com gcc (linha) e gc (seleção)
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },

  -- Mostra as cores reais dos códigos hex (#ff69b4 fica rosa!) — ótimo p/ design
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup({ "*" }, { css = true, names = false })
    end,
  },
}
