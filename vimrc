set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" BEGIN plugins

" Plugins from github.
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'fs111/pydoc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'taq/vim-git-branch-info'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'davidhalter/jedi-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'avakhov/vim-yaml'

" Exclude colorschemes from vundle, because I am using a custom blackboard
" colorcheme.
" Plugin 'flazz/vim-colorschemes'

" Better tasteful indentation.
Plugin 'hynek/vim-python-pep8-indent'

" Use kevinw/pyflakes-vim if only python is required.
Plugin 'scrooloose/syntastic'
" Disable this one possibly in favor of the other flake8 plugin.
" Plugin 'nvie/vim-flake8'

" The enhanced version
Plugin 'vim-scripts/python.vim--Vasiliev'

" Plugin from http://cscope.sourceforge.net/cscope_maps.vim, mirrored in
" github shown below.
Plugin 'simplyzhao/cscope_maps.vim'

" For http://www.vim.org/scripts/script.php?script_id=2771
Plugin 'pthrasher/conqueterm-vim'

" END plugins

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set enc=utf-8
set nocompatible
set backspace=indent,eol,start
set viminfo+=!
set hidden
set noswapfile
set vb t_vb=

syntax on
autocmd BufEnter * :syntax sync fromstart

colorscheme blackboard
set guifont="Monaco:h10"
set gfn=Monaco:h10

set nobackup
set nowritebackup

"filetype on
"filetype plugin on
"filetype plugin indent on

" Disabling this in favor of jedi-vim
" autocmd FileType python set complete+=k~/.vim/syntax/python.vim "isk+=.,(

set ruler
set guioptions-=T
set completeopt-=preview
set gcr=a:blinkon0

" We do not need to setnumber since I am now using Relative Numbering.
" RltvNmbr
set cmdheight=1

set laststatus=2
set statusline=[%l,%c\ %P%M]\ %f\ %r%h%w
if has("gui")
    set lines=60
    set number
endif

" git-branch-info.vim
set statusline+=%{GitBranchInfoString()}
let g:git_branch_status_head_current=1
let g:git_branch_status_nogit=""
let g:git_branch_status_text=""

" set smarttab
" set smartindent
" set expandtab
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
inoremap <Silent> <Tab> <C-R>=(col('.') > (matchend(getline('.'), '^\s*') + 1))?'<C-V><C-V><Tab>':'<Tab>'<CR>

" Key mappings
map <F11> :NERDTreeToggle<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>
map <F7> :bd<CR>:syntax on<CR>

" MiniBufExplorer.

let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" Mimic Ctab behavior
" If you like <C-TAB> and <C-S-TAB> to switch buffers
" in the current window then perform the remapping
"
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>
let g:miniBufExplModSelTarget = 1 

"##############################################################################
"" Easier split navigation                                                     
"##############################################################################
"
"" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Omni-complete should work with C-x C-o
" the lines below are just for extra help.
" Disabling this in favor of jedi-vim
" autocmd FileType python set omnifunc=pythoncomplete#Complete

let python_highlight_all = 1
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Use_Right_Window = 1

" Turn this on to highlight text over 'OverLength'
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')

" Flake8 run on save.
" autocmd BufWritePost *.py call Flake8()
"
" set splitbelow
" set splitright
"
let g:virtualenv_directory = '/Users/karthik_ramasubraman/.venv'

" Enable syntastic underlining
let g:syntastic_enable_highlighting = 1
"let g:syntastic_python_flake8_args = '--ignore=E121,E122,E123,E124,E125,E126,E127,E128,E711,E712,H233,H302,H303,H404,F403,F811,F841,N309'
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" NerdTREE settings
let NERDTreeIgnore=['\.o$', '\.pyc$']

" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 0

" tagbar settings for golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
