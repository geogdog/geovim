-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- EasyAlign
map("x", "ga", "<Plug>(EasyAlign)", { desc = "EasyAlign" })

-- map("n", "<leader>tp", function()
--   Util.float_term({ "terragrunt", "plan" }, { nowait = false })
-- end, { desc = "Terminal (cwd)" })

-- NeoTree Focus
map("n", "<leader>fg", "<cmd>Neotree focus<cr>", { desc = "Focus NeoTree" })
