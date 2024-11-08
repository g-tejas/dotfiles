return {
    "Mofiqul/vscode.nvim",
    opts = {
        transparent = true,
        italic_comments = true,
        underline_links = true,
        disable_nvimtree_bg = true,
    },
    config = function()
        vim.cmd.colorscheme("vscode")
    end
}
