" ---- Armno's .vimrc ----
" collection (and probably stolen ones) of vim configuration
"
" required:
" 	- vundle: for managing plugins
" 	- the silver searcher: (way) faster search (used with CtrlP)
"
" 		use `brew` to install silver searcher
"
" 		```sh
" 		$ brew install the_silver_searcher
" 		```
"
" 		then install vundle
"
" 		```sh
" 		$ cd dotfiles
" 		$ git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle
" 		```
"

" set shell=/bin/zsh
" meh
set nocompatible

" vundle-required config
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'dracula/vim'
                                         " ----- plugins to be installed via vundle -----
Plugin 'scrooloose/nerdtree'             " display directories and files list
Plugin 'tpope/vim-surround'              " easily manipulate surrounding tags/characters

" Plugin 'Valloric/YouCompleteMe'

Plugin 'maksimr/vim-jsbeautify'
" Plugin 'einars/js-beautify'

Plugin 'Yggdroot/indentLine'

Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/syntastic' "for EsLint 
Plugin 'millermedeiros/vim-esformatter' "for EsFormatter

call vundle#end()            " required
" don't let vundle mess with indentation / folding for markdown files
filetype plugin on

" ----- look and feel ----- "
syntax on                       " enable syntax highlighting
set background=dark             " use dark background to reduce tears level
set t_Co=256                    " enable 256-color mode
let base16colorspace=256
colorscheme Tomorrow-Night
" color dracula
set ruler                       " show ruler (vim-airline will take care of this anyway)
set number                      " show line numbers
set title                       " show file name in title bar
set hlsearch                    " highlight search researchs
set showbreak=↪                 " display this character for line break
set linespace=3                 " spaces between lines
set cursorline                  " highlight current line where the cursor is at
set scrolloff=5                 " number of lines to keep from the edge when scrolling
if has('statusline')
  set laststatus=2              " always show status line
endif
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set lcs=tab:⤑\ ,trail:·,eol:¬
set nolist
" ---- general settings ----
"set mouse=a                     " enable mouse support in console
set autoread                    " reload files when changed on disk
set clipboard=unnamed           " use the same clipboard with osx
set encoding=utf-8              " when in doubt, use utf-8
set nobackup                    " who needs backup?
set nowritebackup
set noswapfile                  " who needs swap files?
set binary                      " allow vim to edit binary files
set showcmd                     " show typing command (bottom right)
set visualbell                  " enable vim's visual bell instead of beeeeeep
set t_vb=                       " then visual bell does nothing. so no beeeeep
set ttyfast                     " fast terminal connection between terminal and vim
set ttyscroll=3
set lazyredraw

" ----- code editing -----
set tabstop=4                               " use 2 spaces for a tab
set shiftwidth=2                            " use 2 spaces for indent
set smartindent                             " be smart, even for indentation
set autoindent
set splitbelow                              " split window to the bottom and the right (for vsp) by default
set splitright
set backspace=indent,eol,start              " allow using backspace in insert mode
set ch=1
set noeol                                   " no empty newlines at the end of lines
set wildmenu                                " enable code completion in enhanced mode
set wildmode=list:longest                   " list all matched strings in autocomplete
set timeout timeoutlen=1000 ttimeoutlen=100 " fix delay when type `O` (capital o) in normal mode
set tags=./tags;/


" ----- key bindings -----
let mapleader=","
nnoremap ; :
imap <leader>e <esc>
nmap <leader>b :bn<CR>
nmap <leader>B :bp<CR>
nmap noh :nohl<CR>

" disable moving around with arrow keys in normal mode
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" put closing x the next line when hit enter
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

" enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ----- plugin-specific settings & key bindings ----- "

" nerdtree
" map <leader>d :NERDTreeToggle<CR>

" vim-trailingspace
nmap fx :FixWhitespace<CR>

map <c-f> :call JsBeautify()<cr>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" Vim
let g:indentLine_color_term = 239

"GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

let g:indentLine_enabled = 0

let g:html_indent_inctags = "html,body,head,tbody" 
  map <c-g> :call JsBeautify()<cr>
  " or
  autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  " for html
  autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  " for css or scss
  autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
set paste
" ----------------------------- Syntastic -----------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0 " show log 
let g:syntastic_auto_loc_list = 0 " show log 
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0  "check when write file if mode active
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_javascript_checkers = ['eslint']
map <C-l> :SyntasticCheck<cr>

" ----------------------------- EsFormatter -----------------------------

map <c-f> :Esformatter<cr>
autocmd FileType javascript noremap <buffer>  <c-g> :Esformatter<cr>



