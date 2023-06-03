local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Lspconfig not installed...")
  return
end

require("st.after.lsp.mason")
require("st.after.lsp.handlers").setup()
