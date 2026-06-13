-- Atalhos extras da Hanna. Os atalhos padrão do LazyVim continuam valendo
-- (aperte ESPAÇO pra ver o menu). Aqui adicionamos o estilo VSCode + pt-BR.
local map = vim.keymap.set

-- =====================================================================
--  Atalhos estilo VSCode 🆚
-- =====================================================================
-- Salvar (Ctrl+S) em qualquer modo
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Salvar" })

-- Selecionar tudo (Ctrl+A)
map("n", "<C-a>", "ggVG", { desc = "Selecionar tudo" })

-- Desfazer (Ctrl+Z) / Refazer (Ctrl+Y)
map({ "n", "i" }, "<C-z>", "<cmd>undo<cr>", { desc = "Desfazer" })
map({ "n", "i" }, "<C-y>", "<cmd>redo<cr>", { desc = "Refazer" })

-- Copiar / Recortar / Colar com o clipboard do sistema (Ctrl+C/X/V)
map("v", "<C-c>", '"+y', { desc = "Copiar" })
map("v", "<C-x>", '"+d', { desc = "Recortar" })
map({ "n", "v" }, "<C-v>", '"+p', { desc = "Colar" })
map("i", "<C-v>", "<C-r>+", { desc = "Colar" })
-- Seleção em bloco vertical do Vim foi pra <leader>V
map("n", "<leader>V", "<C-v>", { desc = "Seleção em bloco (Vim)" })

-- Abrir arquivo (Ctrl+P) e Paleta de Comandos (Ctrl+Shift+P)
map("n", "<C-p>", function() Snacks.picker.files() end, { desc = "Abrir arquivo" })
map("n", "<C-S-p>", function() Snacks.picker.commands() end, { desc = "Paleta de comandos" })

-- Buscar no arquivo (Ctrl+F) e no projeto inteiro (Ctrl+Shift+F)
map("n", "<C-f>", "/", { desc = "Buscar no arquivo" })
map("n", "<C-S-f>", function() Snacks.picker.grep() end, { desc = "Buscar no projeto" })

-- Mostrar/esconder o explorador (Ctrl+B)
map("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Explorador" })

-- Terminal integrado (Ctrl+\)
map({ "n", "t" }, "<C-\\>", function() Snacks.terminal() end, { desc = "Terminal" })

-- Comentar/descomentar (Ctrl+/)
map("n", "<C-/>", "gcc", { remap = true, desc = "Comentar linha" })
map("v", "<C-/>", "gc", { remap = true, desc = "Comentar seleção" })
map("n", "<C-_>", "gcc", { remap = true, desc = "Comentar linha" }) -- fallback de terminal
map("v", "<C-_>", "gc", { remap = true, desc = "Comentar seleção" })

-- Fechar a aba atual (Ctrl+W)
map("n", "<C-w>", "<cmd>bdelete<cr>", { desc = "Fechar aba" })

-- Trocar de aba (Ctrl+Tab / Ctrl+Shift+Tab)
map("n", "<C-Tab>", "<cmd>bnext<cr>", { desc = "Próxima aba" })
map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", { desc = "Aba anterior" })

-- Mover linha (Alt+↑/↓) e duplicar (Shift+Alt+↓)
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
