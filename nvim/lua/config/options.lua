-- ~/.config/nvim/lua/config/options.lua

-- Indentação: 2 espaços
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Corretor ortográfico em português (e inglês). Fica DESLIGADO por padrão
-- (atrapalha em código). Ligue quando estiver escrevendo texto com :set spell
vim.opt.spelllang = { "pt_br", "en" }

-- Tenta deixar as mensagens internas do Neovim em português.
-- (depende do locale pt_BR estar instalado no Mac; se não estiver, ignora)
pcall(vim.cmd, "language messages pt_BR.UTF-8")
