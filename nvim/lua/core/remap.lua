vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "<Down>", "jzz")
vim.keymap.set("n", "<Up>", "kzz")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<C-C>", [["+y]])
vim.keymap.set("n", "<M-C>", [["+Y]])
vim.keymap.set("n", "<M-C>", [["+Y]])
vim.keymap.set(
    "n", 
    "<leader>g", 
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)

