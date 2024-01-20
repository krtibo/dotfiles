-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "flannel-muted"
lvim.builtin.dap.active = true
lvim.builtin.bufferline.options.separator_style= "slant"
vim.o.expandtab = false
vim.o.fixeol = false
vim.o.fixendofline = false
vim.g.minimap_width = 10
vim.g.minimap_git_colors = 1
vim.g.minimap_auto_start = 1
vim.g.minimap_enable_highlight_colorgroup = false
vim.g.smoothie_update_interval = 20
vim.opt.termguicolors = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-t>"] = ":ToggleTerm direction=float i<cr>"
lvim.keys.normal_mode["<C-j>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-k>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["\\"] = ":vsplit<cr>"
lvim.keys.normal_mode["|"] = "<C-w>c"
lvim.keys.normal_mode["O"] = "o<Esc>"
lvim.keys.normal_mode["∆"] = ":m .+1<CR>=="
lvim.keys.normal_mode["˚"] = ":m .-2<CR>=="
lvim.keys.normal_mode["<leader>1"] = ":BufferLineGoToBuffer 1<cr>"
lvim.keys.normal_mode["<leader>2"] = ":BufferLineGoToBuffer 2<cr>"
lvim.keys.normal_mode["<leader>3"] = ":BufferLineGoToBuffer 3<cr>"
lvim.keys.normal_mode["<leader>4"] = ":BufferLineGoToBuffer 4<cr>"
lvim.keys.normal_mode["<leader>5"] = ":BufferLineGoToBuffer 5<cr>"
lvim.keys.normal_mode["<leader>6"] = ":BufferLineGoToBuffer 6<cr>"
lvim.keys.normal_mode["<leader>7"] = ":BufferLineGoToBuffer 7<cr>"
lvim.keys.normal_mode["<leader>8"] = ":BufferLineGoToBuffer 8<cr>"
lvim.keys.normal_mode["<leader>9"] = ":BufferLineGoToBuffer 9<cr>"
lvim.keys.normal_mode["<leader>-1"] = ":BufferLineGoToBuffer -1<cr>"
lvim.keys.visual_mode["∆"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["˚"] = ":m '<-2<CR>gv=gv"
lvim.keys.term_mode["<C-t>"] = "<C-\\><C-n>"
vim.keymap.set({ "n", "o", "x" }, "<s-h>", "^", { noremap = true, silent = true })
vim.keymap.set({ "n", "o", "x" }, "<s-l>", "g_", { noremap = true, silent = true })
-- builtin plugins config
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.lualine.options.theme = "flannel"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.treesitter.context_commentstring = nil
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"scss",
	"rust",
	"java",
	"yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.auto_install = true
lvim.lazy.opts.checker = { enabled = false }
lvim.builtin.bufferline.options.numbers = function(opts)
	return string.format('%s', opts.raise(opts.ordinal))
end
lvim.builtin.bufferline.options.show_buffer_icons = false
lvim.builtin.bufferline.highlights = require("flannel.groups.integrations.bufferline").get()
lvim.plugins = {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end
	},
}
lvim.builtin.which_key.mappings.s.t = {
  require('telescope').extensions.live_grep_args.live_grep_args, "Text",
}

require("which-key").register({
	t = {
		name = "Test",
		r = { ":lua require(\"neotest\").run.run()<cr>", "Run Nearest Test" },
		R = { ":lua require(\"neotest\").run.run(vim.loop.cwd())<cr>", "Run All Files" },
		o = { ":lua require(\"neotest\").output_panel.open()<cr>", "Toggle Output Panel" },
		c = { ":lua require(\"neotest\").run.run(vim.fn.expand(\"%\"))<cr>", "Run Current File" },
		d = { ":lua require(\"neotest\").run.run({strategy = \"dap\"})<cr>", "Debug Nearest Test" },
		t = { ":lua require(\"dapui\").toggle()<cr>", "Toggle Debugger UI" },
	},
	o = {
		name = "Other",
		e = { ":term open -a Arc http://www.excalidraw.com <cr> :BufferClose", "Open Excalidraw in browser" },
		w = { ":set listchars=tab:⇤–⇥,space:·,trail:·,precedes:⇠,extends:⇢,nbsp:×<cr>:set list<cr>", "Show whitespaces" },
		h = { ":set nolist<cr>", "Hide whitespaces" },
		l = { ":set wrap!<cr>", "Toggle linewrap" },
	},
	l = {
		p = { ":lua vim.lsp.buf.hover()<cr>", "Peek type" },
	},
	g = {
		d = { ":DiffviewOpen<cr>", "Diff view" },
		dd = { ":DiffviewClose<cr>", "Diff view close" },
	},
	n = {
		name = "Wiki",
		n = { ":lua require(\"kiwi\").open_wiki_index()<cr>", "Open Wiki index" },
		t = { ":lua require(\"kiwi\").todo.toggle()<cr>", "Toggle task" },
	},
}, { prefix = "<leader>" })

-- Additional Plugins
lvim.plugins = {
	{
		'wfxr/minimap.vim',
		'psliwka/vim-smoothie',
		'mfussenegger/nvim-lint',
		'tpope/vim-surround',
		'sindrets/diffview.nvim',
		'ggandor/leap.nvim',
		{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0", lazy = true },
		{ "krtibo/flannel.nvim", name = "flannel", priority = 1000 },
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {
			},
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
				}
		},
		{ "mxsdev/nvim-dap-vscode-js", lazy = true, requires = {"mfussenegger/nvim-dap"} },
		{
			"microsoft/vscode-js-debug",
			opt = true,
			lazy = true,
			run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
		},
		{
			"nvim-neotest/neotest",
			lazy = true,
			dependencies = {
				"nvim-lua/plenary.nvim",
				"haydenmeade/neotest-jest",
			},
			config = function()
				local neotest_ns = vim.api.nvim_create_namespace "neotest"
				vim.diagnostic.config({
					virtual_text = {
						format = function(diagnostic)
							local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
							return message
						end,
					},
				}, neotest_ns)
				require('neotest').setup({
					adapters = {
						require('neotest-jest')({
							jestCommand = "npm run unit --",
							jestConfigFile = "custom.jest.config.ts",
							env = { CI = true },
							cwd = function()
								return vim.fn.getcwd()
							end,
						}),
					}
				})
			end
		},
		{
			"Pocco81/auto-save.nvim",
			config = function()
				 require("auto-save").setup {
					enabled = true,
					write_all_buffers = false,
					execution_message = {
						message = function()
							local text = "AutoSaved at " .. vim.fn.strftime("%H:%M:%S")
							-- require("notify")(text)
							return text
						end,
						dim = 0.18, -- dim the color of `message`
						cleaning_interval = 3000, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
					},
					trigger_events = {"InsertLeave", "TextChanged"},
					debounce_delay = 5000,
				 }
			end,
		},
		{
			'serenevoid/kiwi.nvim',
			dependencies = {
					"nvim-lua/plenary.nvim"
			},
			opts = {
					{
							name = "main",
							path = "/Users/krtibo/MEGA/DOC/wiki"
					},
			},
			keys = {
					{ "<leader>n", ":lua require(\"kiwi\").open_wiki_index()<cr>", desc = "Open Wiki index" },
					{ "<leader>t", ":lua require(\"kiwi\").todo.toggle()<cr>", desc = "Toggle Markdown Task" }
			},
			lazy = true
		},
	},
}

