require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Keymap Plugin Menu
-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})

-- Keymap Plugin Timerly
vim.api.nvim_create_user_command("Timer", function()
  vim.o.showtabline = 0
  vim.o.laststatus = 0
  vim.wo.number = false
  vim.o.scl = "no"
  vim.o.cmdheight = 0
  vim.cmd "TimerlyToggle"
end, {})

vim.keymap.set("n", "<leader>tt", "<cmd>Timer<cr>", { desc = "Start Focus Timer" })

-- Keymap Plugin Floaterm
vim.keymap.set("n", "<C-p>", "<cmd>FloatermToggle<cr>", { desc = "Toggle Floaterm", silent = true })

-- Keymap Plugin Triforce
vim.keymap.set("n", "<leader>tp", require("triforce").show_profile, { desc = "Show Triforce Stats" })

-- Keymap Plugin Lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Toggle LazyGit", silent = true })

-- Keymap Plugin Todo
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find TODOs with Telescope" })
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next TODO comment" })
map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous TODO comment" })

-- Keymap Plugin Project
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find Projects" })

-- Keymap Lazyjj
map("n", "<leader>jj", "<cmd>LazyJJ<cr>", { desc = "Git (Jujutsu): Open lazyjj" })
map("n", "<leader>jf", "<cmd>LazyJJCurrentFile<cr>", { desc = "Git (Jujutsu): lazyjj current file" })
