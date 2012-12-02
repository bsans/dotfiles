" pathogen
call pathogen#infect()
call pathogen#helptags()

" Ctrl-P
let g:ctrlp_map = '<c-p>'

" currently disabled by renaming out of pathogen
" Command-T
"map <D-t> ,t

" Solarized config settings
syntax enable
"set background=dark
set background=light
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized

" other basic config settings
let mapleader=","
syntax on
if has('gui_running')
  set guifont=Monaco:h12
endif
set laststatus=2
set colorcolumn=80
"set textwidth=80
"set number
" rnu for relative line numbers!
set rnu
nmap <F6> :set number<CR>
nmap <F5> :set rnu<CR>
set ruler
set lines=40 columns=80
set hls
set foldmethod=indent
set clipboard=unnamed
nmap W <ESC>:w<CR>
nmap <leader>v :vsplit<CR>
nmap <leader>i :split<CR>

" Mark plugin
map <leader>M <s-v><leader>m
nmap <leader>mc :MarkClear<CR>

" spellchecking
":set spell spelllang=en_us
nmap <leader>sp :set spell spelllang=en_us<CR>
nmap <leader>spo :set nospell<CR>

" turn on file type plugins (ftplugins), there are several in play
filetype on
filetype plugin on

" Pydiction
" fired by <leader><Tab> to not conflict with Supertab, but can then cycle using
" tab key and shift-tab
let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 15

" Jedi-vim
" to use buffers only, not tabs, in use of goto
let g:jedi#use_tabs_not_buffers = 0
"

" **********************
" Supertab
" **********************
" PYTHONPATH injection to make omnifunc work
function! SetPythonPath()
  let $base = '.'
  let $getaround_3_root = "/Users/Bodhi/getaround/getaround3"
  let $packages = '/opt/getaround/lib/python2.7/site-packages'
  let $gae = '/usr/local/google_appengine'
  let $PYTHONPATH = $base.':'.$getaround_3_root.':'.$packages.':'.$gae
endfunction
:call SetPythonPath()

" below is from a vim article..:
" http://sontek.net/turning-vim-into-a-modern-python-ide
" improved by studying and using :h SuperTab
au FileType python set omnifunc=pythoncomplete#Complete
" SuperTab first uses omnifunc, then keyword completion if that fails
" omnifunc really wants whatever you're looking for to be on your path!
"   and it really can only be on your path ONCE, else bug and fault death
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("context") |
  \ endif

"  \   call SuperTabSetDefaultCompletionType("<c-x><c-n>") |

" not currently using below, but it's a weak alternative to chaining used above
"let g:SuperTabContextDefaultCompletionType = ("<c-x><c-n>")

set completeopt=menuone,longest,preview
" enable automatic selection of the longest ('best') match
let g:SuperTabLongestHighlight='1'
" type extra chars to get better fuzzy matching
" turned this off on 5/21 because it had this issue where supertab would say no
" matches found if the first attempt in the chaining didn't work, but the second
" one would never fired until you hit another char..annoying UX
let g:SuperTabLongestEnhanced='1'
" Limit popup menu height
set pumheight=15
"***************
"end SuperTab
"**************

" Taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
map <leader>t :TlistToggle<CR>

" ctags (not a plugin, just general stuff)
" modify tags path to include g3root location, and give preference order
set tags=./tags,tags,/Users/Bodhi/getaround/getaround3/tags,/Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine/google/appengine/tags
map <leader>j <c-]>
" below "back" is to return to the file I was looking at after jumping to it
map <leader>b <c-T>
" regenerate tags file for absolute root of G3 project
nmap <F7> :!ctags -R --languages=python --python-kinds=-i /Users/Bodhi/getaround/getaround3<CR>

" TaskList
map <leader>td <Plug>TaskList

" Snipmate
" to prevent an apparent 'bug' when also using Supertab for completion
" From the David Halter fork of Snipmate:
" https://github.com/davidhalter/vim-snipmate.git
let g:snipMateAllowMatchingDot = 0
" add my custom snippets dir to runtime path
set rtp+=/Users/Bodhi/.vim/my_snippets

" Gundo
map <leader>u :GundoToggle<CR>

" Pep8
let g:pep8_map='<leader>8'

" powerline
let g:Powerline_symbols = 'fancy'

" Ack
nmap <leader>a <Esc>:Ack! 

" RopeVim
" I have yet to get Rope to work at all for me..
" So I mapped 'jump' <leader>j to do a ctags jump instead...
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>j :call RopeGotoDefinition()<CR>
"map <leader>r :RopeRename<CR>

" Vim-pasta
let g:pasta_enabled_filetypes = ['python', 'haml']

" window transparency
"set transparency=0

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set expandtab
set autoindent
set smartindent
set smarttab
"set winwidth=90
set equalalways
set ignorecase

" NerdTree
"au Bufnew *  NERDTree
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 40
let NERDTreeIgnore = ['\.pyc$']

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
    ''
    :endfunction

    set list listchars=trail:.,extends:>
    autocmd FileWritePre *.py :call TrimWhiteSpace()
    autocmd FileAppendPre *.py :call TrimWhiteSpace()
    autocmd FilterWritePre *.py :call TrimWhiteSpace()
    autocmd BufWritePre *.py :call TrimWhiteSpace()

"No leading whitespace for python files
map <leader>h :%s/[ ]*//g<cr>

"**************************************************
"********** Session Management stuff **************
"**************************************************
" from: http://vim.wikia.com/wiki/Go_away_and_come_back
" Creates a session
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:sessionfile = b:sessiondir . '/session.vim'
  exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe "mksession! " . b:sessionfile
    echo "updating session"
  endif
endfunction

" Loads a session if it exists
function! LoadSession()
  if argc() == 0
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
      exe 'source ' b:sessionfile
    else
      echo "No session loaded."
    endif
  else
    let b:sessionfile = ""
    let b:sessiondir = ""
  endif
endfunction

autocmd VimEnter * nested :call LoadSession()
au VimLeave * :call UpdateSession()
map <leader>s :call MakeSession()<CR>