-- Plugin setup
vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward)')

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

require("dap-vscode-js").setup({
	debugger_path = "/Users/krtibo/.local/share/lunarvim/site/pack/lazy/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
	adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		}
	}
end

require('lint').linters_by_ft = {
	javascript = {'eslint_d',},
	typescript = {'eslint_d',},
	vue = {'eslint_d',}
}

local dap = require("dap")
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- Change this to your path!
    command = '/Users/krtibo/.config/lvim/source/lldb/extension/adapter/codelldb',
    args = {"--port", "${port}"},
  }
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/c64_rust', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

local lastaccessed
vim.api.nvim_create_autocmd({'WinEnter'}, {
  callback = function()
    local minimapname = '-MINIMAP-'
    if string.sub(vim.api.nvim_buf_get_name(0), -string.len(minimapname)) == minimapname then
      vim.api.nvim_set_current_win(lastaccessed)
    else
      lastaccessed = vim.api.nvim_eval("win_getid(winnr('#'))")
    end
  end
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
		vim.opt_local.conceallevel = 1
  end,
})

require('mason-lspconfig').setup_handlers({
  function(server)
    require('lvim.lsp.manager').setup(server)
  end
})
-- local logo1 = [[                      /|      __
-- *             +      / |   ,-~ /             +
--      .              Y :|  //  /                .         *
--          .          | jj /( .^     *
--                *    >-"~"-v"              .        *        .
-- *                  /       Y
--    .     .        jo  o    |     .            +
--                  ( ~T~     j                     +     .
--       +           >._-' _./         +
--                /| ;-"~ _  l
--   .           / l/ ,-"~    \     +
--               \//\/      .- \
--        +       Y        /    Y
--                l       I     !
--                ]\      _\    /"\
--               (" ~----( ~   Y.  )
--           ~~~~~~~~~~~~~~~~~~~~~~~~~~]]
local logo = [[⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠇⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠧⡇⠀⠀⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⡤⡆⠦⠆⢀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠧⣷⣆⠅⢦⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠈⠀⠀⠀⠀⠀⢤⣤⣆⢇⣶⣤⡤⡯⣦⣌⡡⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠷⣿⣷⣆⣐⡆⠀⠀⠀⠀⢀⠤⠊⠀⠀⢀⣠⣾⢯⣦⣴⣜⣺⣾⣿⣤⠟⠋⣷⢛⡣⠭⠢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠯⣿⣷⢫⡯⠄⠀⠀⢀⠐⠁⠀⠀⠀⠠⣤⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣙⣷⡗⢤⡤⠀⠈⣰⠶⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣩⣿⡏⠉⠉⠀⢠⡔⠁⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠑⣏⠶⡉⠖⣡⠂⣈⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣮⣿⣧⣤⣤⠖⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢉⡻⣿⣿⣿⣿⣿⣿⣿⣿⠟⠓⠈⠅⠈⠀⠀⠘⢒⣽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⡿⠛⠉⠀⠀⠀⣀⠔⢀⡴⣃⠀⠀⢀⠷⠲⡄⠸⠟⢋⣿⣿⣿⣿⣿⡇⠀⠀⠀⠐⠁⠀⠀⠂⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⡆⣷⣆⡐⠶⠤⢤⣷⣀⣀⣩⢐⣟⣥⠜⣤⣀⣠⣤⠀⠈⠉⢀⣹⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢃⣿⣞⣫⡔⢆⡸⡿⣿⣿⣄⣰⣿⠁⢀⣛⠿⣻⣿⣿⣧⣬⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢀
⢼⣿⣟⢿⣧⣾⣵⣷⣿⣿⣟⡿⢿⣶⣞⣍⡴⢿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⣠⠈⠀⢀⣀⣼
⠋⣿⣟⡛⢿⣿⣿⣿⣿⣿⣭⣿⣿⣿⣿⣯⣽⣿⣿⣿⣿⠟⠛⠿⢽⣿⣿⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣀⢀⡠⣤⣤⣰⣿⠟⠁⠀⠀⡼⢾⣿
⣻⣿⣟⣇⠈⣉⣯⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠃⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣴⣶⣤⣤⣤⣤⣴⣴⣴⣶⣦⣦⣤⣦⣀⣦⣤⣶⣿⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⡀⣤⣬⣾⣿
⡝⣿⣿⣇⣤⣶⣿⣷⣾⣭⡿⠻⢿⣿⣿⣿⣿⠿⠃⠀⠀⠀⠀⡄⠀⠀⠀⢊⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢿⠟⢉⠀⡀⢤⣴⣿⣿⣿⠿⠻
⡁⣻⣿⣿⣿⣿⣷⣿⣿⣿⣿⠾⣿⡿⠞⠁⠀⠀⠀⠀⠀⠔⠫⡅⠀⠀⠀⠀⠁⣀⠀⠈⠻⣿⣿⣿⣿⣻⢟⣁⣄⡄⣀⠙⠻⣿⣿⡿⠿⠛⡋⠕⠂⢀⣀⣄⣓⣳⢿⠟⢛⣩⠴⠈⠀
⠂⡁⠈⠛⠛⠛⠛⠋⠁⠀⠈⠈⡀⠀⠀⠀⠀⢀⠘⠀⠀⠀⠆⠀⡀⡢⣀⣆⠄⠈⠨⢦⡀⣈⠙⠛⠿⢿⣿⣿⣿⣿⣿⡿⡿⠿⠟⠆⠒⠁⠀⢶⣾⠿⠟⠛⢉⣀⣠⡶⠚⠁⠀⠀⣠
⠀⡇⡄⣀⡀⠀⠀⠀⠀⠀⠀⠀⢬⠠⠀⡀⠀⠋⠁⠀⡀⠀⠀⡀⠆⢱⣿⣿⣧⣧⣄⠛⣿⣞⣵⣤⣷⣄⠀⠀⠀⠐⠀⠀⠀⠀⠀⠈⠉⠁⠁⠀⠠⢤⣶⣾⣿⡿⠋⢀⣀⣰⣶⣾⣿
⡀⡆⠀⡉⡁⢿⣉⢀⠀⣰⣷⣿⣟⠠⡽⢂⡀⡄⠀⠰⣖⢱⢖⢂⡆⠈⣿⣿⣿⣿⣿⣶⣄⡙⠻⢿⣿⣿⣷⣦⣀⠀⠠⣤⣀⡀⢈⣓⣶⣶⣿⣿⣿⣿⣿⠟⠉⠀⠀⠀⣉⣭⣽⣿⣿
⡇⣯⣿⣿⣿⣾⣿⣿⣿⠿⠟⡡⢞⣹⠾⢻⣚⣛⢺⠞⢋⣭⣾⣧⡃⢄⡈⢿⣿⣿⣿⣿⣿⣿⣯⣿⣮⣽⣿⣿⣿⣿⣷⣬⣽⣿⣿⣿⣽⡿⣿⡿⠟⠋⢀⣀⣐⣺⣿⣿⣟⣫⣭⣿⣿
⢳⣿⣿⣿⣿⣿⣿⣿⣿⣤⣿⣿⣿⣿⣿⣦⠒⠉⢁⡀⠀⣙⣛⢿⣷⣶⣅⠀⠙⠻⣿⣿⣿⣿⣟⡚⠛⠻⠞⠿⠿⡿⡿⠯⠁⠟⣊⠾⠝⢋⣁⣀⣤⣤⣿⣿⣿⡿⠿⠿⠻⠛⠻⠻⠿
⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣐⣾⡿⡟⢶⠾⢋⢹⠿⢿⣿⣿⣷⣦⡈⠙⠛⠿⠿⢿⣶⣶⣶⣶⣶⢶⠟⠚⠀⠁⠀⠀⠙⠛⠛⠛⠛⠛⠋⠉⠁⠀⠀⠀⠀⠀⢀⠀⠀]]
lvim.builtin.alpha.dashboard.section.header.val = vim.split(logo .. "\n", "\n")
