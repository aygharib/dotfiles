require('solarized-osaka').setup({
	disable_background = true
})

function ColorMyPencils(color)
	color = color or "solarized-osaka"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

ColorMyPencils()
