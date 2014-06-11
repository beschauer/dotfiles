execute pathogen#infect()

" default tab/indentation
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

" default search behaviour
set ignorecase
set smartcase
set incsearch
set hlsearch

" no backup and swap files, tyvm
set nobackup
set noswapfile

" override sensible.vim
set list
let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,nbsp:\u00b7"

" please!
set clipboard=unnamed

" required for textobj-user-ruby
runtime macros/matchit.vim

" ctrlp.vim
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](\.git)$', 'file': '\v\.swp$' }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = 'tr'

" see https://gist.github.com/1610859
let g:ctrlp_status_func = {
  \ 'main': 'CtrlP_Statusline_Main',
  \ 'prog': 'CtrlP_Statusline_Progress'
  \ }

function! CtrlP_Statusline_Main(...)
  return ''
endf

function! CtrlP_Statusline_Progress(...)
  let len = '%#Function# '.a:1.' %*'
  let dir = ' %=%<%#LineNr# '.getcwd().' %*'
  retu len.dir
endf

" solarized theme
syntax enable
set t_Co=265
set background=dark
" use folowing line only if terminal is not set to colors of solarize
"let g:solarized_termcolors=256 
colorscheme solarized

" less screaming highlighting for matching parenthesis
hi MatchParen term=underline
hi MatchParen cterm=underline
hi MatchParen gui=underline guifg=fg guibg=bg

" various stuff
set wildmenu
set wildmode=list:longest
set wildignore+=*.swp,.DS_Store
set visualbell
set number
set nowrap

" word completion with shift-tab
imap <S-Tab> <C-N>

" make Y consistend with C and D
nnoremap Y y$

" yeah, I learn the hard way
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" this is a setting from Fritz. I don't know why I would want to hit F1 instead of Esc
"" remap F1 key to Esc
"map <F1> <Esc>
"imap <F1> <Esc>

" move linewise
nmap j gj
nmap k gk

" always getting these wrong ...
cmap Q q
cmap W w

" " syntastic options
" " let g:syntastic_ruby_checkers = ['mri']
" " let g:syntastic_ruby_mri_exec = '~/.rbenv/shims/ruby'
" " let g:syntastic_debug = 1
" " let g:syntastic_debug_file = '~/syntastic.log'
" let g:syntastic_check_on_open = 1

" " syntastic signs and colors
" let g:syntastic_error_symbol = 'e'
" let g:syntastic_warning_symbol = 'w'
" let g:syntastic_style_error_symbol = 's'
" let g:syntastic_style_warning_symbol = 's'
" highlight SyntasticErrorSign guifg=#ac4241 guibg=#202020 ctermfg=01 ctermbg=10
" highlight SyntasticWarningSign guifg=#d28445 guibg=#202020 ctermfg=03 ctermbg=10
" highlight link SyntasticStyleErrorSign SyntasticErrorSign
" highlight link SyntasticStyleWarningSign SyntasticWarningSign

" " vim-gitgutter
" let g:gitgutter_realtime = 1
" let g:gitgutter_sign_column_always = 1
" autocmd BufReadPre * let g:gitgutter_enabled = 1
" autocmd BufReadPre *.log let g:gitgutter_enabled = 0

" code folding
set foldmethod=indent
autocmd BufReadPre *.rb set foldmethod=syntax
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

nnoremap <Space> za

" set font
if has("gui_macvim")
  set showtabline=2
  set guifont=Menlo:h15
endif
