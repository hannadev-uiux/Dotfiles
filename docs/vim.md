# Cheatsheet Vim / Neovim + LazyVim

Os atalhos do **LazyVim** (o que você usa no dia a dia, vindo do VSCode) vêm primeiro. Logo abaixo, os **fundamentos do Vim** — modos e gramática de edição — que destravam todo o resto.

---

## 1. Atalhos do dia a dia no LazyVim

| Atalho | Ação |
|---|---|
| `<leader>` (espera) | abre o menu which-key com tudo disponível |
| `<leader>e` | abre/fecha o explorador de arquivos |
| `<leader>ff` | encontrar arquivo |
| `<leader>/` | buscar no projeto |
| `<leader>ca` | code action (a "lâmpada" do VSCode) |
| `<leader>cr` | renomear símbolo em todo o projeto |
| `<leader>cf` | formatar o arquivo |
| `<leader>co` | organizar imports |
| `<leader>gg` | abre o LazyGit (Git visual no terminal) |
| `<leader>gb` | git blame da linha |
| `gd` | ir pra definição |
| `gr` | ver referências |
| `K` | documentação/hover do símbolo |
| `<leader>ft` | abre terminal flutuante |
| `]d` / `[d` | próximo / anterior erro (diagnostic) |
| `<leader>xx` | lista todos os erros/avisos (Trouble) |
| `<leader>L` | abre o gerenciador de plugins (Lazy) |
| `<leader>uh` | liga/desliga inlay hints |

*(`<leader>` = barra de espaço no LazyVim)*

### Testes e REST (do seu setup)
| Atalho | Ação |
|---|---|
| `<leader>tt` | roda os testes do arquivo |
| `<leader>tr` | roda o teste mais próximo do cursor |
| `<leader>ts` | abre o resumo dos testes |
| `<leader>tw` | testes em modo watch |
| `<leader>Rs` | envia a requisição `.http` sob o cursor (kulala) |
| `<leader>Ra` | envia todas as requisições |
| `<leader>Re` | troca o ambiente (dev/produção) |

---

## 2. Equivalência: VSCode → Neovim/LazyVim

