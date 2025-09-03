--|========================================================================|-- 
--|                      CUSTOMIZED CONFIG BY NEPHA                        |--
--|========================================================================|--	

-----------------------------
-- BEAUTY NORMINETTE 42 -----
-----------------------------
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·" }
vim.opt.colorcolumn = "80"
-----------------------------
-- PROVIDER ---- (-_-) ------
-----------------------------
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_node_provider    = 0

-----------------------------
-- LAZY.NVIM ----------------
-----------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

---------------------------------
-- PLUGIN CONFIGURATION ---------
---------------------------------
require("lazy").setup({
		rocks = {
    	enabled = false,
    	hererocks = false,
  	},
    -----------------------------
    -- FORMAT LITTER PRETTIER ---
    -----------------------------
    {
	    "mhartington/formatter.nvim",
	    config = function()
		    require("formatter").setup({
			filetype = {
				-- Markdown
				markdown = {
					function()
						return {
							exe = "prettier",
							args = { "--parser", "markdown" },
							stdin = true,
						}
					end,
				},

				-- JavaScript / TypeScript / React / Solidity
				javascript = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
							stdin = true,
						}
					end,
				},
				typescript = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
							stdin = true,
						}
					end,
				},
				typescriptreact = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
							stdin = true,
						}
					end,
				},
				javascriptreact = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
							stdin = true,
						}
					end,
				},
				solidity = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
							stdin = true,
						}
					end,
				},

				-- SCSS / CSS / HTML
				scss = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
							stdin = true,
						}
					end,
				},
				css = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
							stdin = true,
						}
					end,
				},
				html = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
							stdin = true,
						}
					end,
				},

				-- Lua
				lua = {
					function()
						return {
							exe = "prettier",
							args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
							stdin = true,
						}
					end,
				},

				-- C (clang-format)
				c = {
					function()
						return {
							exe = "clang-format",
							args = { "--assume-filename", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
							stdin = true,
						}
					end,
				},
			},
		})

		-- Auto format à la sauvegarde
		vim.api.nvim_create_autocmd("BufWritePost", {
			command = "FormatWrite",
		})
	end,
},
	-----------------------------
	-- DISCORD RICH PRESENCE ----
	-----------------------------
	{
		"andweeb/presence.nvim",
		config = function()
			require("presence").setup({
				auto_update = true,
				neovim_image_text = "42_nephcode",
				main_image = "neovim",
				debounce_timeout   = 10,
				buttons = true,
				show_time = true,
				workspace_text = "Tryhard %s",
			})
		end,
	},
	-----------------------------
	-- NVIM TREE ----------------
	-----------------------------
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
		end,
	},
	-----------------------------
	-- PLUGIN TELESCOPE ---------
	-----------------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({})
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
		end,
	},
	-----------------------------
	-- PLUGIN NOTIFY ------------
	-----------------------------
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	-----------------------------
	-- PLUGIN MINI --------------
	-----------------------------
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.starter").setup() -- minimal Home
			require("mini.statusline").setup() -- statutbar
			require('mini.icons').setup() -- filetype icons
			
		end,
	},
	-----------------------------
	-- PLUGIN TREESITTER --------
	-----------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master', 
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent    = { enable = true },
				ensure_installed = {
					"lua", "vim", "vimdoc", "query", "bash", -- MACHINE
					"c", "cpp", "python", --------------------- 42 
					"javascript", "typescript","json", ------- REMIX
					"html", "css", "scss", -------------------- WEB
					"solidity", "rust" ----------------------- BACK 
				},
			})
		end,
	},
	--|====================================================|--
	--|               THEME CUSTOMIZED BY NEPHA            |--
	--|====================================================|--
	{
		"scottmckendry/cyberdream.nvim",
		config = function()
			require("cyberdream").setup({
				-- Set light or dark variant
				variant = "default", -- use "light" for the light variant.
				-- Enable transparent background
				transparent = true,
				-- Reduce the overall saturation of colours 
				saturation = 1, -- accepts a value between 0 and 1.
				-- Enable italics comments
				italic_comments = false,
				-- Replace all fillchars with ' ' for the ultimate clean look
				hide_fillchars = false,
				-- Apply a modern borderless 
				borderless_pickers = false,
				-- Set terminal colors used in `:terminal`
				terminal_colors = true,
				-- Improve start up time by caching highlights. Generate Cache
				cache = false,
				highlights = {
					Comment = { fg = "#696969", bg = "NONE", italic = true }
				},
				overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
					return {
						Comment = { fg = colors.green, bg = "NONE", italic = true },
						["@property"] = { fg = colors.magenta, bold = true },
					}
				end,
				colors = {
					--transparent = true,
					green = "#69FF94",
					dark = { magenta = "#FF007E", fg = "#A4FFFF" },
					light = { red = "#FF9C99", cyan = "#5ef1ff" },
				},
				extensions = { telescope = true, notify = true, mini = true },
			})
			vim.cmd("colorscheme cyberdream")
		end,
	},
})

