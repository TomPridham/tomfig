set background=dark
syntax on
set nu
set visualbell
set noeb vb t_vb=
set shiftwidth=2
set expandtab
set tabstop=2
set nobackup
set nowritebackup
set noswapfile
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \}
Plug 'FooSoft/vim-argwrap'                                        " wrap things in blocks/list
Plug 'Quramy/tsuquyomi'                                           " typescript completion
Plug 'ajh17/VimCompletesMe'                                       " tab completion
Plug 'bounceme/poppy.vim'                                         " rainbow parens
Plug 'bronson/vim-trailing-whitespace'                            " highlight trailing whitespace
Plug 'chaoren/vim-wordmotion'                                     " better word jumping, camelCase, snake_case, etc.
Plug 'drewtempelmeyer/palenight.vim'                              " theme
Plug 'leafgarland/typescript-vim'                                 " typescript support
Plug 'editorconfig/editorconfig-vim'                              " respect editor config
Plug 'gorodinskiy/vim-coloresque'                                 " highlight colors
Plug 'itchyny/lightline.vim'                                      " colored status
Plug 'jiangmiao/auto-pairs'                                       " auto insert pairs of things
Plug 'moll/vim-node'                                              " enchance vim for node (for example, better gf)
Plug 'othree/csscomplete.vim'                                     " better css completion
Plug 'othree/javascript-libraries-syntax.vim'                     " more js syn
Plug 'othree/yajs.vim'                                            " some js syntax
Plug 'plasticboy/vim-markdown'                                    " better markdown features
Plug 'racer-rust/vim-racer'                                       " rust code completion and navigation
Plug 'ron-rs/ron.vim'                                             " .ron support
Plug 'rust-lang/rust.vim'                                         " rust support
Plug 'scrooloose/nerdcommenter'                                   " comment things
Plug 'tpope/vim-surround'                                         " surround things
Plug 'vim-scripts/paredit.vim'                                    " balance parens
Plug 'vim-scripts/syntaxcomplete'                                 " syntax completion
Plug 'w0rp/ale'                                                   " linting
call plug#end()


filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
set softtabstop=2
set smartindent
set smarttab
set autoindent
set laststatus=2
set hidden
set clipboard^=unnamed,unnamedplus

" tabs
nnoremap > >>
nnoremap < <<
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

let g:rustfmt_autosave = 1
let g:rustfmt_command = "cargo fmt --"
let g:rustfmt_emit_files = 1
let g:rustfmt_command = 'rustfmt'
let g:rustfmt_options = ''
let g:ale_linters = {
  \ 'rust': ['cargo'],
  \ 'javascript': ['eslint'],
  \ 'jsx': ['eslint']
  \ }
let g:ale_rust_cargo_use_check = 1
let g:tsuquyomi_disable_quickfix = 1
let g:racer_cmd = "/home/tom/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:lightline = {
      \ 'colorscheme': 'palenight',
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

" abbrs
cnoreabbrev color ColorToggle
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev E e
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev X x
cnoreabbrev stu sort u
cnoreabbrev Stu sort u
cnoreabbrev Set set
cnoreabbrev Bd bd
inoreabbr lmbd λ

" vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = [
      \'bash=Shell',
      \'console=Shell',
      \'css=CSS',
      \'html=HTML',
      \'javascript=JavaScript',
      \'js=JavaScript',
      \'jsx=JSX',
      \'less=CSS',
      \'sass=CSS',
      \'scss=CSS',
      \'sh=Shell'
      \]
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_folding_disabled = 1

let g:csstoinline_wrap_pixels = 1

" javascript-libraries-syntax config
let g:used_javascript_libs = 'jquery,underscore,react,jasmine,ramda,tape'

" highlight the 121st column of wide lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%121v', 100)

" argwrap
let g:argwrap_padded_braces = '[{'
let g:argwrap_tail_comma_braces = '[{'
nnoremap <silent> <leader>a :ArgWrap<CR>

" match angle brackest
set matchpairs+=<:>


set hlsearch
set incsearch
set ignorecase
set smartcase
highlight clear Search
highlight       Search    ctermfg=White
" Clean search (highlight)
nnoremap <silent> <leader>/ :noh<cr>
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

let mapleader="\<Space>"
" nerdcommenter
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" show tabs
set list lcs=tab:\|\
