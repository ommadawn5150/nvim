local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  title = true,
  clipboard = "unnamedplus",
  tabstop = 4,
  number = true,
  modifiable = true,
  termguicolors = true,
  winblend = 0,
  pumblend = 0,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
