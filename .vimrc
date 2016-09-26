""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STARTUP SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" recognize *.md as markdown files
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEHAVIOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable syntax processing
syntax enable

" disable swap file
set noswapfile

" enable mouse interactive
set mouse=a

" search ignore case by default
set ignorecase

" redraw only when we need to.
set lazyredraw

" search as characters are entered
set incsearch

" enable folding
set foldenable
" set fold method to `syntax`
set foldmethod=syntax
" only fold the first level
set foldnestmax=100 foldlevel=0
" auto fold for javascript
let javaScript_fold=1

if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISUAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight the column at the cursor
" set cursorcolumn

" highlight the 80th column as a ruler
set colorcolumn=80
hi ColorColumn ctermbg=grey

" style SignColumn
hi SignColumn ctermbg=white ctermfg=0A

" number of visual spaces per TAB
set tabstop=2
" number of spaces in tab when editing
set softtabstop=2
" tabs are spaces
set expandtab

" show line numbers
" set number

" show command in bottom bar
set showcmd

" show status bar by default
set laststatus=2

" visual autocomplete for command menu
set wildmenu

" highlight matching [{()}]
set showmatch

" highlight search matches
set hlsearch

" wrap text at the 80th column
set textwidth=80 wrapmargin=0

" decorate folds
hi Folded ctermbg=white cterm=standout

" set whitespace chars
set listchars=trail:·,tab:»\i
" display whitespaces
set list
" decorate whitespaces
highlight SpecialKey ctermfg=7 guifg=gray

" decorate foldtext
let &foldtext = "EightHeaderFolds( '\\=s:fullwidth-2', 'left', [ repeat( '  ', v:foldlevel - 1 ), '.', '' ], '\\= s:foldlines . \" lines\"', '' )"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'lilydjwg/colorizer'
Plug 'pangloss/vim-javascript'
Plug 'bimbalaszlo/vim-eightheader'

" Add plugins to &runtimepath
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" space to open/closes folds
nnoremap <space> zMzv

" <leader><space> to turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" <ctrl><w> to close the current tab
nnoremap <C-w> :q<CR>

" <ctrl><t> to open some file in a new tab
nnoremap <C-t> :tabedit 

" <ctrl><f> to search some text
nnoremap <C-f> :grep -F 

" allow saving of files as sudo
cmap w!! w !sudo tee > /dev/null %

" <ctrl><b> to toggle NERDTree
nnoremap <C-b> :NERDTreeToggle<CR>

" <ctrl><p> to fzf
nnoremap <C-p> :FZF<CR>

" <ctrl><jklh> to navigate to splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

