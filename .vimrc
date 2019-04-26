"-----------------------------------------------------------------------------
" Vundle Installer
"-----------------------------------------------------------------------------
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'shougo/neocomplete.vim'
Plugin 'lambdalisue/vim-pyenv'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Lokaltog/powerline'
Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
"
" Identify platform
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win16') || has('win32') || has('win64'))
endfunction


"-----------------------------------------------------------------------------
" Basics
"-----------------------------------------------------------------------------
set number
if version >= 703
  set relativenumber
endif

" The internal representation
"set encoding=latin1
set encoding=utf-8
" set encoding=8bit-cp1252

" The representation that will be used when the file is written
" set fileencoding=latin1
" set fileencoding=8bit-cp1252
set fileencoding=utf-8

" The list of possible encodings that are tested when reading a file
" set fileencodings=latin1,utf-8

" Colorscheme
" set guifont=DejaVu\ Sans\ Mono\ 10
set t_Co=256
set background=dark
colorscheme xoria256
" winsize Fullsize
" set lines=9999
" set columns=130

" Printer settings
set printoptions=paper:A4,duplex:off,left:10pc,right:7pc,top:5pc,bottom:5pc

" Set filetype stuff to on
syntax on                                       " Syntax highlighting on
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on                       " Enable file type detection.

" Add specific file types for highlighting
au BufNewFile,BufRead *.lib             set filetype=sh       " Highlight .lib       files wie .sh   files
au BufNewFile,BufRead *.tf              set filetype=sh       " Highlight .tf        files wie .sh   files
au BufNewFile,BufRead *.include         set filetype=sh       " Highlight .include   files wie .sh   files
au BufNewFile,BufRead *.sql             set filetype=sql      " Highlight .values    files wie plsql files
au BufNewFile,BufRead *.gr              set filetype=plsql    " Highlight .gr        files wie plsql files
au BufNewFile,BufRead *.values_         set filetype=plsql    " Highlight .values    files wie plsql files
au BufNewFile,BufRead *.values          set filetype=plsql    " Highlight .values    files wie plsql files
au BufNewFile,BufRead *.values1         set filetype=plsql    " Highlight .values    files wie plsql files
au BufNewFile,BufRead *.values2         set filetype=plsql    " Highlight .values    files wie plsql files
au BufNewFile,BufRead *.values3         set filetype=plsql    " Highlight .values    files wie plsql files
au BufNewFile,BufRead *.pk              set filetype=plsql    " Highlight .pk        files wie plsql files
au BufNewFile,BufRead *.fk              set filetype=plsql    " Highlight .fk        files wie plsql files
au BufNewFile,BufRead *.uk              set filetype=plsql    " Highlight .uk        files wie plsql files
au BufNewFile,BufRead *.pck             set filetype=plsql    " Highlight .pck       files wie plsql files
au BufNewFile,BufRead *.tst             set filetype=plsql    " Highlight .tst       files wie plsql files
au BufNewFile,BufRead *.idx             set filetype=plsql    " Highlight .tst       files wie plsql files
au BufNewFile,BufRead *.trg             set filetype=plsql    " Highlight .tst       files wie plsql files
au BufNewFile,BufRead *_SydiServer.xml  set filetype=txt      " Highlight sydiserver files wie txt   files
au BufNewFile,BufRead *.qbc             set filetype=dosbatch " Highlight .qbc       files wie windows batch files


"set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set shortmess=at
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=all                 " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set hidden                          " Allow buffer switching without saving
set vb                              " set visual bell -- i hate that damned beeping
set t_vb=                           " Disable error blinking
set timeoutlen=1000                 " timeout to wait for next user input in milliseconds
set cpoptions=ces$                  " the text and replacing it
set fillchars = ""                  " get rid of the silly characters in separators
set diffopt+=iwhite                 " Add ignorance of whitespace to diff
set showfulltag                     " When completing by tag, show the whole tag, not just the function name
set clipboard+=unnamed              " Add the unnamed register to the clipboard
set autoread                        " Automatically read a file that has changed on disk

