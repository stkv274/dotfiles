local status_ok, which_key = pcall(require, "which-key")

if not status_ok then
  print("No which-key installed")
  return
end

which_key.setup{}
