"pathgon
execute pathogen#infect()
syntax on
filetype plugin indent on

"airline
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
set laststatus=2
set nocompatible
set encoding=utf-8
set termencoding=utf-8

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme = 'light'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

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

"syntax theme
syntax on
syntax enable
au FileType c colorscheme desert
au FileType python colorscheme Tomorrow-Night-Bright
au FileType ruby colorscheme Tomorrow-Night-Bright

colorscheme desert
set background=dark

"general
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set hls
set noeb

"NERDTree
"let NERDTreeShowHidden=1
nmap <C-n> :NERDTreeToggle<CR>

"highlight current line
set cursorline
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
au FileType c set cursorcolumn
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white

"tagbar
nmap <Leader>t :TagbarToggle<CR>

"YouCompleteMe
"let g:ycm_global_ycm_extra_conf='~/.ycm_global_ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
let g:ycm_confirm_extra_conf=0
nnoremap <Leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>

"tab
nmap <Leader>n :tabnext<CR><CR>
nmap <Leader>m :tabp<CR><CR>
nmap <leader>w :tabnew i 

"auto-newline
set textwidth=78

"refresh
nmap <F5> :AirlineRefresh<CR><CR>:AirlineRefresh<CR><CR>

"quite all & save all
nmap <Leader>q :q<CR>
nmap <Leader>w :wall<CR>
nmap <Leader>d :wq<CR>

"make all
nmap <F9> :make<CR><CR><CR>:cw<CR><CR>
nmap <F10> :make build<CR><CR><CR>:cw<CR><CR>

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
