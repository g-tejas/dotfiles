return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "cpp" },  -- or you can use "all" for all languages
            highlight = { enable = true },
        })
    end,
}