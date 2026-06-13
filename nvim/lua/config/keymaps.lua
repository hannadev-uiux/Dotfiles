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

-- =====================================================================
--  Traduz pro PORTUGUÊS os rótulos do menu (which-key) que vêm do LazyVim.
--  Re-registra cada atalho preservando a ação, só trocando a descrição.
--  (Os atalhos que não estiverem aqui continuam com o texto em inglês.)
-- =====================================================================
local traducoes = {
  -- Menu principal (uma tecla)
  ["<leader><space>"] = "Procurar arquivos",
  ["<leader>,"] = "Trocar de aba (buffer)",
  ["<leader>-"] = "Dividir janela embaixo",
  ["<leader>."] = "Abrir/fechar rascunho",
  ["<leader>/"] = "Buscar no projeto",
  ["<leader>:"] = "Histórico de comandos",
  ["<leader>?"] = "Atalhos deste arquivo",
  ["<leader>`"] = "Voltar pra aba anterior",
  ["<leader>|"] = "Dividir janela à direita",
  ["<leader>e"] = "Explorador (raiz)",
  ["<leader>E"] = "Explorador (pasta atual)",
  ["<leader>K"] = "Ajuda da palavra sob o cursor",
  ["<leader>l"] = "Plugins (Lazy)",
  ["<leader>L"] = "Novidades do LazyVim",
  ["<leader>S"] = "Escolher rascunho",
  ["<leader>n"] = "Histórico de notificações",
  -- Abas (tabs)
  ["<leader><tab><tab>"] = "Nova aba (tab)",
  ["<leader><tab>d"] = "Fechar aba (tab)",
  ["<leader><tab>["] = "Aba anterior",
  ["<leader><tab>]"] = "Próxima aba",
  ["<leader><tab>o"] = "Fechar as outras abas",
  -- Buffers (abas de arquivo)
  ["<leader>bd"] = "Fechar a aba atual",
  ["<leader>bo"] = "Fechar as outras abas",
  ["<leader>bb"] = "Voltar pra aba anterior",
  ["<leader>bp"] = "Fixar/desafixar a aba",
  ["<leader>bP"] = "Fechar abas não-fixadas",
  ["<leader>br"] = "Fechar abas à direita",
  ["<leader>bl"] = "Fechar abas à esquerda",
  -- Código
  ["<leader>cf"] = "Formatar o arquivo",
  ["<leader>ca"] = "Ações de código (lâmpada)",
  ["<leader>cr"] = "Renomear símbolo",
  ["<leader>cd"] = "Erros/avisos da linha",
  ["<leader>cm"] = "Mason (instalar ferramentas)",
  ["<leader>cs"] = "Símbolos do arquivo",
  -- Arquivos / buscar
  ["<leader>ff"] = "Procurar arquivos (raiz)",
  ["<leader>fF"] = "Procurar arquivos (pasta atual)",
  ["<leader>fr"] = "Arquivos recentes",
  ["<leader>fb"] = "Abas abertas (buffers)",
  ["<leader>fn"] = "Novo arquivo",
  ["<leader>fc"] = "Abrir a config do Neovim",
  ["<leader>fg"] = "Arquivos do git",
  ["<leader>ft"] = "Terminal (raiz)",
  -- Git
  ["<leader>gg"] = "Lazygit (raiz)",
  ["<leader>gb"] = "Quem alterou a linha (blame)",
  ["<leader>gd"] = "Diferenças do git",
  ["<leader>gs"] = "Status do git",
  ["<leader>gl"] = "Commits (histórico)",
  ["<leader>ge"] = "Explorador do git",
  ["<leader>gf"] = "Histórico deste arquivo",
  -- Sair / sessão
  ["<leader>qq"] = "Sair de tudo",
  ["<leader>qs"] = "Restaurar a sessão",
  ["<leader>ql"] = "Restaurar a última sessão",
  ["<leader>qd"] = "Não salvar a sessão",
  -- Buscar (texto/símbolos)
  ["<leader>sg"] = "Buscar texto (raiz)",
  ["<leader>sw"] = "Buscar a palavra sob o cursor",
  ["<leader>sr"] = "Buscar e substituir",
  ["<leader>sk"] = "Ver todos os atalhos",
  ["<leader>sh"] = "Páginas de ajuda",
  ["<leader>ss"] = "Ir pra um símbolo",
  ["<leader>sd"] = "Erros/avisos (diagnostics)",
  ["<leader>st"] = "TODOs / FIXMEs",
  ["<leader>sc"] = "Histórico de comandos",
  -- Aparência (UI)
  ["<leader>uC"] = "Trocar o tema (com prévia)",
  ["<leader>uF"] = "Ligar/desligar formatar ao salvar",
  ["<leader>uL"] = "Ligar/desligar número relativo",
  ["<leader>ud"] = "Ligar/desligar erros/avisos",
  ["<leader>uw"] = "Ligar/desligar quebra de linha",
}

local function aplicar_traducoes_menu()
  for lhs, desc in pairs(traducoes) do
    local m = vim.fn.maparg(lhs, "n", false, true)
    if m and (m.callback or (m.rhs and m.rhs ~= "")) then
      vim.keymap.set("n", lhs, m.callback or m.rhs, {
        desc = desc,
        silent = m.silent == 1,
        expr = m.expr == 1,
        noremap = m.noremap == 1,
      })
    end
  end
end

-- Roda depois que o LazyVim já definiu os atalhos dele.
vim.defer_fn(aplicar_traducoes_menu, 150)
