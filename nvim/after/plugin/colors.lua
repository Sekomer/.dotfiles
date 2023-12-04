
function ColorMyPencils(color)

    vim.cmd("let g:gruvbox_transparent_bg = 1")
    vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")

	color = color or "gruvbox"

    vim.cmd.background = dark;
	vim.cmd.colorscheme(color)

end

ColorMyPencils()