| Ação no VSCode | Neovim / LazyVim |
|---|---|
| Cmd+P (ir pra arquivo) | `<leader>ff` |
| Cmd+Shift+F (buscar no projeto) | `<leader>/` |
| Cmd+Shift+P (paleta) | `<leader>` (menu which-key) |
| Cmd+D (multi-seleção) | `Ctrl+n` (vim-visual-multi) ou `*` + `cgn` + `.` |
| Cmd+/ (comentar) | `gcc` (linha) / `gc` (seleção) |
| Cmd+Click → definição | `gd` |
| F2 (renomear) | `<leader>cr` |
| Cmd+. (quick fix) | `<leader>ca` |
| Cmd+B (sidebar) | `<leader>e` |
| Ctrl+` (terminal) | `<leader>ft` |
| Cmd+Z / Cmd+Shift+Z | `u` / `Ctrl+r` |
| Alt+↑/↓ (mover linha) | `<A-j>` / `<A-k>` (Option no Mac) |
| Cmd+S | `:w` |
| Organizar imports | `<leader>co` |
| Multi-cursor em coluna | `Ctrl+v` (Visual Block) |

---

## 3. Os modos (o conceito central)

O Vim não é "sempre digitando". Você alterna entre modos:

| Modo | Como entrar | Pra que serve |
|---|---|---|
| **Normal** | `Esc` (volta pra cá sempre) | Navegar e dar comandos. É onde você fica a maior parte do tempo. |
| **Insert** | `i`, `a`, `o`, etc. | Digitar texto, como num editor normal. |
| **Visual** | `v`, `V`, `Ctrl+v` | Selecionar texto. |
| **Command** | `:` | Comandos (`:w`, `:q`, busca/substituição). |

> Regra de ouro pra iniciante: quando estiver perdido, aperte `Esc` e você está no modo Normal.

### Entrando no modo Insert (as variações importam)
| Tecla | Ação |
|---|---|
| `i` | insere **antes** do cursor |
| `a` | insere **depois** do cursor |
| `I` | insere no **início** da linha |
| `A` | insere no **fim** da linha |
| `o` | abre **nova linha abaixo** e insere |
| `O` | abre **nova linha acima** e insere |

---

## 4. Salvar, sair, desfazer

| Comando | Ação |
|---|---|
| `:w` | salva |
| `:q` | sai |
| `:wq` ou `:x` | salva e sai |
| `:q!` | sai sem salvar (descarta) |
| `u` | desfaz (undo) |
| `Ctrl+r` | refaz (redo) |
| `.` | **repete o último comando** (um dos mais poderosos!) |

---

## 5. Movimentação

### Básico (modo Normal)
| Tecla | Ação |
|---|---|
| `h` `j` `k` `l` | esquerda, baixo, cima, direita |
| `w` / `b` | próxima / palavra anterior |
| `e` | fim da palavra |
| `0` / `$` | início / fim da linha |
| `^` | primeiro caractere não-vazio da linha |
| `gg` / `G` | topo / fim do arquivo |
| `{` / `}` | parágrafo anterior / próximo |
| `Ctrl+u` / `Ctrl+d` | sobe / desce meia tela |

### Saltos precisos
| Tecla | Ação |
|---|---|
| `f<x>` | pula pro próximo caractere `x` na linha |
| `t<x>` | pula até antes do próximo `x` |
| `;` / `,` | repete o `f`/`t` pra frente / pra trás |
| `42G` | vai pra linha 42 |
| `%` | pula pro par `( )`, `{ }`, `[ ]` correspondente |
| `*` | busca a próxima ocorrência da **palavra sob o cursor** |
| `Ctrl+o` / `Ctrl+i` | volta / avança no histórico de saltos |

---

## 6. A gramática de edição (o segredo do Vim)

Comandos se montam como **verbo + objeto de texto**. Aprenda isso e você combina infinitas ações.

**Verbos (operadores):**
| Verbo | Ação |
|---|---|
| `d` | delete (recorta) |
| `c` | change (apaga e entra em Insert) |
| `y` | yank (copia) |
| `v` | seleciona (visual) |
| `>` / `<` | indenta / desindenta |

**Objetos de texto:**
| Objeto | Significado |
|---|---|
| `w` | palavra |
| `s` | sentença |
| `p` | parágrafo |
| `i(` `i{` `i[` `i"` `i'` | **i**nterior de parênteses/chaves/colchetes/aspas |
| `a(` `a{` etc. | **a**o redor (inclui os delimitadores) |
| `t` | tag (HTML/XML) |

**Exemplos de combinações:**
| Comando | O que faz |
|---|---|
| `dw` | apaga até o fim da palavra |
| `ciw` | troca a palavra inteira sob o cursor |
| `ci"` | troca o conteúdo **entre aspas** |
| `di(` | apaga o que está **dentro dos parênteses** |
| `yi{` | copia o interior das chaves |
| `cit` | troca o conteúdo de uma tag HTML |
| `dd` | apaga a linha inteira |
| `yy` | copia a linha inteira |
| `>>` | indenta a linha |

> Note o padrão: `c` + `i` + `(` = "change inside parens". Uma vez que clica, você nunca esquece.

### Copiar e colar
| Comando | Ação |
|---|---|
| `yy` | copia a linha |
| `p` / `P` | cola depois / antes do cursor |
| `dd` | recorta a linha |
| `"+y` | copia pro **clipboard do sistema** (pra colar fora do Vim) |
| `"+p` | cola **do clipboard do sistema** |

---

## 7. Busca rápida

### Dentro do arquivo
| Comando | Ação |
|---|---|
| `/texto` + `Enter` | busca pra frente |
| `?texto` + `Enter` | busca pra trás |
| `n` / `N` | próxima / anterior ocorrência |
| `*` | busca a palavra sob o cursor (pra frente) |
| `#` | busca a palavra sob o cursor (pra trás) |
| `:noh` | limpa o destaque da busca |

### No projeto inteiro (via LazyVim)
| Atalho | Ação |
|---|---|
| `<leader>ff` | encontrar arquivo por nome (Cmd+P do VSCode) |
| `<leader>fg` ou `<leader>/` | buscar texto em todo o projeto (Cmd+Shift+F) |
| `<leader>fb` | alternar entre buffers abertos |
| `<leader>fr` | arquivos recentes |
| `<leader>ss` | buscar símbolos no arquivo |

---

## 8. Substituição (find & replace)

| Comando | Ação |
|---|---|
| `:s/velho/novo/` | substitui a 1ª ocorrência na linha |
| `:s/velho/novo/g` | substitui todas na linha |
| `:%s/velho/novo/g` | substitui em **todo o arquivo** |
| `:%s/velho/novo/gc` | idem, mas **pede confirmação** em cada uma |
| `:%s/\<palavra\>/novo/g` | substitui só a palavra exata (word boundary) |

---

## 9. Múltiplas ocorrências (o "Cmd+D" do VSCode)

Você tem duas abordagens. Aprenda a primeira (é idiomática e poderosa); instale a segunda se sentir falta do comportamento exato do VSCode.

### Abordagem A — o padrão `cgn` (nativo, sem plugin)
O jeito Vim de "editar a próxima ocorrência e repetir":

1. Posicione o cursor sobre a palavra e aperte `*` (seleciona a palavra como busca).
2. Aperte `cgn` e digite o texto novo (ele troca a ocorrência atual).
3. Aperte `Esc`.
4. Aperte `.` para repetir na **próxima** ocorrência. Aperte `n` para pular uma sem mudar.

Resultado: você confirma uma por uma com `.`, controlando exatamente quais troca. Muito mais preciso que o Cmd+D.

### Abordagem B — multicursor de verdade (plugin `vim-visual-multi`)
Replica o Cmd+D do VSCode com cursores reais. Adicione ao LazyVim criando o arquivo `~/.config/nvim/lua/plugins/multicursor.lua`:

```lua
return {
  "mg979/vim-visual-multi",
  branch = "master",
}
```

Depois de reabrir o Neovim:
| Atalho | Ação |
|---|---|
| `Ctrl+n` | seleciona a palavra sob o cursor; aperte de novo pra pegar a próxima ocorrência (= Cmd+D) |
| `Ctrl+n` repetido | vai adicionando cursores nas próximas ocorrências |
| depois digite normalmente | edita todos os cursores ao mesmo tempo |
| `Esc` | sai do modo multicursor |

### Edição em coluna (Visual Block) — nativo
Pra editar várias linhas na mesma coluna (ex: adicionar `,` no fim de 10 linhas):

1. `Ctrl+v` (entra no Visual Block).
2. Mova com `j`/`k` pra selecionar as linhas.
3. `I` (insere no início) ou `A` (insere no fim), digite o texto.
4. `Esc` — o texto aparece em **todas** as linhas selecionadas.

---

## 10. Janelas, splits e buffers

### Splits (telas lado a lado)
| Comando | Ação |
|---|---|
| `Ctrl+w s` | divide na horizontal |
| `Ctrl+w v` | divide na vertical |
| `Ctrl+w h/j/k/l` | navega entre os splits |
| `Ctrl+w q` | fecha o split atual |
| `Ctrl+w =` | iguala o tamanho dos splits |

### Buffers (arquivos abertos)
| Comando | Ação |
|---|---|
| `<leader>bb` | alterna entre buffers |
| `<S-h>` / `<S-l>` | buffer anterior / próximo (LazyVim) |
| `<leader>bd` | fecha o buffer atual |

---

## 11. Plano de aprendizado sugerido

1. **Dia 1–2:** rode `vimtutor` no terminal (tutorial nativo de ~30 min). Foque em modos, `hjkl`, `i`/`Esc`, `:w`/`:q`.
2. **Semana 1:** force-se a usar `w`/`b`/`f` em vez das setas. Aprenda a gramática `ciw`, `ci"`, `di(`.
3. **Semana 2:** busca (`/`, `*`, `n`), substituição (`:%s`), e o `.` pra repetir.
4. **Semana 3:** os atalhos `<leader>` do topo desta folha, splits, e o fluxo `*` + `cgn` + `.`.
5. **Daí em diante:** deixe o which-key (`<leader>`) ser seu professor. Quando precisar de algo, abra o menu e descubra.

**Dica de ouro:** mantenha o menu which-key como muleta. Você não precisa decorar nada de cara — aperta espaço, espera, e ele te mostra o caminho.
