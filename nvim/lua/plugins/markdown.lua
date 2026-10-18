return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        list = {
            enabled = true,
            icons = { '●', '○', '◆', '◇' },
            ordered_icon = "%d.",
        },

        heading = {
            enabled = true,
            width = 'block',
            number = false,   -- pas de numérotation
            -- sign = false,     -- IMPORTANT → évite les overlays
            sign = true,  
            border = true,
            signs = { '󰫎 ' },
            border_virtual = false,
            position = "left", -- propre et lisible
            min_width = 90,
        },

        checkbox = { enabled = true },
    },

    config = function(_, opts)
        require("render-markdown").setup(opts)

        -- 🔥 Styles standard
        vim.api.nvim_set_hl(0, "RenderMarkdownBold", { bold = true })
        vim.api.nvim_set_hl(0, "RenderMarkdownItalic", { italic = true })
        vim.api.nvim_set_hl(0, "RenderMarkdownUnderline", { underline = true })
        vim.api.nvim_set_hl(0, "RenderMarkdownStrikethrough", { strikethrough = true })

        -- 🔥 Fix italique/souligné bloqués par le thème
        vim.api.nvim_set_hl(0, "Italic", { italic = true })
        vim.api.nvim_set_hl(0, "Underline", { underline = true })

        vim.api.nvim_set_hl(0, "RenderMarkdownItalic", { link = "Italic" })
        vim.api.nvim_set_hl(0, "RenderMarkdownUnderline", { link = "Underline" })
    end
}
