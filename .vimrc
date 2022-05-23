" Description:  used by myself 
"
" Maintainer:  ddrccw(ddrccw@gmail.com)	
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
"  for win7:~/.vimrc or ~/_vimrc

"""""""""""""""""""""""""""""""""""""""""""
" https://github.com/VundleVim/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required


""""""""""""""""
"   function
""""""""""""""""
function! IsFileExisted(fname)
	if has("unix")
		if findfile(a:fname, ".;/usr/bin/;/usr/local/bin") == a:fname
			return 1
		else
			return 0
		endif
	else
		if findfile(a:fname, "D:/cygwin/bin") == a:fname
			return 1
		else
			return 0
		endif
   endif
endfunction

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Add homebrew fzf to the vim path:
let isCtagsExisted = 0
if has("unix")
    let isCtagsExisted = IsFileExisted("/usr/bin/ctags")
else
    let isCtagsExisted = IsFileExisted("D:/cygwin/bin/ctags.exe")
endif

let isFzfExisted = IsFileExisted("/usr/local/bin/fzf")
if isFzfExisted == 1
    set rtp+=/usr/local/bin/fzf
endif
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'keith/tmux.vim'
Plugin 'scrooloose/nerdtree'
if isFzfExisted == 1
    " Add the fzf.vim plugin to wrap fzf:
    Plugin 'junegunn/fzf.vim'
endif
Plugin 'tpope/vim-fugitive'
if isCtagsExisted == 1
    Plugin 'taglist.vim'
endif

"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'Rykka/riv.vim'
Plugin 'tikhomirov/vim-glsl'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""
"    setting
"""""""""""""""""""

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
set clipboard=unnamed

"set leader
let mapleader=","
let g:mapleader=","

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" set encoding=utf-8
" set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

syntax on
" check file type
"filetype on
" check file type plugin
"filetype plugin on
" show line num
set number
" highlight current line
set cursorline
" << and >> 4
set shiftwidth=4
" bkspace delete 4 sps
set softtabstop=4
" tab 4
set tabstop=4
" Use expand tab to convert new tabs to spaces
set expandtab
set nobackup
" auto change dir
" https://github.com/junegunn/fzf.vim/issues/856#issuecomment-895215783
" set autochdir
" when searching, ignore case except that a word contains more 
" then one upper cases.
set ignorecase
set smartcase
" stop repeating searching, after seaching at both ends.
set nowrapscan
" real-time search
set incsearch
" highlight found results
set hlsearch
" allow to switch to buffer without saving current file, which will be done
" automatically
set hidden
set smartindent
set cmdheight=1
" show status bar(default 1)
set laststatus=2
" show status info
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
set showmatch

colorscheme molokai
set t_Co=256
" show tab
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
" when start vim, don't show donation info.
set shortmess=atl

" plz see help ssop
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

" shortcut
" zR open all folds.
" zM close all folds.
" za When on a closed fold: open it.  When folds are nested, you may have to use za several times.
" zA When on a closed fold: open it recursively.
" zi invert foldnable 
" zo open one fold under the cursor
" zO open all folds under the cursor recursively
" zc close one folds under the cursor.
" zC close all folds under ther cursor.
set foldenable
"http://vim.wikia.com/wiki/All_folds_open_when_opening_a_file
set foldlevelstart=20 
" manual  手工定义折叠
" indent  更多的缩进表示更高级别的折叠
" expr    用表达式来定义折叠
" syntax  用语法高亮来定义折叠
" diff    对没有更改的文本进行折叠
" marker  对文中的标志折叠
set foldmethod=syntax
set foldcolumn=1
" setlocal foldlevel=1

" set autowrap
noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap' <cr>

" edit .vimrc
if has("unix")
    set fileformats=unix,dos,mac
    nmap <leader>e :tabnew $HOME/.vimrc<cr>
    let $VIMFILES = $HOME."/.vim"
	set encoding=utf-8
	set fileencodings=ucs-bom,utf-8,cp936,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1
else
    set fileformats=dos,unix,mac
    nmap <leader>e :tabnew $VIM/_vimrc<cr>
    let $VIMFILES = $VIM."/vimfiles"
	set encoding=gbk
	set fileencodings=ucs-bom,utf-8,cp936,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1	
endif


"""""""""""""
" for NERDTREE
map <C-n> :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '__pycache__[[dir]]']

""""""""""""""
" for ctags
""""""""""""""
if isCtagsExisted == 1
	set tags=tags;
	if has("unix")                         "设定unix系统中ctags程序的位置
		let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
	else                                   "设定windows系统中ctags程序的位置
		let Tlist_Ctags_Cmd = 'D:/cygwin/bin/ctags.exe'
endif
	let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
	let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
	nmap <leader>tl :TlistToggle<cr>        "taglist
endif

" for slimv
" http://stackoverflow.com/questions/10139972/vim-hasmacunix-or-hasmac-do-not-work
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
	let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"ccl64 --load ~/.vim/slime/start-swank.lisp\""'
	let g:slimv_leader = "."
	let g:lisp_rainbow = 1 "matching parens have the same color
	let g:slimv_menu = 1
endif

" for gvim run bash
if !has("unix")
	set shell=d:/cygwin/bin/bash
	set shellcmdflag=--login\ -c
	set shellxquote=\"
endif

" when saving .vimrc, it takes effect automatically 
autocmd! bufwritepost .vimrc source ~/.vimrc

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup                " do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" "Raw" version of ag; arguments directly passed to ag
"
" e.g.
"   " Search 'foo bar' in ~/projects
"   :Ag "foo bar" ~/projects
"
"   " Start in fullscreen mode
"   :Ag! "foo bar"
command! -bang -nargs=+ -complete=file AgRaw call fzf#vim#ag_raw(<q-args>, <bang>0)

" Raw version with preview
command! -bang -nargs=+ -complete=file AgRaw call fzf#vim#ag_raw(<q-args>, fzf#vim#with_preview(), <bang>0)


" AgIn: Start ag in the specified directory
"
" e.g.
"   :AgIn .. foo
function! s:ag_in(bang, ...)
  if !isdirectory(a:1)
    throw 'not a valid directory: ' .. a:1
  endif
  " Press `?' to enable preview window.
  call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', '?'), a:bang)

  " If you don't want preview option, use this
  " call fzf#vim#ag(join(a:000[1:], ' '), {'dir': a:1}, a:bang)
endfunction

command! -bang -nargs=+ -complete=dir AgIn call s:ag_in(<bang>0, <f-args>)