"set textwidth=120                   " Set the textwidth to be 80 chars
set textwidth=600                   " Set the textwidth to be 80 chars
set colorcolumn=+2
highlight ColorColumn ctermbg=green guibg=black

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*



"-----------------------------------------------------------------------------
" Vim UI
"-----------------------------------------------------------------------------
set tabpagemax=15               " Only show 15 tabs

highlight TabLineSel   guifg=lightgreen guibg=darkgreen gui=bold,underline " ctermfg=254   ctermbg=238 cterm=bold,underline
highlight TabLine      guifg=black      guibg=darkgrey  gui=italic "         ctermfg=black ctermbg=238 cterm=none
highlight TabLineFill  guifg=lightgrey  guibg=darkgrey  gui=none "           ctermfg=254   ctermbg=238 cterm=none

set showmode                    " Display the current mode

set mousehide                   " Hide the mouse pointer while typing
set guioptions=acg              " Hide Menubar, Symbols
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
"set debug=msg                   " Show error messages longer than one second

hi CursorLine   ctermbg=235 guibg='#262626'      
hi CursorColumn ctermbg=235 guibg='#262626'


augroup CursorColumnInActiveWindow
autocmd!
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
autocmd WinLeave * setlocal nocursorcolumn
augroup END


highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
let g:CSApprox_hook_post = ['hi clear SignColumn']


" comments italic: TMUX and iterm
" https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
if exists('$TMUX')
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
else
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
endif
highlight Comment term=none cterm=italic gui=italic


if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif


function! WordCount()
if  getline(1) != ''
    if &modified || !exists("b:wordcount")
            let l:old_status = v:statusmsg
            let position = getpos(".")
            execute "silent normal g\<c-g>"
            let b:wordcount = str2nr(split(v:statusmsg)[11])
            let v:statusmsg = l:old_status
            call setpos('.', position)
            return b:wordcount
    else
            return b:wordcount
    endif
endif
endfunction


" Change color of statusline if buffer is modified
highlight StatusLineModified           term=bold,reverse cterm=bold,reverse ctermfg=DarkRed  gui=bold,reverse guifg=DarkRed
highlight StatusLineModifiedNC         term=reverse      cterm=reverse      ctermfg=DarkRed  gui=reverse      guifg=DarkRed
highlight StatusLinePreview            term=bold,reverse cterm=bold,reverse ctermfg=Blue     gui=bold,reverse guifg=Blue
highlight StatusLinePreviewNC          term=reverse      cterm=reverse      ctermfg=Blue     gui=reverse      guifg=Blue
highlight StatusLineReadonly           term=bold,reverse cterm=bold,reverse ctermfg=Grey     gui=bold,reverse guifg=DarkGrey
highlight StatusLineReadonlyNC         term=reverse      cterm=reverse      ctermfg=Grey     gui=reverse      guifg=DarkGrey
highlight StatusLineSpecial            term=bold,reverse cterm=bold,reverse ctermfg=DarkBlue gui=bold,reverse guifg=DarkBlue
highlight StatusLineSpecialNC          term=reverse      cterm=reverse      ctermfg=DarkBlue gui=reverse      guifg=DarkBlue
highlight StatusLineUnmodifiable       term=bold,reverse cterm=bold,reverse ctermfg=Grey     gui=bold,reverse guifg=Grey
highlight StatusLineUnmodifiableNC     term=reverse      cterm=reverse      ctermfg=Grey     gui=reverse      guifg=Grey


" StatusLine Terminal
hi User1  ctermfg=white  ctermbg=88
hi User2  ctermfg=black  ctermbg=202
hi User3  ctermfg=black  ctermbg=226
hi User4  ctermfg=black  ctermbg=29
" hi User5  ctermfg=black  ctermbg=blue
" hi User6  ctermfg=black  ctermbg=green
hi User7  ctermfg=white  ctermbg=88
hi User8  ctermfg=white  ctermbg=67
hi User9  ctermfg=white  ctermbg=126
hi User0  ctermfg=black  ctermbg=88

" Statusline GUI
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

function! HighlightSearch()
if &hls
  return 'H'
else
  return ''
endif
endfunction

