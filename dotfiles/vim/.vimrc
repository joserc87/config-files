" VIM CONFIGURATION
"
" José Ramón Cano Yribarren
" joserc87@gmail.com
"
" This configuration file is released under the GPL terms
" This vim configuration file was written based on my
" own preferences, but hoping that you can find useful
" stuff to create your own. ;)

" Remove the scroll bars:
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Enable per-project .vimrc's
" UNSAFE
" set exrc

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" TABS:
" -----
" In a codebase that uses 4 space characters for each indent:
" set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" In a codebase that uses a single tab character that appears 4-spaces wide
" for each indent:

" 4 spaces instead of a tab
set tabstop=4 shiftwidth=4 expandtab

" PLUGINS:
" --------
" The folowing file contains all the plugins
source ~/.vim/plugins.vim
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Solarized colors
 
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" NORMAL SETTINGS:
" ---------------
" Reload files automatically:
set autoread
" Set any *.md file to Markdown by default
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" To enable fenced code block syntax highlighting
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Smarter tab line for airline:
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"
" Dont write backup files
set nobackup
set noswapfile

" Open new split panes to right and bottom, which feels more natural than
" Vim's default
set splitbelow
set splitright

"  Relative line numbers
set rnu

syntax on

" COLOR SCHEMES:
" -------------

" colorscheme candystripe
" colorscheme kolor
" colorscheme predawn

set background=dark    " Setting dark mode
"colorscheme gruvbox
colorscheme solarized

" MAPPINGS:
" --------
" Set the leader to -
:let mapleader = ","
nmap <space> <leader>
nmap <space><space> <leader><leader>

" TAGBAR:
nmap <F8> ;TagbarToggle<CR>

" NERDTree:
nmap <leader>ne ;NERDTreeFocus<CR>

" jj goes to normal mode
inoremap jj <ESC>

" WINDOW NAVIGATION:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map ctrlp
let g:ctrlp_map = '<c-p>'
" Make ctrlp find dotfiles too
let g:ctrlp_show_hidden = 1
" List the buffers with CtrlP
nmap <leader>bb ;CtrlPMRU<CR>

nmap <silent> <A-Up> ;wincmd k<CR>
nmap <silent> <A-Down> ;wincmd j<CR>
nmap <silent> <A-Left> ;wincmd h<CR>
nmap <silent> <A-Right> ;wincmd l<CR>

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces ;tabnew which I used to bind to this mapping
" This would be incompatible with testing
"nmap <leader>T ;enew<cr>

" Buffer operations:
nmap <leader>bl ;bnext<CR>
nmap <leader>bh ;bprevious<CR>
nmap <leader>bq ;bp <BAR> bd #<CR>

" Show all open buffers and their status
"nmap <leader>bl ;ls<CR>

" Tab movement
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

" EASY MOTION:
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" For navigation \s{char}{label}
map <leader>s <Plug>(easymotion-s)
" OR for \s{char}{char}{label}
" map <leader>s <Plug>(easymotion-s2)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" EASY ALIGN:
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Map ; to : so we don't have to press shift
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Because we enable external .vimrc's, we prevent :autocmd, shell and write
" commands being run inside project-specific .vimrc unless they are owned by
" me
" set secure

" This enables customizing the vimrc on the fly
" Idea taken from: http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
" Source the vimrc file after saving it
if has ("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

" nmap <leader>v :tabedit $MYVIMRC<CR>
" Actually it would be better in vertical split
 nmap <leader>v ;vsplit $MYVIMRC<CR>

" Useful fugitive configurations:
if has ("autocmd")
	" Autodelete fugitive buffers
	autocmd BufReadPost fugitive://* set bufhidden=delete
endif
