require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself

    "neovim/nvim-lspconfig",

    "theprimeagen/harpoon",

    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- Required for telescope

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/nvim-treesitter-context",

    -- "github/copilot.vim", Trying w/o this for now

    "Mofiqul/dracula.nvim",
    { "rose-pine/neovim", as = "rose-pine" },

    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
    },

    -- lsp-zero Required packages
    "neovim/nvim-lspconfig",
    { "williamboman/mason.nvim", build = function() pcall(vim.cmd, "MasonUpdate") end },
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",

    "alexghergh/nvim-tmux-navigation",

    "lervag/vimtex"
}
