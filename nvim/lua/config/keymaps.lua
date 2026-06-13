-- =====================================================================
--  Atalhos de teclado  (líder = Espaço)
-- =====================================================================
local map = vim.keymap.set

-- Salvar e sair
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Salvar arquivo" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Fechar janela" })
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Sair de tudo" })

-- Limpar destaque da busca
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Limpar busca" })

-- Navegar entre janelas (splits) com Ctrl + h/j/k/l
map("n", "<C-h>", "<C-w>h", { desc = "Janela à esquerda" })
map("n", "<C-j>", "<C-w>j", { desc = "Janela abaixo" })
map("n", "<C-k>", "<C-w>k", { desc = "Janela acima" })
map("n", "<C-l>", "<C-w>l", { desc = "Janela à direita" })

-- Redimensionar janelas com as setas
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Aumentar altura" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Diminuir altura" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Diminuir largura" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Aumentar largura" })

-- Splits
map("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })

-- Navegar entre abas (buffers)
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Próxima aba" })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Aba anterior" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Fechar aba" })

-- Mover linhas selecionadas (modo visual) para cima/baixo
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Mover seleção p/ baixo" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Mover seleção p/ cima" })

-- Manter o cursor centralizado ao rolar meia página
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Indentar mantendo a seleção
map("v", "<", "<gv")
map("v", ">", ">gv")

-- =====================================================================
--  Atalhos estilo VSCode 🆚 → 🌸  (pra quem está vindo do VSCode)
-- =====================================================================
-- Salvar com Ctrl+S em qualquer modo
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Salvar" })

-- Selecionar tudo (Ctrl+A)
map("n", "<C-a>", "ggVG", { desc = "Selecionar tudo" })

-- Desfazer (Ctrl+Z) e Refazer (Ctrl+Y)
map({ "n", "i" }, "<C-z>", "<cmd>undo<cr>", { desc = "Desfazer" })
map({ "n", "i" }, "<C-y>", "<cmd>redo<cr>", { desc = "Refazer" })

-- Copiar / Recortar / Colar usando o clipboard do sistema (Ctrl+C/X/V)
map("v", "<C-c>", '"+y', { desc = "Copiar" })
map("v", "<C-x>", '"+d', { desc = "Recortar" })
map({ "n", "v" }, "<C-v>", '"+p', { desc = "Colar" })
map("i", "<C-v>", "<C-r>+", { desc = "Colar" })
-- O seletor de bloco vertical do Vim foi movido pra <leader>v
map("n", "<leader>v", "<C-v>", { desc = "Seleção em bloco (Vim)" })

-- Quick Open (Ctrl+P) e Paleta de Comandos (Ctrl+Shift+P / F1)
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Abrir arquivo (Ctrl+P)" })
map("n", "<C-S-p>", "<cmd>Telescope commands<cr>", { desc = "Paleta de comandos" })
map("n", "<F1>", "<cmd>Telescope commands<cr>", { desc = "Paleta de comandos" })

-- Buscar no arquivo (Ctrl+F) e no projeto inteiro (Ctrl+Shift+F)
map("n", "<C-f>", "/", { desc = "Buscar no arquivo" })
map("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", { desc = "Buscar no projeto" })

-- Mostrar/esconder o explorador lateral (Ctrl+B)
map("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Explorador (Ctrl+B)" })

-- Comentar/descomentar (Ctrl+/) — linha no normal, seleção no visual
map("n", "<C-/>", "gcc", { remap = true, desc = "Comentar linha" })
map("v", "<C-/>", "gc", { remap = true, desc = "Comentar seleção" })
map("n", "<C-_>", "gcc", { remap = true, desc = "Comentar linha" }) -- fallback de terminal
map("v", "<C-_>", "gc", { remap = true, desc = "Comentar seleção" })

-- Fechar a aba atual (Ctrl+W)
map("n", "<C-w>", "<cmd>bdelete<cr>", { desc = "Fechar aba (Ctrl+W)" })

-- Trocar de aba (Ctrl+Tab / Ctrl+Shift+Tab)
map("n", "<C-Tab>", "<cmd>bnext<cr>", { desc = "Próxima aba" })
map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", { desc = "Aba anterior" })

-- Mover a linha com Alt+↑/↓ e duplicar com Shift+Alt+↓ (igual VSCode)
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Mover linha p/ baixo" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Mover linha p/ cima" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Mover linha p/ baixo" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Mover linha p/ cima" })
map("n", "<S-A-Down>", "<cmd>t.<cr>", { desc = "Duplicar linha" })

-- =====================================================================
--  Comandos amigáveis pra sair/salvar (digite com :)
--  Obs: o Vim não aceita hífen em nome de comando, por isso sem hífen.
--    :sair          → fecha tudo         (igual a :qa)
--    :salvaresair   → salva tudo e sai    (igual a :wqa)
--    :sairsemsalvar → sai sem salvar      (igual a :qa!)
-- =====================================================================
vim.cmd([[
  cnoreabbrev <expr> sair          (getcmdtype()==':' && getcmdline()==#'sair')          ? 'qa'  : 'sair'
  cnoreabbrev <expr> salvaresair   (getcmdtype()==':' && getcmdline()==#'salvaresair')   ? 'wqa' : 'salvaresair'
  cnoreabbrev <expr> sairsemsalvar (getcmdtype()==':' && getcmdline()==#'sairsemsalvar') ? 'qa!' : 'sairsemsalvar'
]])
