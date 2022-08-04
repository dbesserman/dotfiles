local options = {
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
