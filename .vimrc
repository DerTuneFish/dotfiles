"           #_--"""""--_#
"         #*             *#
"       #+           .----.+#
"     #.'           /-*-.  \'.#
"    #/            / _/..\  \ \#   =================================================
"   #:         _.--*'__-.*   * :#   _                     __ _     _            _
"   #|    _.- ' __     /  ____\|#  | |_ _   _ _ __   ___ / _(_)___| |__    __ _| |_
"   #|  <.     //\\   :_./    \|#  | __| | | | '_ \ / _ \ |_| / __| '_ \  / _` | __|
"   #|  __'>   \\//   : |      |#  | |_| |_| | | | |  __/  _| \__ \ | | || (_| | |_
"   #:  `.             \'     /:#   \__|\__,_|_| |_|\___|_| |_|___/_| |_(_)__,_|\__|
"    #\   `.            '.__.'/#   =================================================
"     #'.    `- _    _.-'   .'#
"       #+       '*-----___+#                        vim config
"        ##.             .##
"           #*--.....--*#

" Plugins
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tribela/vim-transparent'
Plug 'farmergreg/vim-lastplace'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'preservim/tagbar'
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
call plug#end()

" activate syntax highlighting
syntax on

" colorscheme
" colorscheme peachpuff

" set indent to 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" show absolute line numbers
set nu

" more intuitive split creation
set splitbelow
set splitright

" make vim search in subdirectories
set path+=**

" enables mouse suport
set mouse=a

" netrw settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 15
let g:netrw_altv = 1

function! NetrwMapping()
    noremap <buffer> ` <C-L>
endfunction

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

" set space as leader
nnoremap <SPACE> <Nop>
let mapleader = " "

" change split with <leader>+hjkl
map <leader>h :wincmd h<CR>
map <leader>j :bprev<CR>
map <leader>k :bnext<CR>
map <leader>l :wincmd l<CR>

" use arrow keys to resize buffers
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" use Ctrl-P to open file finder using fzf
" use Ctrl-B to open buffer finder using fzf
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>

