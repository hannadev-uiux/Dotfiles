-- =====================================================================
--  Interface visual: statusline, abas, tela inicial, ícones, indentação
-- =====================================================================
return {
  -- Ícones (requer uma Nerd Font instalada no terminal)
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Statusline bonita e colorida
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "catppuccin",
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", icon = "🌸" } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- Abas no topo (buffers) coloridas
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = true,
        offsets = {
          { filetype = "neo-tree", text = "  Explorer", text_align = "center", separator = true },
        },
      },
    },
  },

  -- Guias de indentação coloridas
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = true, show_start = false, show_end = false },
    },
  },

  -- Tela inicial (dashboard) fofa
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                  ",
        "      🌸  N E O V I M  —  UI/UX  Design  🌸       ",
        "                                                  ",
        "   ╭───────────────────────────────────────╮      ",
        "   │   bem-vinda de volta, Hanna ✨         │      ",
        "   ╰───────────────────────────────────────╯      ",
        "                                                  ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Buscar arquivo", "<cmd>Telescope find_files<cr>"),
        dashboard.button("p", "  Abrir projeto (pasta)", "<cmd>Telescope find_files cwd=.<cr>"),
        dashboard.button("r", "  Arquivos recentes", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("g", "  Buscar texto no projeto", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("e", "  Explorador de arquivos", "<cmd>Neotree toggle<cr>"),
        dashboard.button("c", "  Configuração do Neovim", "<cmd>edit ~/.config/nvim/init.lua<cr>"),
        dashboard.button("q", "  Sair", "<cmd>qa<cr>"),
      }

      dashboard.section.footer.val = "feito com carinho 💖"
      alpha.setup(dashboard.opts)
    end,
  },

  -- Notificações elegantes
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup({ background_colour = "#1e1d2e", render = "compact" })
      vim.notify = require("notify")
    end,
  },
}
