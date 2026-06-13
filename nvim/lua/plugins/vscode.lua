-- =====================================================================
--  Experiência estilo VSCode 🆚 → 🌸
--  IntelliSense (autocomplete + LSP) e terminal integrado.
-- =====================================================================
return {
  -- ---------------------------------------------------------------
  --  Terminal integrado: abre/fecha com Ctrl + \
  -- ---------------------------------------------------------------
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { [[<C-\>]], "<cmd>ToggleTerm<cr>", desc = "Terminal integrado", mode = { "n", "i", "t" } },
    },
    opts = {
      open_mapping = [[<c-\>]],
      direction = "horizontal",
      size = 14,
      shade_terminals = true,
      start_in_insert = true,
    },
  },

  -- ---------------------------------------------------------------
  --  Servidores de linguagem (instalados automaticamente pelo Mason)
  -- ---------------------------------------------------------------
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- web design: Lua, TypeScript/JS, HTML, CSS, JSON, Tailwind, Emmet
      ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "jsonls", "tailwindcss", "emmet_ls" },
      automatic_enable = false, -- fazemos o setup manualmente abaixo
    },
  },

  -- ---------------------------------------------------------------
  --  LSP: o "cérebro" do IntelliSense
  --  (autocomplete inteligente, ir para definição, renomear, erros)
  -- ---------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp", "williamboman/mason-lspconfig.nvim" },
    config = function()
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      local caps = ok_cmp and cmp_lsp.default_capabilities()
        or vim.lsp.protocol.make_client_capabilities()

      -- Atalhos que valem quando um servidor conecta no arquivo (estilo VSCode)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local function m(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = desc })
          end
          m("gd", vim.lsp.buf.definition, "Ir para a definição")
          m("<F12>", vim.lsp.buf.definition, "Ir para a definição")
          m("gr", vim.lsp.buf.references, "Mostrar onde é usado")
          m("K", vim.lsp.buf.hover, "Documentação (passar o mouse)")
          m("<F2>", vim.lsp.buf.rename, "Renomear em todo o projeto")
          m("<leader>ca", vim.lsp.buf.code_action, "Ações de código (lâmpada)")
        end,
      })

      local lspconfig = require("lspconfig")
      local servers = { "lua_ls", "ts_ls", "html", "cssls", "jsonls", "tailwindcss", "emmet_ls" }
      for _, s in ipairs(servers) do
        pcall(function()
          lspconfig[s].setup({ capabilities = caps })
        end)
      end
    end,
  },

  -- ---------------------------------------------------------------
  --  Autocomplete: a "caixinha de sugestões" do VSCode
  --  Enter aceita · Tab navega · Ctrl+Espaço força abrir
  -- ---------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      pcall(function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end)

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },
}
