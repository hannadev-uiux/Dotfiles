# 🌸 Setup de Terminal — Amigável

Ambiente de terminal pensado pra quem está começando: Ghostty + zsh com atalhos
fáceis, sugestões, navegação por setas e foco em **vibe coding com Claude Code**.

## Instalar

```bash
cd ~/Downloads
unzip ana-setup.zip -d ~/        # cria ~/ana-setup
cd ~/ana-setup
chmod +x install.sh
./install.sh
```

Depois feche e abra o Ghostty, e digite `helpme`.

## O que vem configurado

- **`vibe`** abre o Claude Code com o **fundo roxo** (pra nunca confundir com um
  terminal normal).
- **`run`** abre um menu dos scripts do `package.json` (escolha com as setas).
- **Setas**: ↑↓ buscam no histórico, → aceita a sugestão em cinza,
  Option+←→ pula palavras.
- **`helpme`** mostra a cheatsheet de atalhos a qualquer momento.
- Prompt (Starship) que sempre mostra em qual pasta você está.

## Personalizar

- Pasta de projetos: edite o alias `proj` em `zsh/zshrc`.
- Tema do terminal: troque `theme =` em `ghostty/config`
  (veja opções com `ghostty +list-themes`).
- Atalhos: edite `docs/atalhos.md` — o `helpme` reflete na hora.

## Editor (LazyVim em português)

Inclui o LazyVim como editor, com toques em pt-BR: menu (which-key) com rótulos
em português, corretor ortográfico pt-BR (ligue com `:set spell`) e tema igual
ao do terminal. Digite `vimhelp` pra ver a cheatsheet de atalhos do Vim.
Obs: o Neovim/LazyVim são em inglês na base — só as partes mais visíveis foram
traduzidas.
