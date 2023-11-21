return {
	"numToStr/FTerm.nvim",

	config = function ()
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>tt", "<cmd>lua require('FTerm').toggle()<CR>", { desc = "Toggle terminal" }) -- toggle terminal
	end
}
