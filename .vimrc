"pathgon
"execute pathogen#infect()
"syntax on
"filetype plugin indent on

" vim-plug
" automatically install vim-plug if it isn't be install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" load vim extension
call plug#begin('~/.vim/w')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'tpope/vim-fugitive',
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

" nerdcommenter
let g:NERDSpaceDelims = 1

" airline
"set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
set laststatus=2
set nocompatible
set encoding=utf-8
set termencoding=utf-8

"if !exists('g:airline_symbols')
" "let g:airline_symbols = {}
"endif
" enable beautiful arrow
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'solarized'
" let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" disable macro record
map q <Nop>

"set <leader>
let mapleader=";"

"ctags
set tags+=/usr/include/glibc.tags
set tags+=~/.vim/systags/include.tags
set tags+=tags;/
filetype on
filetype plugin on
filetype indent on
set completeopt=longest,menu
map <F4> :!ctags -R --c-kinds=+px<CR>
map <Leader>n :tnext<CR>
map <C-j> <C-]><CR>

"syntax theme
syntax on
syntax enable
au FileType c colorscheme desert
" color dracula
"au FileType python colorscheme Tomorrow-Night-Bright
"au FileType ruby colorscheme Tomorrow-Night-Bright
colorscheme desert
"set background=dark

"general
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set hls
set noeb
set expandtab
set incsearch

" rember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python'
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

"NERDTree
"let NERDTreeShowHidden=1
nmap <C-n> :NERDTreeToggle<CR>

"highlight current line
set cursorline
" set cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" au WinLeave * set nocursorline nocursorcolumn
" au WinEnter * set cursorline "cursorcolumn
"au FileType c set cursorcolumn
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white

"tagbar
nmap <Leader>t :TagbarToggle<CR>

"YouCompleteMe
" let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
nnoremap <Leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>i :YcmCompleter GoTo<CR>

"tab
"nmap <Leader>n :tabnext<CR><CR>
nmap <Leader>m :tabp<CR><CR>
nmap <leader>w :tabnew i

"auto-newline
"set textwidth=78

""refresh
"nmap <F5> :AirlineRefresh<CR><CR>:AirlineRefresh<CR><CR>
"Reload the .vimrc
nmap <F5> :so ~/.vimrc<CR>

"quite all & save all
nmap <Leader>q :q<CR>
nmap <Leader>w :wall<CR>
nmap <Leader>d :wq<CR>

"make all
"nmap <F9> :make<CR><CR><CR>:cw<CR><CR>
"nmap <F10> :make build<CR><CR><CR>:cw<CR><CR>
nmap <F9> :make<CR>:cw<CR>
nmap <C-c> :cclose<CR>

""cw exchange
"nmap <Leader>j <C-w>j
"nmap <leader>j <C-w>k

"back to shell
nmap <Leader>s :sh<CR>

"backup status
nmap <silent><F2> :mksession! 1.vim<cr>:wviminfo! 1.viminfo<cr>:qa<cr>

"restore status
nmap <silent><F3> :source ./1.vim<CR>:rviminfo 1.viminfo<CR>:AirlineRefresh<CR>:AirlineRefresh<CR>

"tablist
nmap <Leader>1 :tabn 1<cr>
nmap <Leader>2 :tabn 2<cr>
nmap <Leader>3 :tabn 3<cr>
nmap <Leader>4 :tabn 4<cr>
nmap <Leader>5 :tabn 5<cr>
nmap <Leader>6 :tabn 6<cr>
nmap <Leader>7 :tabn 7<cr>
nmap <Leader>8 :tabn 8<cr>

"close the tab
nmap <Leader>c :tabclose<cr>

"tabman
let g:tabman_toggle = '<Leader>mt'
let g:tabman_focus = '<Leader>mf'

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.o
let g:ctrlp_custom_ighore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ighore = {
	"\ 'dir': '\v[\/]\.(git|hg|svn)$',
	"\ 'file': '\v\.(exe|so|dll)$',
	"\ 'link': '',
	"\}
let g:ctrlp_working_path_mode = 'ra'

""autosave
"let g:auto_save = 1
"let g:auto_save_no_updatetime = 1
"let g:auto_save_in_insert_mod = 0
"let g:auto_save_silence = 1
"
"ignore mouse
set mouse-=a

"copy and paste to the clipboard
vmap <C-S-c> :"+y<CR>
nmap <Leader>p :put +<CR>
nmap <Leader>r :reg<CR>

"Tasklist
let g:tlTokenList = ["TODO", "NOTE"]
nnoremap <Leader>tl :TaskList<CR>

"a.vim
map <Leader>h :AV<CR>

"show the current function
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" grep current cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" grep content and show the result in a quick-fix window
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" vimrc takes effect automactically
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" vim indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
