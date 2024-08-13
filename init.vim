" Initialize vim-plug plugin manager
call plug#begin('~/.local/share/nvim/plugged')

" Nerdtree
Plug 'preservim/nerdtree'

" Plenary
Plug 'nvim-lua/plenary.nvim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" coc.nvim for autocompletion and code actions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Go support plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Autocompletion plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Treesitter for advanced syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" End plugin installation
call plug#end()

nnoremap <leader>ff :Telescope find_files<CR>

" Additional vim-go configurations
let g:go_fmt_command = "gofmt"
let g:go_gopls_enabled = 1

" vim-go settings
let g:go_fmt_command = "gopls"
let g:go_gopls_enabled = 1

" Set the custom theme
syntax enable
colorscheme magenta_cyan

" Show line numbers
set number
set relativenumber

" Indentation settings
set tabstop=4
set shiftwidth=4
set expandtab



" Enable mouse support
set mouse=a

" coc.nvim settings
let g:coc_global_extensions = ['coc-go']

" Treesitter configuration
lua << EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "go" },  -- Install Go parser
    highlight = {
      enable = true,              -- Enable syntax highlighting
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,              -- Enable indentation
    },
  }

  -- Custom syntax highlighting groups
  local set_highlight = vim.api.nvim_set_hl

  -- Set custom colors
  set_highlight(0, 'TSFunction', {fg='#66d9ef', bg='NONE', bold=true})  -- Cyan for functions, bold
  set_highlight(0, 'TSKeyword', {fg='#a6e22e', bg='NONE'})  -- Magenta for keywords
  set_highlight(0, 'TSString', {fg='#a6e22e', bg='NONE'})  -- Green for strings
  set_highlight(0, 'TSVariable', {fg='#f8f8f2', bg='NONE'})  -- Light gray for variables
  set_highlight(0, 'TSComment', {fg='#75715e', bg='NONE'})  -- Comments in a darker color
  set_highlight(0, 'TSConstant', {fg='#f8f8f2', bg='NONE'})  -- Light gray for constants
  set_highlight(0, 'TSNumber', { fg = '#a6e22e', bg = 'NONE', bold = true }) -- Magenta for numbers
  -- Add more custom highlight groups if needed
EOF