set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%f\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
" set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
" set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
set statusline+=%0*\ \ %m%r%w\ \                      "Modified? Readonly? Top/bot.
set statusline+=%1*\ %{GitBranchInfoString()}             "Show git infos
set statusline+=%8*\ \wc:%{WordCount()}                     " Count Words

" Always show the statusline
set laststatus=2


set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=8                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code

" Set color of highlighting color
hi MatchParen ctermbg=blue guibg=blue

"-----------------------------------------------------------------------------


"-----------------------------------------------------------------------------
" Formatting
"-----------------------------------------------------------------------------
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=2                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set shiftwidth=2

" Pyhton settings
au BufNewFile,BufRead *.py
    \ set tabstop=4        |
    \ set softtabstop=4    |
    \ set shiftwidth=4     |
    "\ set textwidth=79     |
    \ set expandtab        |
    \ set autoindent       |
    \ set fileformat=unix  |

"-----------------------------------------------------------------------------
"
" Dealing with Whitespaces
"
" Highlight extra and unwanted whitespaces at the end of the line
" highlight ExtraWhitespace cterm=underline ctermfg=202
highlight ExtraWhitespace ctermfg=214

" set list listchars=tab:»-,trail:·,extends:»,precedes:«
set list listchars=tab:»-,trail:·,extends:»,precedes:«
" Highlight unwanted whitespaces only of specific file types
" autocmd! BufEnter _vimrc,.vimrc,*.cmd,*.sh,*.sql :match ExtraWhitespace /\s\+$/
autocmd! BufEnter * :match ExtraWhitespace /\s\+$/

" Function to remove Whitespaces
fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//ce
    call setpos('.', l:save_cursor)
endfun

" Define a command
command! TrimWhitespace call TrimWhitespace()

"-----------------------------------------------------------------------------
"
" Plugins
"
"-----------------------------------------------------------------------------


"-----------------------------------------------------------------------------
" Neocomplete
"-----------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" " Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : $VIM.'\vimfiles\spell\german.dic'
" \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
noremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 0

"-----------------------------------------------------------------------------


"-----------------------------------------------------------------------------
" Fugitive
"-----------------------------------------------------------------------------
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \  noremap <buffer> .. :edit %:h<cr> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete


"-----------------------------------------------------------------------------
" Easymotion
"-----------------------------------------------------------------------------

" Disable default EasyMotion Mappings
let g:EasyMotion_do_mapping = 0


" With this option set, v will match both v and V, but V will match V only. Default: 0.
let g:EasyMotion_smartcase = 1


"map , <Plug>(easymotion-prefix)

" Suchesymotionsymotionsymotion-bd-f)-bd-f)-bd-f) genau einen Buchstaben
" ,f{char} to move to {char}
" map  ,f <Plug>(easymotion-bd-f)
" nmap ,f <Plug>(easymotion-overwin-f)
nmap ,F <Plug>(easymotion-bd-f)
nmap ,F <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap ,S <Plug>(easymotion-overwin-f2)

" Movesymotionsymotion-bd-f)-bd-f) to line
map  ,L <Plug>(easymotion-bd-jk)
nmap ,L <Plug>(easymotion-overwin-line)

" Eingabe des ersten Buchstabens eines Wortes
" Move to beginning of a word
" Vorwärts
" map  ,w <Plug>(easymotion-bd-w)
" nmap ,w <Plug>(easymotion-overwin-w)
map  ,W <Plug>(easymotion-bd-w)
nmap ,W <Plug>(easymotion-overwin-w)
" Rückwärts
" map  ,b <Plug>(easymotion-bd-w)
" nmap ,b <Plug>(easymotion-overwin-w)
map  ,B <Plug>(easymotion-bd-w)
nmap ,B <Plug>(easymotion-overwin-w)


" "-----------------------------------------------------------------------------
" " Incsearch
" "-----------------------------------------------------------------------------
"
" Turn off that stupid highlight search
nnoremap <silent> ,n :nohls<CR>


"-----------------------------------------------------------------------------
" Some mappings
"-----------------------------------------------------------------------------

