return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup({
            options = {
                theme = 'dracula'
            },
            sections = {
                lualine_c = {'buffers'},
            },
        })
    end
}
