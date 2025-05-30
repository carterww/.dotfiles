require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself
    "theprimeagen/harpoon",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- Required for telescope
    "alexghergh/nvim-tmux-navigation",
    "lervag/vimtex",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/nvim-treesitter-context",
    "neovim/nvim-lspconfig"
}