" Add line without entering insert mode
"nnoremap <S-O> O<Esc>
nnoremap <CR> o<Esc>

" Make horizontal scrolling easier
nnoremap <S-l> 10zl
nnoremap <S-h> 10zh


" gvimdiff: jump up/down to next difference
if &diff
" Space jumps forward to next difference
noremap <space> ]cz.
" Shift-space jumps backward to next difference
noremap <S-space> [cz.
" Öffne alle Folds
set diffopt=filler,context:1000000,iwhite " filler is default and inserts empty lines for sync
" disable cursorline highlighting in diff
set cursorline!

set diffexpr=MyDiff()

endif


" Function Makes vimdiff to ignore empty lines
function! MyDiff()
let opt = ""
if &diffopt =~ "icase"
	let opt = opt . "-i "
endif
if &diffopt =~ "iwhite"
	let opt = opt . "-w -B " " vim uses -b by default
endif
silent execute "!diff -a --binary " . opt .
			\ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction



" Exit insert mode to the right...
inoremap kk <esc><space>
cnoremap kk <esc><space>
" ... to the left
inoremap jj <esc>
cnoremap jj <esc>

" System default for mappings is now the "," character
let mapleader = ","

" cd to the directory containing the file in the buffer
nnoremap <silent> ,cd :lcd %:h<CR>

" Replace
" replace one word by buffer
nnoremap ,rw diw"0P
" replace one line by buffer
nnoremap ,rl "_ddP

" Open vimrc File in splittet Window
nnoremap ,ev :vsplit $MYVIMRC<CR>
" Update _vimrc online
nnoremap ,vu :source $MYVIMRC<CR><C-w>=:nohls<CR>

" Handling Tabs
noremap <C-Tab> gt
noremap <C-S-Tab> gT

" Resize Windows
nnoremap ,e :resize +10<CR>
nnoremap ,c :resize -10<CR>
nnoremap ,s :vertical resize +10<CR>
nnoremap ,f :vertical resize -10<CR>

" Better pasting from the clipboard
nnoremap ,p :set paste<CR>o<esc>"*]p:set nopaste<CR>

" Copy all lines of file
nnoremap ,a gg"+yG

"-----------------------------------------------------------------------------
" NERDTree
"-----------------------------------------------------------------------------
" Toggle/Untoggle the NERD Tree on an off with F7
nmap <C-k> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen = 1

"-----------------------------------------------------------------------------


set directory=~/.vim/swap
set undodir=~/.vim/undo
set backupdir=~/.vim/backup

" ansible-vim settings
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_normal_keywords_highlight = 'Statement'
let g:ansible_with_keywords_highlight = 'Special'

" Change Cursor shape in insert modus with respect to tmux
if exists('$TMUX')
    let &t_SI = "\e[5 q"
    let &t_SR = "\e[4 q"
    let &t_EI = "\e[2 q"
else
    let &t_SI = "\e[5 q"
    let &t_SR = "\e[4 q"
    let &t_EI = "\e[2 q"
endif

" Command mode when enter vim
autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
" Insert mode when leaving vim
autocmd VimLeave * silent exec "! echo -ne '\e[5 q'"

" Enable folding
set foldmethod=manual
" set foldlevel=99

" Default settings syntasic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" , "regex": ['^.*\[bad\-whitespace\].*Exactly one space required before assignment$', '^.*\[line\-too\-long\].*Line too long.*$','^.*\[missing\-docstring\].*Missing .* docstring$' ]}

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Remap Str-w to ,w to easiery switch between splitted windows
nnoremap <silent> ,h <C-w>h
nnoremap <silent> ,j <C-w>j
nnoremap <silent> ,k <C-w>k
nnoremap <silent> ,l <C-w>l

"----------------------------------------------------------------------------
" indentLine
"----------------------------------------------------------------------------

let g:indentLine_enabled = 1

" let g:indentLine_setConceal = 0
let g:indentLine_first_char = '·'
let g:indentLine_char = '·'
let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel = 1

" Vim
let g:indentLine_color_term = 239
" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 234


" Syntax highlight is synchronized in 100 lines.
let g:markdown_minlines = 100

