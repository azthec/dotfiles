local cmd = vim.cmd

cmd.packadd('packer.nvim')

-- setup executes before the plugin is loaded
-- config executes after the plugin is loaded
require('packer').startup(function(use)
  use({ 'wbthomason/packer.nvim', opt = true })

  -- colour theme
  use({
    'arcticicestudio/nord-vim',
    config = function()
      vim.cmd.colorscheme('nord')
    end
  })

  -- bottom bar
  use({
    'vim-airline/vim-airline',
    requires = { 'ryanoasis/vim-devicons' }
  })

  -- sidebar
  use({
    'Xuyuanp/nerdtree-git-plugin',
    requires = { 'preservim/nerdtree',
      requires = { 'ryanoasis/vim-devicons' }
    }
  })

  -- lsp
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP installer
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'l3mon4d3/luasnip'},
    }
  }

  -- java
  use({ 'mfussenegger/nvim-jdtls' })

  -- scala
  use({
    'scalameta/nvim-metals',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
  })

  -- ultimate edit history tool
  use({ 'mbbill/undotree' })

  -- trying this out for now, might go into a manual dap config once I have time
  use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }

  -- popup fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- popup error manager
  use {
    'folke/trouble.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- helm chart syntax highlighting
  use {
    'towolf/vim-helm'
  }

  -- note that this setup function requires uninstalling vimwiki, running packer compile
  -- reinstalling and rerunning packer compile to update :shrug:
  -- for note taking
  use {
    'vimwiki/vimwiki',
    setup = function()
      vim.g.vimwiki_list = {
        {
          path = '~/Documents/Armadiki',
          syntax = 'markdown',
          ext = '.md',
          diary_rel_path = 'wiki/diary/',
          diary_index = 'Diary'
        }
      }
   end
  }
  -- install markdown preview without yarn or npm
  use({
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn['mkdp#util#install']() end,
  })
  -- extend vimwiki with the zettel notetaking system
  use({
    -- 'michal-h21/vim-zettel',
    'ferdinandyb/vim-zettel',
    branch = 'feature/subfolder',
    requires = {
      'vimwiki/vimwiki',
      'junegunn/fzf',
      'junegunn/fzf.vim'
    }
  })
end)

