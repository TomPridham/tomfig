let mapleader="\<Space>"

autocmd BufEnter * :syntax sync minlines=200
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd FileType markdown setlocal spell
autocmd FileType txt setlocal spell
au BufRead,BufNewFile *.ts set filetype=typescript
au BufRead,BufNewFile *.tsx set filetype=typescriptreact
filetype plugin indent on
set autoindent
set background=dark
set backspace=indent,eol,start
set clipboard=unnamed,unnamedplus
set cmdheight=2
set display+=lastline
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8
set hidden
set laststatus=2
set lazyredraw
set list lcs=tab:\|\
set nobackup
set noeb vb t_vb=
set noswapfile
set nowritebackup
set nu
set mouse=a
set shiftwidth=2
set shortmess+=c
set signcolumn=yes
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set updatetime=300
set visualbell
syntax on

" abbrs
cnoreabbrev Bd bd
cnoreabbrev E e
cnoreabbrev EX Ex
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Qall qall
cnoreabbrev Qall! qall!
cnoreabbrev Set set
cnoreabbrev Sort sort
cnoreabbrev Stu sort u
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev WQ wq
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev X x
cnoreabbrev ex Ex
cnoreabbrev sss syntax sync fromstart
cnoreabbrev Sss syntax sync fromstart
cnoreabbrev stu sort u
cnoreabbrev wQ wq

nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" spacing
nnoremap > >>
nnoremap < <<

" match angle brackest
set matchpairs+=<:>

" search settings
set hlsearch
set incsearch
set ignorecase
set smartcase
highlight clear Search
highlight       Search    ctermfg=White

" blink the line containing the match
fu! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 250) . 'm'
  set invcursorline
  redraw
endfu

" highlight matches when jumping to next
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" load vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \}
Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " code completion
Plug 'luochen1990/rainbow'                                        " rainbow parens
Plug 'bronson/vim-trailing-whitespace'                            " highlight trailing whitespace
Plug 'chaoren/vim-wordmotion'                                     " better word jumping, camelCase, snake_case, etc.
Plug 'drewtempelmeyer/palenight.vim'                              " theme
Plug 'editorconfig/editorconfig-vim'                              " respect editor config
Plug 'ap/vim-css-color'                                           " highlight colors
Plug 'itchyny/lightline.vim'                                      " colored status
Plug 'jiangmiao/auto-pairs'                                       " auto insert pairs of things
Plug 'scrooloose/nerdcommenter'                                   " comment things
Plug 'vim-scripts/paredit.vim'                                    " balance parens
Plug 'vim-scripts/syntaxcomplete'                                 " syntax completion
Plug 'quramy/vim-js-pretty-template'                              " pretty template strings
Plug 'sheerun/vim-polyglot'                                       " polyglot lang highlighting, etc
Plug 'rust-lang/rust.vim'                                         " rust syntax stuff
Plug 'github/copilot.vim'                                         " copilot
call plug#end()

" github copilot
let g:copilot_filetypes = {
      \ 'txt': v:false,
      \ }

" rainbow parens
let g:rainbow_active = 1

" rust settings
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_command = 'rustup run nightly rustfmt'

" prettier settings
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" coc-coverage function
function! LightlineCocCoverageStatus() abort
  let status = get(g:, 'coc_coverage_lines_pct', '')
  if empty(status)
    return ''
  endif

  return '☂ ' . status . '% Lines Covered'
endfunction

function! LightlineCocLcovStatus() abort
  let status = get(g:, 'coc_lcov_lines_pct', '')
  if empty(status)
    return ''
  endif

  return '☂ ' . status . '% Lines Covered'
endfunction

" lightline/theme settings
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ],
      \   'right':[
      \     [ 'coccoverage', 'coclcov', 'lineinfo', 'percent', 'cocstatus' ],
      \     [ 'cocapollo' ]
      \   ],
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'coccoverage': 'LightlineCocCoverageStatus',
      \   'coclcov': 'LightlineCocLcovStatus'
      \ },
      \ }
colorscheme palenight
set notermguicolors
if (has("termguicolors"))
  set termguicolors
endif

" use more colors if they are available
if !has('gui-running')
  set t_Co=256
endif

" highlight the 121st column of wide lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%121v', 100)

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" CoC
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

