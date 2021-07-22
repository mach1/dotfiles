call plug#begin('~/.local/share/nvim/plugged')

Plug 'kchmck/vim-coffee-script'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'duggiefresh/vim-easydir'
Plug 'SirVer/ultisnips' | Plug 'mach1/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'kirstein/ctrlp-register'
Plug 'Lokaltog/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'schickling/vim-bufonly'
Plug 'heavenshell/vim-jsdoc'
Plug 'w0rp/ale'
Plug 'flowtype/vim-flow'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

call plug#end()

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

au FileType javascript syn match jsDecorator '@[a-zA-Z_][0-9a-zA-Z_$]*'
au FileType javascript hi link jsDecorator Function

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:LanguageClient_serverCommands = {
    \ 'reason': ['/absolute/path/to/reason-language-server.exe'],
    \ }

" enable autocomplete
let g:deoplete#enable_at_startup = 1

let g:ale_linters = {
  \ 'javascript': ['flow', 'prettier-eslint'],
  \ 'jsx': ['prettier-eslint'],
  \ 'typescript': ['tsserver'] }

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier-eslint']
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'

let g:molokai_original=1

let g:ctrlp_extensions = [ 'funky', 'register', 'line' ]

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = 'jmeter\|coverage\|target\|node_modules\|.DS_Store\|.git\'
let g:ctrlp_use_caching = 0

let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_smartcase = 1

let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="murmur"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:NERDTreeWinSize=40
let NERDTreeMapOpenVSplit ='<C-v>'

let g:prettier#exec_cmd_path = 'prettier-eslint'
set nocompatible
set t_Co=256
set background=dark
set autoread
set expandtab
set shiftwidth=2
set softtabstop=2
set encoding=utf-8
set noswapfile
set nobackup
set nowb
set number
set relativenumber
set hlsearch

colorscheme molokai

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

nnoremap /d :CtrlPCurWD<CR>
nnoremap /b :CtrlPBuffer<CR>
nnoremap /m :CtrlPMRU<CR>
nnoremap /f :CtrlPFunky<CR>
nnoremap /r :CtrlPRegister<CR>
nnoremap // :bd<CR>
nnoremap <C-w> :NERDTree<CR>

inoremap jj <esc>
nmap K :Ack "<C-R><C-W>"<CR>
vmap K y:<C-U>Ack '<C-R>"'<CR>'"'

imap <C-c> <CR><Esc>O

" clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

highlight nonText ctermbg=NONE

" Easymotion
map <Space> <Plug>(easymotion-s)
" JK motions: Line motions
map /j <Plug>(easymotion-j)
map /k <Plug>(easymotion-k)

" tabs
map gq :tabc<CR>

""""""""""""""""""""""""""""""""""""""""""
" => Plugin: Airline
""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set noshowmode

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set backspace=eol,start,indent
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
filetype plugin indent on
syntax on

set clipboard=unnamed
