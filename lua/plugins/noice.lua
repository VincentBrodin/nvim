return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
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

		local normal_bg = vim.api.nvim_get_hl_by_name("Normal", true).background
		local normal_bg_hex = normal_bg and string.format("#%06x", normal_bg) or "#000000"
		require("notify").setup({
			background_colour = normal_bg_hex,
			top_down = false,
		})

		local stages_util = require("notify.stages.util")
		return function(direction)
			return {
				function(state)
					local next_height = state.message.height + 2
					local next_row = stages_util.available_slot(state.open_windows, next_height, direction)
					if not next_row then
						return nil
					end
					return {
						relative = "editor",
						anchor = "NE",
						width = state.message.width,
						height = state.message.height,
						col = vim.opt.columns:get(),
						row = next_row,
						border = "rounded",
						style = "minimal",
						opacity = 0,
					}
				end,
				function(state, win)
					return {
						opacity = { 100 },
						col = { vim.opt.columns:get() },
						row = {
							stages_util.slot_after_previous(win, state.open_windows, direction),
							frequency = 3,
							complete = function()
								return true
							end,
						},
					}
				end,
				function(state, win)
					return {
						col = { vim.opt.columns:get() },
						time = true,
						row = {
							stages_util.slot_after_previous(win, state.open_windows, direction),
							frequency = 3,
							complete = function()
								return true
							end,
						},
					}
				end,
				function(state, win)
					return {
						width = {
							1,
							frequency = 2.5,
							damping = 0.9,
							complete = function(cur_width)
								return cur_width < 3
							end,
						},
						opacity = {
							0,
							frequency = 2,
							complete = function(cur_opacity)
								return cur_opacity <= 4
							end,
						},
						col = { vim.opt.columns:get() },
						row = {
							stages_util.slot_after_previous(win, state.open_windows, direction),
							frequency = 3,
							complete = function()
								return true
							end,
						},
					}
				end,
			}
		end
	end,
}
