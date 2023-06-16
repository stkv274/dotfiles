-- local colorscheme = "oxocarbon"
-- local colorscheme = "default"
-- local colorscheme = "torte"
-- local colorscheme = "lunar"
-- local colorscheme = "catppuccin"
-- local colorscheme = "aurora"
local colorscheme = "sherbet"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found...")
end
