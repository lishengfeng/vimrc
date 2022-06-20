"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax on
"compatible mode means compatibility to old vi.
"all the enhancements and improvements of Vi Improved are turned off.
set nocompatible

""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Add plugins here

call vundle#end()
""""""""""""""""""""""""""

"set number
"set autoindent
"set smartindent
"set showmatch
"set ruler
"set incsearch
"set tabstop=4
"set expandtab
"set shiftwidth=4
"control how many columns vim uses hit Tab in insert mode,
set softtabstop=4
set cindent
"set nobackup
"set backspace=indent,eol,start
"Without this, whenever you switch buffers, Vim will prompt you to save the file (you don't want that if you want to move quickly between buffers). For more information, check out :h hidden
set hidden

"automatically complete bracket
"remap by echofunc
"via vim :scriptnames to see what files are read on startup
"via vim :verbose inoremap ) to check last set
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
"<Tab> is conflic to SnippetsEmu plugin
"use <s-tab> shift+tab instead
:inoremap <s-tab> <C-R>=TabSkip()<CR>

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function! TabSkip()
    let char = getline('.')[col('.') - 1]
    if char == '}' || char == ')' || char == ']' || char == ';' || char == '>'
        return "\<Right>"
    else
        return "    "
    endif
endf


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=100

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
" cursor will in the middle
" the top and bottom will always have more than 7 lines when use j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
"set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" the key can jump to another line
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
"set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard
" language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c
" anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
"short conflict
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"split right
"vertical
nmap wv <C-w>v
"split cancel
nmap wc <C-w>c
"split below
"horizontal
nmap ws <C-w>s
"split quit
nmap wq <C-w>q
"put the new buffer on the right of the current buffer
set splitright
"put the new buffer below the current buffer
set splitbelow
"split file command
":sp filename for a horizontal split
":vsp filename or :vs filename for a vertical split

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ %{EchoFuncGetStatusLine()}\ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ wc:%{WordCount()}
function! WordCount()
   let s:old_status = v:statusmsg
   let position = getpos(".")
   exe ":silent normal g\<c-g>"
   let stat = v:statusmsg
   let s:word_count = 0
   if stat != '--No lines in buffer--'
     let s:word_count = str2nr(split(v:statusmsg)[11])
     let v:statusmsg = s:old_status
   end
   call setpos('.', position)
   return s:word_count 
endfunction
""""""""""""""""""""""""""""""
" =>EchoFunc plugin
""""""""""""""""""""""""""""""
"echofunc plugin echo function name in statusline not message line
let g:EchoFuncShowOnStatus = 1
"next function
let g:EchoFuncKeyNext='<Esc>+'
"prefunction
let g:EchoFuncKeyPrev='<Esc>-'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
"map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"if has("mac") || has("macunix")
"    nmap <D-j> <M-j>
"    nmap <D-k> <M-k>
"    vmap <D-j> <M-j>
"    vmap <D-k> <M-k>
"endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
"func! DeleteTrailingWS()
"    exe "normal mz"
"    %s/\s\+$//ge
"    exe "normal `z"
"endfunc
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent>gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
" after search u can use :cw to show result
map <leader>g :vimgrep //gj **/*<left><left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-B><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
"equal :cw
map <leader>cc :botright cope<cr>
"map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"show the next result of vimgrep
map <leader>n :cn<cr>
"show the previous result of vimgrep
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" spell function
"map <leader>sn ]s
"map <leader>sp [s
"map <leader>sa zg
"map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Remove the Windows ^I
noremap <Leader>i :retab <CR>

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" Returns true if paste mode is enabled
" use :setlocal paste! or <leader>pp to enable
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

"Fast reloading of the .vimrc
"map <silent> <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
"map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 
""""""""""""""""""""""""""""""""""""""""""""
"Tlist function
""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
nmap <leader>tt :TlistToggle<cr>
"WimManager
let g:winManagerWindowLayout='TagList|FileExplorer,BufExplorer'
nmap <silent> <F8> :WMToggle<cr>
let g:winManagerWidth = 30
let g:AutoOpenWinManager =0
"create ctags for echofunc
function! CreateCtags()
    execute("!ctags -R --fields=+lS")
    execute("set tags=tags")
endfunction

nmap <silent> <F9> :call CreateCtags()<cr> 
"nmap <F9> :ctags --c++-kinds=+p --fields=iaS --extra=+q "$@"

"""""""""""""""""""""""""""""""""""""""""""""
"Conque plugin
"""""""""""""""""""""""""""""""""""""""""""""
let g:ConqueTerm_CWInsert=1
let g:ConqueTerm_InsertOnEnter =1
"avoid conflic with <F8> WMToggle
let g:ConqueTerm_ToggleKey='<F4>'
function! ConqueTermMode()
    setlocal tw=0
    setlocal nolist
    setlocal nospell
    " Work-around the bug with Tlist
"already upside
"    inoremap <buffer> <c-w>h <esc><c-w>h
"    inoremap <buffer> <c-w>j <esc><c-w>j
"    inoremap <buffer> <c-w>k <esc><c-w>k
"    inoremap <buffer> <c-w>l <esc><c-w>l
"    inoremap <buffer> <esc><c-w>h <esc><c-w>h
"    inoremap <buffer> <esc><c-w>j <esc><c-w>j
"    inoremap <buffer> <esc><c-w>k <esc><c-w>k
"    inoremap <buffer> <esc><c-w>l <esc><c-w>l
endfunction
command! -nargs=0 ConqueTermMode call ConqueTermMode()

au! FileType conque_term ConqueTermMode
nmap <leader>sh :ConqueTerm  bash<cr>
nmap <leader>shs :ConqueTermSplit bash<cr>
nmap <leader>shv :ConqueTermVSplit bash<cr>
nmap <leader>sht :ConqueTermTab bash<cr>
"show the line end with $ 
""""""""""""""""""""""""""""""""""""""""""
"A config
""""""""""""""""""""""""""""""""""""""""""
"use F12 to switch between .c and .h
nnoremap <silent> <F12> :A<cr>
"set list
au BufRead,BufNewFile *.logcat set filetype=logcat
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
inoremap jk <ESC>
inoremap kj <ESC>
cnoremap jk <ESC>
cnoremap kj <ESC>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" mkdir -p ~/.vim/plugin
" mkdir -p ~/.vim/bundle
" wget -P ~/.vim/plugin/ https://raw.githubusercontent.com/mbbill/echofunc/master/after/plugin/echofunc.vim
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Now add the following lines as shown in the screenshot below. Then save and exit vim with VIM command ‘:wq!’
""""""""""""""""""""""""""""""""""""""""""
"set nocompatible
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"
"" Add plugins here
"
"call vundle#end()
"filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""
" Now open vim.
" Run the following VIM command to initialize Vundle Plugin Manager:
" :PluginInstall
Plugin 'frazrepo/vim-rainbow'
let g:rainbow_active = 1
"In order to get the nice 2-space YAML as the defaultpick
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
if &diff
  " colorscheme evening
  highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif
