" (_)_ __ (_) |___   _(_)_ __ ___  
" | | '_ \| | __\ \ / / | '_ ` _ \ 
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__| \_/ |_|_| |_| |_|

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
"folding 
Plug 'pseewald/vim-anyfold'
Plug 'scrooloose/syntastic' 
Plug 'rhysd/vim-clang-format'
Plug 'townk/vim-autoclose'
Plug 'jiangmiao/auto-pairs'
"Plug 'Rip-Rip/clang_complete'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'vim-scripts/a.vim'

Plug 'dhruvasagar/vim-table-mode'

" Javascript
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Status bar on bottom
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" GraphQL highlight
"Plug 'jparise/vim-graphql'

" Themes
"Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

"icon in vim
"Plug 'ryanoasis/vim-devicons'
"Plug 'ryanoasis/vim-webdevicons'


call plug#end()

"source keyboard_layout.vim
set tabstop=4 shiftwidth=4
"autocmd Filetype json set tabstop=2 shiftwidth=2
set softtabstop=0 noexpandtab
set smarttab
set smartindent

"set timeout ttimeoutlen=100

set number 
set encoding=UTF-8
set fileencoding=utf-8

"set relativenumber
set hlsearch
set incsearch
set mouse=a
set ruler
set laststatus=0
set clipboard=unnamedplus
set linebreak
set bs=indent,eol,start
set completeopt=longest,menuone
set nolist listchars=tab:\|\ ,trail:·
"не продолжает ставить коментарии после enter 
set formatoptions-=ro 



let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

autocmd Filetype markdown set nowrap
autocmd Filetype markdown :TableModeEnable

"===== Preference =====
syntax on
colorscheme solarized8_flat
set termguicolors
set background=dark

"set guicursor=

"if !has('nvim')
"	set ttymouse=xterm2
"endif


"===== Folding =====
"autocmd Filetype * AnyFoldActivate
"let g:anyfold_fold_comments=1
"set foldlevel=99
"set foldmethod=syntax


"===== Encoding =====
if &encoding != 'utf-8'
	set encoding=utf-8
endif


"===== YouCompleteMe =====
"let g:ycm_auto_trigger=1
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_select_completion = ['<C-k>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<c-j>', '<up>']
"let g:ycm_global_ycm_extra_conf='~/.config/nvim/.ycm_extra_conf.py'

"===== Sintastic =====
let g:syntastic_cursor_column=1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ["cpp", "c"],'passive_filetypes': ["asm"] }

"===== Clang-Format =====
let g:clang_format#command='clang-format'
let g:clang_format#code_sttle="llvm"
let g:clang_format#style_options= {
			\ "UseTab" : "Always",
			\ "TabWidth" : 4,
			\ "IndentWidth" : 4, 
			\ "AccessModifierOffset" : -4,
			\ "AlignAfterOpenBracket" : "DontAlign",
            \ "AlignConsecutiveAssignments" : "false",
			\ "AlignConsecutiveDeclarations": "false",
			\ "DerivePointerAlignment" : "false",
			\ "PointerAlignment" : "Left",
			\ "AllowShortBlocksOnASingleLine" : "false",
			\ "AllowShortCaseLabelsOnASingleLine" : "true",
			\ "AllowShortFunctionsOnASingleLine" : "All",
			\ "AllowShortLoopsOnASingleLine" : "false",
			\ "AllowAllParametersOfDeclarationOnNextLine" : "false",
			\ "AllowAllArgumentsOnNextLine" : "false",
			\ "AlwaysBreakBeforeMultilineStrings" : "false",
			\ "AlwaysBreakAfterReturnType": "None",
			\ "MaxEmptyLinesToKeep" : 2,
			\ "SortUsingDeclarations" : "true",
			\ "BinPackArguments": "true",
			\ "BinPackParameters": "true", }

inoremap <C-f> <Esc>:ClangFormat<CR>a
nnoremap <C-f> <Esc>:ClangFormat<CR>
"
""===== Clang-Complete =====
"let g:clang_complete_auto=0
"let g:clang_snippets = 1
"let g:clang_snippets_engine = 'ultisnips'
"let g:clang_library_path="/usr/lib/libclang.so"
"
"inoremap <expr> <C-Space> "\<C-x>\<C-u>"

"===== UltiSnips =====
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsUsePythonVersion=3

"===== Auto-Pairs =====
let g:AutoPairsMapCR=0
imap <silent><CR> <CR><Plug>AutoPairsReturn

"===== A =====
nnoremap <F4> :A<CR>
inoremap <F4> <ESC>:A<CR>
nnoremap <F2> :IH<CR>
inoremap <F2> <ESC>:IH<CR>


"===== Binding =====
map <C-o> :NERDTreeToggle<CR>

nmap <M-h> :wincmd h<CR>
nmap <M-j> :wincmd j<CR>
nmap <M-k> :wincmd k<CR>
nmap <M-l> :wincmd l<CR>

"to end of line in INSERT mode
imap <M-i> <ESC>A
"quite 
map <M-q> <ESC>:q<CR>

map <C-h> <ESC>:tabprevious<CR>
map <C-l> <ESC>:tabnext<CR>

"===== Russian =====
let g:XkbSwitchLib = "/usr/lib/libxkbswitch.so"
let g:current_lang = libcall(g:XkbSwitchLib, 'Xkb_Switch_getXkbLayout', '')
let g:prev_lang = g:current_lang

function Leave()
	let g:prev_lang = libcall(g:XkbSwitchLib, 'Xkb_Switch_getXkbLayout', '')
	call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', 'us')

endfunction

autocmd InsertEnter * call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', g:prev_lang)
autocmd InsertLeave * call Leave()

