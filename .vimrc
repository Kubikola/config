let plugins_path = has('win32') ? 'C:\Users\jakub\.vim' : '/home/jakub/.vim'


set guifont=Source\ Code\ Pro:h11

packadd minpac
call minpac#init({'dir': plugins_path})
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tomasiser/vim-code-dark')
call minpac#add('neovimhaskell/haskell-vim')
call minpac#add('adimit/vim-prolog')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-commentary')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('machakann/vim-highlightedyank')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()

"enable vsc colorscheme
colorscheme codedark

".pl is prolog for me
let g:filetype_pl="prolog"

"turn off caching in ctrlp
let g:ctrlp_use_caching = 0

" Clear highlighting on enter in normal mode:
nnoremap <CR> :noh<CR>

"leader+so loads vimrc
nmap <leader>so :source $MYVIMRC<CR>

"leader+vi opens vimrc
nmap <leader>vi :tabedit ~/.vimrc<CR>

"buffer switch shortcut
"https://vi.stackexchange.com/questions/2129/fastest-way-to-switch-to-a-buffer-in-vim
nnoremap <leader>b :ls<CR>:b<Space>

"moving through virtual lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^

"delete one line of wrapped line
nnoremap gdd g^dg$g^
nnoremap gD g^dg$g^

"sane append and insert behaviour with virtual lines
nnoremap <expr> A v:count ? 'A' : 'g$a'
nnoremap <expr> I v:count ? 'I' : 'g^i'

"line numbering
set number
set relativenumber

"tab is 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

"write on buffer swap
set autowrite

"keep at least 4 lines below cursor
set scrolloff=4

"escape from help files just by using q
autocmd Filetype help nmap <buffer> q :q<CR>

"visual mouse
set mouse=a

"dont want dissapearing buffers
set hidden

"use system clipboard as default
"set clipboard+=unnamedplus

"escape gets you out of terminal mode
tnoremap <esc> <C-\><C-n>
tnoremap <A-[> <esc>

"mapping for moving between windows
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"my preffered encodings
set fileencodings=ucs-bom,utf8,default,cp1250,iso8859-2,latin1

"spellcheck
set spelllang=en_us,cs

"enable spellcheck for certain file types
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead .vimrc setlocal spell

"spellcheck autocompletion
set complete+=kspell

"only necessary for plain vim
if !has('nvim')
    if has('win32')
        language messages English_United States
    endif
    set langmenu=en_US.UTF-8
    set nocompatible
    filetype plugin indent on
    set hls
    set is
    syntax on
    set backupdir=~/.vim/backup//
    set directory=~/.vim/swap//
    set undodir=~/.vim/undo//
    set backspace=indent,eol,start
    set lazyredraw
    map y <Plug>(highlightedyank)

"only neovim compatible/necessary
else
    "substitute split window
    set inccommand=split

    "make terminal cursor visible
	hi! link TermCursor Cursor
    hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=242 guibg=#93a1a1 cterm=NONE gui=NONE

    "terminal insert paste
    tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
endif