" ------------------------------------
" Set leader to be space
" ------------------------------------
let mapleader=" "

" ------------------------------------
" General configuration options
" ------------------------------------
set hlsearch
set incsearch
set number
set ruler
set autoindent
set smartindent
set nobackup
set nowritebackup
set noswapfile
set laststatus=2
set nocompatible
set autowrite  " Automatically :write before running commands
set autoread

" ------------------------------------
" Vim appearance
" ------------------------------------
syntax enable
set background=dark
if has("unix")
  " set term=screen-256color
  " set t_Co=256
  " let g:solarized_termcolors=256
  " colorscheme solarized
endif

" ------------------------------------
" Tabs / spacing
" ------------------------------------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=2

" ------------------------------------
" Open new split panes to right and bottom
" ------------------------------------
set splitbelow
set splitright

" ------------------------------------
" Show vertical line after the 80th column
" ------------------------------------
set textwidth=80
set colorcolumn=+400
set wrap linebreak nolist

" Disable use of arrow keys
" ------------------------------------
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" ------------------------------------
" Toggle NERDTree sidebar with <C-g>
" ------------------------------------
nnoremap <C-g> :NERDTreeToggle <ENTER> <CR>

" ------------------------------------
" <C-s> to save file
" ------------------------------------
inoremap <C-s> <esc>:w<CR>
nnoremap <C-s> :w<CR>

" ------------------------------------
" Mappings for NERDREE tabs
" ------------------------------------
noremap th :tabnext<CR>
noremap tl :tabprev<CR>
noremap tn :tabnew<CR>
map <Leader>h gT
map <Leader>l gt

" ------------------------------------
" Insert lines above and below cursor
" ------------------------------------
nnoremap <Leader>j m`o<Esc>``
nnoremap <Leader>k m`O<Esc>``

" ------------------------------------
" Select all the contents of file
" ------------------------------------
nnoremap <C-a> ggVG<CR>

" ------------------------------------
" Mappings for the RSpec.vim plugin
" ------------------------------------
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ------------------------------------
" Open Ctags generated list of variables & methods on right sidebar
" ------------------------------------
map <Leader>t :TlistToggle<CR>

" ------------------------------------
" Quicker window movement
" ------------------------------------
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ------------------------------------
" Syntastic configuration
" ------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']

" ------------------------------------
" Ultisnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" ------------------------------------

" Use <tab> to trigger emmet expansion
let g:user_emmet_install_global = 0
" autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key='<C-e>'

" ------------------------------------
" Turn spellchecker on for .gitcommit files
" ------------------------------------
autocmd Filetype gitcommit setlocal spell textwidth=72

" ------------------------------------
" Misc
" ------------------------------------
filetype plugin on
let Tlist_Use_Right_Window=1

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
