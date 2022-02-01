call plug#begin('~/.config/nvim/plugged')

" -- LSP & Syntax -----------------
Plug 'rescript-lang/vim-rescript', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'alvan/vim-closetag'
Plug 'dense-analysis/ale'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
" ---------------------------------

" -- Nvim tree --------------------
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
" ---------------------------------

" -- Telescope & Navigation --------
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/bufferline.nvim'
" ----------------------------------

" -- Themes ------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'       
Plug 'joshdick/onedark.vim' 
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'ayu-theme/ayu-vim'
" ----------------------------------

" -- General Plugins ---------------
Plug 'junegunn/seoul256.vim'
Plug 'sheerun/vim-polyglot'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'mhinz/vim-mix-format'
Plug 'slashmili/alchemist.vim' 
Plug 'neomake/neomake'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'yuttie/comfortable-motion.vim'
Plug 'terrortylor/nvim-comment'
Plug 'andymass/vim-matchup'
Plug 'windwp/nvim-autopairs'
Plug 'famiu/bufdelete.nvim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }
Plug 'leafgarland/typescript-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'shime/vim-livedown'
Plug 'elixir-editors/vim-elixir'
Plug 'raichoo/haskell-vim'
Plug 'junegunn/vim-easy-align'
" ----------------------------------

call plug#end()

" -- Themes and Colors ----------------
set t_Co=256
set termguicolors
set background=dark

" Dracula
" let g:dracula_colorterm = 0
" let g:dracula_italic = 0
" colorscheme dracula
" let g:airline_theme='dracula'

" Palenight 
" colorscheme palenight
" let g:airline_theme='palenight'

" OceanicNext 
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" Gruvbox
" colorscheme gruvbox
" let g:airline_theme='gruvbox'

" Iceberg
" colorscheme iceberg
" let g:airline_theme='iceberg'

" Ayu  
" colorscheme ayu 
" let g:airline_theme='ayu'

" -------------------------------------------------

" -- Highlight line number ------------------------
 set cursorline
 au InsertEnter * highlight CursorLine ctermfg=none ctermbg=none cterm=none guifg=none guibg=none gui=none
" -------------------------------------------------

" -- nvim-web-devicons ----------------------------
lua << EOF
require('nvim_comment').setup()
require('nvim-autopairs').setup{}
require("nvim-web-devicons").set_icon {
  res = {
    icon = "λ",
    color = "#e6484f",
    name = "rescript"
  }
}

EOF
" -------------------------------------------------

" -- buffeliner.nvim ------------------------------
lua << EOF
require("bufferline").setup{
  options = {
    separator_style = 'thin',
    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
}
EOF
" -------------------------------------------------

" -- nvim.tree config -----------------------------
lua << EOF
local g = vim.g
g.nvim_tree_special_files = { } 

g.nvim_tree_add_trailing = 0
g.nvim_tree_git_hl = git_status
g.nvim_tree_quit_on_open = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "",
      untracked = "",
   },
   folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}

g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/", string.rep(" ", 1000), "?:gs?^??" }

require'nvim-tree'.setup {
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   auto_close = false,
   open_on_tab = true,
   hijack_cursor = true,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = true,
   },
   view = {
      allow_resize = true,
      side = "left",
      width = 32,
   },
}

EOF
" -------------------------------------------------

" -- Commands -------------------------------------
function! DisableST()
  return "%#NonText#"
endfunction
au BufEnter NvimTree setlocal statusline=%!DisableST()

command! -nargs=0 FormatFiles :CocCommand  prettier.formatFile eslint.executeAutofix
au VimEnter * NvimTreeFocus

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

"-- Discord --------------------------------------

let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_client_id           = "793271441293967371"
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 0
let g:presence_blacklist           = []
let g:presence_buttons             = 1

" Rich Presence text options
let g:presence_editing_text        = "Editing %s"
let g:presence_file_explorer_text  = "Browsing %s"
let g:presence_git_commit_text     = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Reading %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"

" -------------------------------------------------


" -- Shortcuts ------------------------------------
autocmd FileType rescript nnoremap <silent> <buffer> gd :RescriptJumpToDefinition<CR>
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> <c-s> :w <cr>
nnoremap <silent> <c-k> :m +1 <cr>
nnoremap <silent> <c-j> :m -2 <cr>
nnoremap <silent> <c-l> :nohl <cr>
nnoremap <silent> <s-Up> 5k <cr>
nnoremap <silent> <s-Down> 5j <cr>
nnoremap <silent> <c-p> :Telescope find_files <cr>
nnoremap <silent> <c-o> :Telescope live_grep  <cr>
nnoremap <silent> td :bdelete <cr>
nnoremap <silent> nn :BufferLineCyclePrev <cr>
nnoremap <silent> mm :BufferLineCycleNext <cr>
nnoremap <silent> <c-i> :NvimTreeToggle <cr>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" -------------------------------------------------
" Function to show diagnostics auto

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(5, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "/.config/nvim/ultisnips"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips"]

" -------------------------------------------------

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list:

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"--------------------------------------------------

" -- Fonts & Icons --------------------------------
set encoding=utf8
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline_symbols.notexists = ' ✗'
" -------------------------------------------------

" -- Telescope ignore node_modules ----------------
lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } } 
EOF

" -------------------------------------------------


" -- Files & Folders ------------------------------
set wildignore+=*_esy/*,*esy.lock/*,*/node_modules/*,*.reast,*.cmj,*.d,*.cmt,*.cmi,*.bs.js
" -------------------------------------------------

" -- Typos ----------------------------------------
iabbrev lenght length
iabbrev widht width
iabbrev heigth height
iabbrev discipline discipline
" -------------------------------------------------

" -- Copy in WSL ----------------------------------
let g:clipboard = {
                \   'name': 'WslClipboard',
                \   'copy': {
                \      '+': 'clip.exe',
                \      '*': 'clip.exe',
                \    },
                \   'paste': {
                \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \   },
                \   'cache_enabled': 0,
                \ }
" -------------------------------------------------


syntax on
set nowrap
let g:user_emmet_leader_key=','
set foldmethod=syntax
set nofoldenable
set mouse=a
set completeopt+=preview
set expandtab
set tabstop=4
set softtabstop=4
set number
set ignorecase
