local wk = require("which-key")

vim.o.timeoutlen = 300

wk.setup({
	key_labels = {
		["<leader>"] = "SPC",
	},
})

local leader = {
	b = { "<cmd>BufferLinePick <cr>", "Pick Bufferline" },
	d = { "<cmd>Alpha<cr>", "Open Dashboard" },
	e = { "<cmd>Neotree toggle reveal_force_cwd<cr>", "Toggle Neotree" },
	f = {
		name = "Telescope",
		f = { "<cmd> Telescope find_files <cr>", "Find Files" },
		a = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>", "Find Files" },
		e = { "<cmd> Telescope file_browser path=%:p:h<cr>", "File Explorer" },
		g = { "<cmd> Telescope current_buffer_fuzzy_find <cr>", "Grep Current File" },
		G = { "<cmd> Telescope live_grep <cr>", "Grep Files" },
		b = { "<cmd> Telescope buffers <cr>", "Find Buffers" },
		h = { "<cmd> Telescope help_tags <cr>", "Help Pages" },
		p = { "<cmd> Telescope projects <cr>", "Find Projects" },
		r = { "<cmd> Telescope oldfiles <cr>", "Recent Files" },
		t = { "<cmd> Telescope colorscheme <cr>", "Vim Colorschemes" },
		c = { "<cmd> Telescope git_commits <cr>", "Git Commits" },
		s = { "<cmd> Telescope git_status <cr>", "Git Status" },
		k = { "<cmd> Telescope keymaps <cr>", "Show Keymaps" },
	},
	g = {
		name = "Git",
		d = {
			name = "Diff",
			d = { "<cmd>  DiffviewOpen<CR>", "Open Diffview" },
			c = { "<cmd>  DiffviewClose<CR>", "Close Diffview" },
			h = { "<cmd>  DiffviewFileHistory<CR>", "Open Git History" },
			r = { "<cmd>  DiffviewRefresh<CR>", "Reload Diffview" },
		},
		g = { "<cmd>LazyGit<CR>", "Open LazyGit" },
		n = { "<cmd>Neogit<CR>", "Open Neogit" },
	},
	j = {
		name = "Jump",

		a = { "<cmd> HarpoonAddFile <CR>", "Harpoon Add File" },
		t = { "<cmd> HarpoonToggle <CR>", "Toggle Harpoon UI" },
		n = { "<cmd> HarpoonNext <CR>", "Go To Next File" },
		p = { "<cmd> HarpoonPrev <CR>", "Go To Prev File" },
		f = { "<cmd> Telescope harpoon marks <CR>", "Search Harpoon Marks" },
	},
	m = { "<cmd>WindowsMaximize<cr>", "Maximize Window" },
	q = { "<cmd>copen <CR>", "Open Quickfix List" },
	Q = { "<cmd>lopen <CR>", "Open Location List" },
	r = {
		name = "Run",
		r = { "<cmd>RunCode <CR>", "Run Code" },
	},
	s = {
		name = "Session",
		l = { "<cmd> SessionManager load_last_session<CR>", "Load Last Session" },
		d = { "<cmd> SessionManager load_current_dir_session<CR>", "Load Current Dir Session" },
		f = { "<cmd> SessionManager load_session<CR>", "Find Session" },
	},
	u = { "<cmd>UndotreeToggle<CR>", "Toggle Undotree" },
	z = {
		name = "ZenMode",
		z = { "<cmd> ZenMode <CR>", "Toggle ZenMode" },
		t = { "<cmd> Twilight <CR>", "Toggle Twilight" },
	},

	["t"] = {
		name = "Terminal",
		["t"] = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },
		["T"] = { "<cmd>ToggleTermToggleAll<CR>", "Toggle All Terminals" },
	},
	["T"] = {
		name = "Trouble Diagnostics",
		t = { "<cmd>  TroubleToggle<CR>", "Toggle Trouble" },
		d = { "<cmd>  Trouble document_diagnostics<CR>", "Document Diagnostics" },
		D = { "<cmd>  Trouble workspace_diagnostics<CR>", "Workspace Diagnostics" },
		r = { "<cmd>  Trouble lsp_references<CR>", "Lsp References" },
		R = { "<cmd>  Trouble lsp_definitions<CR>", "Lsp Definitions" },
		T = { "<cmd>  Trouble lsp_type_definitions<CR>", "Lsp Type Definitions" },
		q = { "<cmd>  Trouble quickfix<CR>", "Quickfix List" },
		l = { "<cmd>  Trouble loclist<CR>", "Location List" },
	},
	v = {
		name = "Vim Options and Toggles",
		r = { "<cmd> :set rnu! <cr>", "Toggle Relative Numbers" },
		w = { "<cmd> :set wrap! <cr>", "Toggle Word Wrapping" },
		l = {
			function()
				if vim.o.colorcolumn == "" then
					vim.o.colorcolumn = "80"
				else
					vim.o.colorcolumn = ""
				end
			end,
			"Toggle Line Length Guide",
		},
	},
	w = {
		name = "Window Tools",
		h = { "<cmd>WindowsMaximizeHorizontally<CR>", "Maximize Horizontally" },
		s = { "<cmd>WinShift swap<CR>", "Swap Windows" },
		v = { "<cmd>WindowsMaximizeVertically<CR>", "Maximize Vertically" },
		w = { "<cmd>WinShift<CR>", "Shift Windows" },
	},
	x = { "<cmd>wqa<cr>", "Save and Exit" },
}

local general_mappings = {
	["<C-s>"] = { "<cmd>:wa<cr>", "Save File" },
	["<C-h>"] = { "<cmd> HarpoonNav 1<cr>", "Harpoon go to file 1" },
	["<C-j>"] = { "<cmd> HarpoonNav 2<cr>", "Harpoon go to file 2" },
	["<C-k>"] = { "<cmd> HarpoonNav 3<cr>", "Harpoon go to file 3" },
	["<C-l>"] = { "<cmd> HarpoonNav 4<cr>", "Harpoon go to file 4" },
	["[b"] = { "<cmd> BufferLineCyclePrev<CR>", "Cycle Previous Buffer" },
	["]b"] = { "<cmd> BufferLineCyclePrev<CR>", "Cycle Previous Buffer" },
	["[l"] = { "<cmd>lprevious<cr>", "Previous Location List" },
	["]l"] = { "<cmd>lnext<cr>", "Next Location List" },
	["[q"] = { "<cmd>cprevious<cr>", "Previous Quickfix List" },
	["]q"] = { "<cmd>cnext<cr>", "Next Quickfix List" },
	["[L"] = { "<cmd>lfirst<cr>", "First Location List" },
	["]L"] = { "<cmd>llast<cr>", "Last Location List" },
	["[Q"] = { "<cmd>cfirst<cr>", "First Quickfix List" },
	["]Q"] = { "<cmd>clast<cr>", "Last Quickfix List" },
}

local insert_mappings = {
	["<C-s>"] = { "<Esc><cmd>:wa<cr>a", "Save File" },
}

local g_commands = {
	g = {
		p = { "p`[v`]", "Paste and Highlight" },
	},
}

vim.cmd([[
  tnoremap <leader><Esc> <C-\><c-n>
  nnoremap <nowait><silent> <C-C> :noh<CR><C-l>
]])
wk.register(leader, { prefix = "<leader>" })
wk.register(g_commands)
wk.register(general_mappings)
wk.register(insert_mappings, { mode = "i" })
