local cmd = vim.cmd

cmd.packadd('packer.nvim')

-- source on updating file
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- setup executes before the plugin is loaded
-- config executes after the plugin is loaded
require('packer').startup(function(use)
  use({ 'wbthomason/packer.nvim', opt = true })

  -- colour theme
  use({
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require("catppuccin").setup({ flavour = "frappe" })
      vim.o.termguicolors = true
      vim.cmd.colorscheme('catppuccin-frappe')
    end
  })
  use({
    'navarasu/onedark.nvim'
  })

  -- bottom bar
  use({
    'vim-airline/vim-airline',
    requires = { 'ryanoasis/vim-devicons' },
    config = function()
      vim.g.airline_theme = 'catppuccin'
    end
  })

  -- sidebar
  use({
    'Xuyuanp/nerdtree-git-plugin',
    requires = {
      'preservim/nerdtree',
      requires = { 'ryanoasis/vim-devicons' }
    }
  })

  -- lsp
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground'
    }
  })

  -- completion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',                  -- source for text in buffer
      'hrsh7th/cmp-path',                    -- source for file system paths
      'hrsh7th/cmp-nvim-lsp-signature-help', -- emphasis selected parameter
      'l3mon4d3/luasnip',                    -- snippet engine
      'saadparwaiz1/cmp_luasnip',            -- for autocompletion
      'rafamadriz/friendly-snippets',        -- useful snippets
      'onsails/lspkind.nvim',                -- vs-code like pictograms
    }
  })

  -- neovim api
  use({ 'folke/neodev.nvim' })

  -- database completions
  use({
    'kristijanhusak/vim-dadbod-completion',
    requires = { 'tpope/vim-dadbod' }
  })

  use({
    'kristijanhusak/vim-dadbod-ui',
    requires = { 'tpope/vim-dadbod' }
  })

  -- language server manager
  use({
    'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim'
    }
  })

  -- nvim lsp configurations
  use({
    'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/cmp-nvim-lsp' -- nvim lsp completions
    }
  })

  -- lsp level linting
  use({
    'mfussenegger/nvim-lint'
  })

  -- java language server
  use({ 'mfussenegger/nvim-jdtls' })

  -- scala language server
  use({
    'scalameta/nvim-metals',
    requires = {
      'nvim-lua/plenary.nvim', -- lua functions
      'hrsh7th/nvim-cmp',      -- completion engine
      'hrsh7th/cmp-nvim-lsp',  -- neovim lsp
      'mfussenegger/nvim-dap'  -- neovim debugger
    },
  })

  -- treesitter based code comment hotkeys
  use({
    'numtostr/comment.nvim',
    config = function() require('Comment').setup() end
  })

  -- surrounding motion
  use({ 'tpope/vim-surround' })

  -- ultimate edit history tool
  use({ 'mbbill/undotree' })

  use({ 'vim-test/vim-test' })

  -- popup buffer hook
  use({ 'theprimeagen/harpoon' })

  -- popup fuzzy finder
  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  })

  -- style select and input hooks
  use({ 'stevearc/dressing.nvim' })

  -- popup error manager
  use({
    'folke/trouble.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  })

  -- helm chart syntax highlighting
  use({ 'towolf/vim-helm' })

  -- git
  use({
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  })

  -- notifications
  use({
    'j-hui/fidget.nvim',
    config = function() require('fidget').setup() end
  })

  -- note that this setup function requires uninstalling vimwiki, running packer compile
  -- reinstalling and rerunning packer compile to update :shrug:
  -- for note taking
  use {
    'vimwiki/vimwiki',
    setup = function()
      vim.g.vimwiki_list = {
        {
          path = '~/Personal/armadiki',
          syntax = 'markdown',
          ext = '.md',
          diary_rel_path = 'wiki/diary/',
          diary_index = 'diary',
          links_space_char = '-'
        }
      }
      vim.g.vimwiki_markdown_link_ext = 1
    end
  }
  -- install markdown preview without yarn or npm
  use({
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  })
  -- extend vimwiki with the zettel notetaking system
  use({
    'michal-h21/vim-zettel',
    branch = 'feature/subfolder',
    requires = {
      'vimwiki/vimwiki',
      'junegunn/fzf',
      'junegunn/fzf.vim'
    }
  })
end)
