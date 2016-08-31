set number
set autochdir
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set nocompatible
set magic
set fillchars+=vert:█
color default

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Raimondi/delimitMate'
Plugin 'tbastos/vim-lua'
Plugin 'bling/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'morhetz/gruvbox'
Plugin 'haskell.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'floobits/floobits-neovim'

call vundle#end()

" General Config
filetype off
syntax on
set scrolloff=8
set synmaxcol=120

" Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "passive_filetypes": ['scss'] }
highlight SpellBad ctermbg=darkred guibg=darkred
highlight SpellCap ctermbg=darkred guibg=darkred

" NERDTree configuration
let NERDTreeShowHidden=1

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-o>"
let g:UltiSnipsJumpBackwardTrigger="<c-i>"

" Airline Config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Python Config
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_provider = '/usr/bin/python3'

" == Custom keybindings
let mapleader='m'
" map <C-t> :tabnew<CR>:Startify<CR>
map <C-w> :bd<CR>
map <C-x> :tabn<CR>
map <C-z> :tabp<CR>

" Split navigation
map <S-h> :wincmd h<CR>
map <S-j> :wincmd j<CR>
map <S-k> :wincmd k<CR>
map <S-l> :wincmd l<CR>
" I needed capital J for split movement
nmap w :join<CR>

" Capital U = redo
nmap <S-u> <C-r>

" Line-moving superpowers
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Life-changers
map <space> :
imap kj <ESC>
vmap vkj <ESC>

" Life-improvers
nmap - ^

" Highlight Killer
nnoremap <Leader>hl :nohl<CR>

" Disable Arrow keys in normal mode
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>

" Plugin and File Triggers
nnoremap <Leader>e :NERDTreeTabsToggle<CR>
nnoremap vimr :tabnew ~/.vimrc<CR>
nnoremap <Leader>xr :tabnew ~/.Xresources<CR>
nnoremap <Leader>tag :Tagbar<CR>:wincmd l<CR>

" Floobits
nmap mff :FlooFollowUser<CR>
nmap mft :FlooToggleFollowMode<CR>
nmap mfs :FlooSummon<CR>
nmap mfc :FlooSaySomething 
nmap mfj :FlooJoinWorkspace 
nmap mfl :FlooLeaveWorkspace<CR>

" Quick replace-all
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Color Scheme Modifications
set background=dark
let g:gruvbox_contrast_dark="soft"
colorscheme gruvbox
highlight LineNr ctermfg=darkgrey
highlight VertSplit ctermbg=black

