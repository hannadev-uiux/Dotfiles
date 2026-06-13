-- =====================================================================
--  Neovim — config para UI/UX Design 🌸
--  Tema colorido (Catppuccin) + interface completa
-- =====================================================================

-- Líder precisa ser definido ANTES de carregar plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Opções e atalhos base
require("config.options")
require("config.keymaps")

-- ---------------------------------------------------------------------
--  Bootstrap do gerenciador de plugins (lazy.nvim)
-- ---------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Carrega todos os plugins de lua/plugins/
require("lazy").setup("plugins", {
  ui = { border = "rounded" },
  change_detection = { notify = false },
})
