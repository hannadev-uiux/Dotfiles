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

# 5) LazyVim (editor) com toques em português
NVIM_DIR="$HOME/.config/nvim"
if [ ! -d "$NVIM_DIR" ]; then
  info "Instalando o LazyVim..."
  git clone https://github.com/LazyVim/starter "$NVIM_DIR"
  rm -rf "$NVIM_DIR/.git"
  ok "LazyVim instalado"
fi
cp "$DOTFILES/nvim/lua/config/options.lua" "$NVIM_DIR/lua/config/options.lua"
cp "$DOTFILES/nvim/lua/plugins/ptbr.lua"   "$NVIM_DIR/lua/plugins/ptbr.lua"
# extras mínimos pra web (ajuste com :LazyExtras dentro do nvim)
cat > "$NVIM_DIR/lazyvim.json" << 'JSON'
{
  "extras": [
    "lazyvim.plugins.extras.lang.typescript",
    "lazyvim.plugins.extras.lang.tailwind",
    "lazyvim.plugins.extras.lang.json",
    "lazyvim.plugins.extras.formatting.prettier",
    "lazyvim.plugins.extras.linting.eslint"
  ],
  "news": {},
  "version": 8
}
JSON
ok "Config do LazyVim (pt-BR) aplicada"

echo ""
info "Tudo pronto! 🌸 Próximos passos:"
echo "   1) Feche e abra o Ghostty (ou abra um terminal novo)."
echo "   2) Digite 'helpme' pra ver seus atalhos."
echo "   3) Entre num projeto (cd ...) e digite 'vibe' pra abrir o Claude Code."
