-- Carregado automaticamente antes do lazy.nvim.
-- O LazyVim já liga números de linha, mouse, cores 24-bit, etc.
-- Aqui ficam só os toques da Hanna.

-- Indentação: 2 espaços
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Corretor ortográfico pt-BR + inglês. Fica DESLIGADO por padrão (atrapalha
-- em código); ligue quando estiver escrevendo texto com :set spell
vim.opt.spelllang = { "pt_br", "en" }

-- Tenta deixar as mensagens internas do Neovim em português
-- (depende do locale pt_BR estar instalado no Mac; se não, ignora)
pcall(vim.cmd, "language messages pt_BR.UTF-8")
