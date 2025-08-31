--|========================================================================|-- 
--|                      CUSTOMIZED CONFIG BY NEPHA                        |--
--|========================================================================|--	

-----------------------------
-- BEAUTY COLORS ------------
-----------------------------
vim.opt.termguicolors = true

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
	-----------------------------
	-- DISCORD RICH PRESENCE ----
	-----------------------------
	{
		"andweeb/presence.nvim",
		config = function()
			require("presence").setup({
				neovim_image_text = "42_nephcode ❤️",
				main_image = "neovim",
				show_time = true,
				-- client_id = "793271441293967371", -- optionnel (par défaut)
			})
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
			require("mini.starter").setup() -- écran d’accueil minimal
			require("mini.statusline").setup() -- barre de statut
			-- tu peux activer d’autres modules mini.* ici
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
					"javascript", "typescript",	"json", ------- REMIX
					"html", "css", "scss", -------------------- WEB
					"solidity", "rust", "php" ----------------- BACK 
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
				-- Reduce the overall saturation of colours for a more muted look
				saturation = 1, -- accepts a value between 0 and 1.
				-- Enable italics comments
				italic_comments = false,
				-- Replace all fillchars with ' ' for the ultimate clean look
				hide_fillchars = false,
				-- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
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
					green = "#00ff00",
					dark = { magenta = "#ff00ff", fg = "#eeeeee" },
					light = { red = "#ff5c57", cyan = "#5ef1ff" },
				},
				extensions = { telescope = true, notify = true, mini = true },
			})
			vim.cmd("colorscheme cyberdream")
		end,
	},
})