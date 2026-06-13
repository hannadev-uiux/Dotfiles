-- ~/.config/nvim/lua/config/options.lua

-- Indentação: 2 espaços
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Explorador: usamos o neo-tree, então desligamos o netrw (explorador antigo).
-- Isso evita que 'nvim .' / 'code .' abra aquela listagem antiga de pasta.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Cara de editor (estilo VSCode)
vim.opt.number = true        -- números de linha
vim.opt.cursorline = true    -- destaca a linha atual
vim.opt.mouse = "a"          -- mouse funciona (clicar, rolar, selecionar)
vim.opt.signcolumn = "yes"   -- coluna fixa pros sinais de git/erros
vim.opt.termguicolors = true -- cores 24-bit (deixa o tema bonito)

-- Corretor ortográfico em português (e inglês). Fica DESLIGADO por padrão
-- (atrapalha em código). Ligue quando estiver escrevendo texto com :set spell
vim.opt.spelllang = { "pt_br", "en" }

-- Tenta deixar as mensagens internas do Neovim em português.
-- (depende do locale pt_BR estar instalado no Mac; se não estiver, ignora)
pcall(vim.cmd, "language messages pt_BR.UTF-8")
