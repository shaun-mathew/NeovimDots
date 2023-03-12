vim.opt.swapfile = false
vim.opt.undofile = true -- enable persistent undo
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.backspace = "start,eol,indent"
--[[ vim.opt.formatoptions:append({ "cro" }) ]]
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.list = false
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.opt.whichwrap = ""
vim.opt.smartindent = true
vim.opt.autoindent = false
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.showmode = false
vim.opt.cmdheight = 2
vim.opt.conceallevel = 0
vim.opt.writebackup = false
vim.opt.linebreak = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.shortmess:append("sI")
vim.opt.shiftround = true -- Round indent
-- vim.opt.fileencoding = "utf-8"
--[[ vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. ]]
-- vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use
-- vim.opt.hlsearch = false
