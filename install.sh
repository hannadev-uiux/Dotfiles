#!/usr/bin/env bash
# install.sh — setup amigável (iniciante). Idempotente, faz backup do que existir.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TS="$(date +%Y%m%d-%H%M%S)"
info() { printf "\033[1;35m==>\033[0m %s\n" "$1"; }
ok()   { printf "\033[1;32m  ✓\033[0m %s\n" "$1"; }

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if { [ -e "$dst" ] || [ -L "$dst" ]; } && [ "$(readlink "$dst" 2>/dev/null || true)" != "$src" ]; then
    mv "$dst" "${dst}.backup-${TS}"
    ok "Backup: ${dst}.backup-${TS}"
  fi
  ln -sfn "$src" "$dst"
  ok "Link: $dst"
}

# 1) Homebrew
if ! command -v brew >/dev/null 2>&1; then
  info "Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  [ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
  [ -x /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
else
  ok "Homebrew já instalado"
fi

# 2) Pacotes
info "Instalando pacotes (Ghostty, fonte, starship, etc.)..."
brew bundle --file="$DOTFILES/Brewfile"
ok "Pacotes instalados"

# 3) Ferramentas npm globais: Claude Code + ni/nr (runner de scripts)
info "Instalando Claude Code e o runner de scripts (ni/nr)..."
npm install -g @anthropic-ai/claude-code @antfu/ni
ok "Claude Code e ni/nr prontos"

# 4) Symlinks de config
link "$DOTFILES/zsh/zshrc"          "$HOME/.zshrc"
link "$DOTFILES/zsh/starship.toml"  "$HOME/.config/starship.toml"
link "$DOTFILES/ghostty/config"     "$HOME/.config/ghostty/config"

# 5) Neovim — config própria (UI/UX Design, pt-BR, estilo VSCode)
# A config inteira vive nos dotfiles e é linkada (igual ao zsh/ghostty).
# Os plugins (lazy.nvim) e os servidores de linguagem (Mason) se instalam
# sozinhos na primeira vez que você abrir o 'nvim'.
info "Instalando a config do Neovim..."
link "$DOTFILES/nvim" "$HOME/.config/nvim"
ok "Config do Neovim aplicada (plugins se instalam no 1º 'nvim')"

echo ""
info "Tudo pronto! 🌸 Próximos passos:"
echo "   1) Feche e abra o Ghostty (ou abra um terminal novo)."
echo "   2) Digite 'helpme' pra ver seus atalhos."
echo "   3) Entre num projeto (cd ...) e digite 'vibe' pra abrir o Claude Code."
