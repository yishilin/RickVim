" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'preservim/nerdtree'
Plug 'yegappan/mru'
Plug 'preservim/nerdcommenter'
Plug 'adelarsq/vim-matchit'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'adinapoli/vim-markmultiple' 
Plug 'ervandew/supertab' 
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-rooter'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'godlygeek/tabular' 
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tmsvg/pear-tree'


" snippets plugin
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
"to see the full snippets content as below
Plug 'honza/vim-snippets' 

Plug 'iamcco/markdown-preview.vim'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'Yggdroot/indentLine'

"shows a git diff in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'

Plug 'mbbill/undotree' "The undo history visualizer

"colorscheme molokai
Plug 'tomasr/molokai' 
 
" Initialize plugin system
call plug#end()



""================================
"" Start the vimrc configuration
""================================

set nocp

"" Platform
function! MySys()
  if has("win32")
    return "windows"
  endif

  if has("unix")
    let s:uname = system("echo -n \"$(uname)\"")
    if !v:shell_error && s:uname == "Darwin"
        return "mac"
    endif
  endif

  return "linux"
endfunction
let g:platform = MySys()



"" In macvim map <apple-shift-arrow> to switch tab
if 'mac' == g:platform && has("gui_running")
  map <D-S-left> :tabprevious<CR>
  map <D-S-right> :tabnext<CR>
  map <D-S-[> :tabprevious<CR>
  map <D-S-]> :tabnext<CR>
endif


set autoread    " 自动载入,用于不同编辑器处理同一文件时
set autowriteall
set t_Co=256

set noswapfile
"set ignorecase
"set smartcase


"---------------------------------------------
"" copy and paste setting
"----------------------------------
if 'windows' == g:platform
  "" for windows setting
  "" in windows register '+' is the same with '*'
  set clipboard+=unnamed  " Yanks go to clipboard instead.
elseif 'mac' == g:platform && $TMUX == ''
  "" for mac setting
  "" in windows register '+' is the same with '*'
  set clipboard=unnamed  " Yanks go to clipboard instead.
else
  "----------------------------------
  "" for linux setting
  "" vim's system clipboard is register '+'
  "" in linux vim, the register '+' is not '*'

  "" copy to system clipboard
  vmap <c-c> "+y
  "" cut to system clipboard
  vmap <c-x> "+d

  "" <SHIFT-Insert> to Paste
  nnoremap <silent> <SID>Paste "=@+.'xy'<cr>gPFx"_2x
  map  <S-Insert>        <SID>Paste
  imap <S-Insert>        x<Esc><SID>Paste"_s
  cmap <S-Insert>        <c-r>+
  vmap <S-Insert>        "-cx<Esc><SID>Paste"_x
  imap <c-v>        x<Esc><SID>Paste"_s
  "---------------------------------------------
endif


let mapleader = ","
"let maplocalleader = ","

set wildmenu         "enable ctrl-n and ctrl-p to scroll thru matches


"" make Y consistent with C and D
nnoremap Y y$


"" 使得 Vim 在执行自动命令时回显之
"" set verbose=9



"" 设置语言和编码
augroup utf8
  autocmd!
  autocmd BufNewFile,BufNew,BufCreate,BufAdd * call SetUtf8WhenNew()
augroup END

function! SetUtf8WhenNew()
  set modifiable
  if &modifiable
    set nobomb                              "BOM(字节顺序标记)
    set fileformat=unix                     "设置缓冲区换行符格式
    set fileformats=unix,dos,mac            "设置换行符格式
    set encoding=utf-8
    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
    set termencoding=utf8
  endif
endfunction

set langmenu=en

call SetUtf8WhenNew()
set showcmd
set ambiwidth=double  "防止特殊符号如五角星无法正常显示



" This mapping allows to stay in visual mode when indenting with < and >
vnoremap > >gv
vnoremap < <gv


"---------------------------------------------
"" font setting
"" see dependence directory to install fonts
"----------------------------------
if 'windows' == g:platform
  "set guifont=ProggyCleanCP:h12:cANSI
  "set guifont=ProggyCleanTT:h12:cDEFAULT
  set guifont=MONACO:h10
  "set guifont=Fixedsys:h11
  "set guifont=Consolas:h11:cDEFAULT
elseif 'mac' == g:platform
  "set guifont=ProggyCleanCP:h12:cANSI
  "set guifont=ProggyCleanTT:h12:cDEFAULT
  set guifont=MONACO:h10
  "set guifont=Fixedsys:h11
  "set guifont=Consolas:h11:cDEFAULT
else 
  ""linux
  "set guifont=Consolas\ 11
endif

"--------------------------------------------- 



if has("gui_running")
  if 'windows' == g:platform
    "" In Windows platform
    "" 解决consle输出乱码
    language messages zh_CN.utf-8
    set helplang=cn

    "" Vim 在启动时最大化窗口(windows 有效)
    autocmd GUIEnter * simalt ~x
  else
    "" In linux platform

  endif

  set guioptions-=m " 完全隐藏菜单
  set guioptions-=T " 完全隐藏工具栏
  set guioptions-=r
  set guioptions-=R
  set guioptions-=L
  set guioptions-=l

  "" 在GVim中绑定到切换菜单和工具栏
  map <silent> <c-F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
  \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
  \endif<cr>



  "colorscheme vibrantink
  "colorscheme ir_black
  "colorscheme blackboard

  if 'windows' == g:platform
    "" In GUI Windows platform

    colorscheme molokai
    let g:molokai_original = 0
  else
    "" In GUI linux/mac platform
   colorscheme blackboard
  endif

else
  ""in command line
endif





"" 搜索高亮
map <silent> <F3> :call SetHlsearch()<cr>
set hlsearch
let s:hlsearch=1
function! SetHlsearch()
  if s:hlsearch==0
    let s:hlsearch=1
    set hlsearch
  elseif s:hlsearch==1
    let s:hlsearch=0
    set nohlsearch
  endif
endfunction




"" Backups & Files
let $vim_backupdir = $HOME . "/vim_backup"
let $vim_tmpdir = $HOME . "/vim_tmp"
if !isdirectory($vim_tmpdir)
  silent! call mkdir($vim_tmpdir, 'p')
endif
set directory=$vim_tmpdir      " Directory to place swap files in
if !isdirectory($vim_backupdir)
  silent! call mkdir($vim_backupdir, 'p')
endif
set backup                     " Enable creation of backup file.
set backupdir=$vim_backupdir   " Where to put backup files



set nocompatible                 " We're running Vim, not Vi!
set guitablabel=%M%t

"" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab compion similar to bash
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png,*~    "stuff to ignore when tab comping

"" vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"" 高亮当前行
set cursorline

set cf          " Enable error files & error jumping.

set autowrite   " Writes on make/shell commands
set ruler       " Ruler on
set number      " Line numbers on
set nowrap      " Line wrapping off



"" By default Vim will only wait 1 (1000 milliseconds)
"" second for each keystroke in a mapping.

"" timeout in milliseconds
"set timeoutlen=2000
"" timeout for key codes in milliseconds
"set ttimeoutlen=100
"set notimeout

set tw=78 fo+=Mm

"" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent


"" and NERDTree init and render a new tree

function! Map_cd()
  if exists("b:rails_root")
     g:project_root=b:rails_root
     current_cwd = getcwd()
    if current_cwd ==? g:project_root
      NERDTreeFind
      execute 'cd ' . b:rails_root
    else
      execute 'cd ' . b:rails_root
      Rtree
    endif
  else
    let g:project_root=expand("%:p:h")
    cd %:p:h
    NERDTreeFind
  end
endfunction


"" Switch to current dir
"" and NERDTree init and render a new tree
map <silent> cd  <esc>:call Map_cd()<cr>


let NERDTreeDirArrows=0


augroup Rails
  autocmd!
  autocmd User Rails		silent! Rlcd
  autocmd User Rails		call Set_rails_project_root()
augroup END
"------------------------------------------------





"" Visual
set showmatch     " Show matching brackets.
set mat=5         " Bracket blinking.


"" gvim specific
set mousehide     " Hide mouse after chars typed
"set mouse=a      " Use mouse everywhere


"" 保存全局变量
set viminfo+=!


" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

"" 总是显示状态行:2
set laststatus=2

" 命令行（在状态行下）的高度，默认为1
set cmdheight=1

" 高亮字符，让其不受100列限制
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
match OverLength '\%101v.*'



"" 允许backspace和光标键跨越行边界
"set whichwrap+=<,>,h,l


" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atIT


"" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\


function! CurDir()
  curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
 return curdir
endfunction


imap idate <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
imap iday <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>


set bsdir=buffer

"" aotu change the :pwd to the current dir
"set autochdir


set history=512   "" Number of things to remember in history.


map s <Nop>


"" Fast reloading of the .vimrc
map <silent> <leader>ss :source $MYVIMRC<cr>

"" Fast editing of .vimrc
map <silent> <leader>ee :e $MYVIMRC<cr>

map <silent> <leader>eb :e $HOME/.NERDTreeBookmarks<cr>
""map <silent> <leader>ed :e $VIM_PLUGIN/vimrc.vim<cr>


""--------------------------------------------
" Fix the ^M Windows/Linux endline chat issue
""-------------------------

function! Dos2Unix()
  set fileformat=unix
  write
endfunction

function! Unix2Dos()
  set fileformat=dos
  write
endfunction

command! -nargs=0  Dos2Unix :call Dos2Unix()
command! -nargs=0  Unix2Dos :call Unix2Dos()
""--------------------------------------------



" 以下符号是单词的一部分,不要对他们换行分割(在自动补齐和单词搜索如<S-8>时很有用)
" @ -> 所有字母, 48-57 -> 数字0-9
autocmd BufRead,BufNewFile *.tcl,*.test  setlocal  iskeyword=@,48-57,_
autocmd BufRead,BufNewFile *.php         setlocal  iskeyword=@,48-57,_
autocmd BufRead,BufNewFile *.mkd         setlocal spell

autocmd! BufRead,BufNewFile *.scala       nmap  tt :call g:RunScala()<cr>

function! g:RunScala()
   command = "scala ". expand("%:p")
  call g:AsynCommand(command)
endfunction






"" use Ctrl+x+[l|n|p|cc] to list|next|previous|jump to count the result
map <c-x>l <esc>:cl<cr>
map <c-x>n <esc>:cn<cr>
map <c-x>p <esc>:cp<cr>
map <c-x>c <esc>:cc

"" to navigate between entries in QuickFix
map <silent> gp :cp <cr>
map <silent> gn :cn <cr>

"------------------------------------------------------




"" Alt+j break the current line
nmap <a-j> i<cr><Esc>k$

map! <c-l> <DEL>


"map <Space> <c-F>
"map <S-Space> <c-B>

"" In insert and cmd modems to hjkl
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

"noremap <C-w> <esc><c-w>-
"noremap <C-w> <esc><c-w>+


"" just works in gui :)
map <c-h> <esc><c-w>h
map <c-j> <esc><c-w>j
map <c-k> <esc><c-w>k
map <c-l> <esc><c-w>l





"" visual search mappings
"" to search the selected word
function! s:VSetSearch()
     temp = @@
    norm! gvy
     @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
     @@ = temp
endfunction
vnoremap * :<c-u>call <SID>VSetSearch()<cr>//<cr>
vnoremap # :<c-u>call <SID>VSetSearch()<cr>??<cr>

"" In visual modem, put / to search the selected word
vmap / y/<c-r>"<cr>





"-------------------------------------------------------------------
""  NERDtree setting
"---------------------------------------------
""  ref: $HOME/.NERDTreeBookmarks

let g:NERDTreeWinPos="right"
let g:NERDTreeMapMenu="M"

""  NERDTree ignore ['expression-a', 'expression-b']
let NERDTreeIgnore=['^CVS$', 'phpMyAdmin', 'svn$', '\.git$', '^Thumbs.db$', '.class$']
""  NERDTree render the exist tree
map <silent> mv :NERDTreeToggle<cr>

"-------------------------------------------------------------------





"" 取消光标闪烁
set guicursor=a:block-blinkon0,i-ci:ver25-Cursor/lCursor,v-ve:ver25-Cursor/lCursor


"set novisualbell  " No blinking .
"set noerrorbells  " No noise.
""  使用visualbeep（闪屏）取代 bell发声
"set visualbell t_vb=

""  同时删除bell发声和闪屏
""  Note: When the GUI starts, 't_vb' is reset to its default value.  You
""  might want to set it again in your |gvimrc|, or in the end of your $VIMRUNTIME/menu.vim.
""  see :help gvimrc for more detail
set vb t_vb=



"" 匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>




" ------------------------------------------------
"" 自动补全括号
" -------------------------------------
function! g:SwitchMapCompe(CurMapCompe)
  if a:CurMapCompe == 1
    inoremap " ""<esc>i
    inoremap ' ''<esc>i
    inoremap ( ()<esc>i
    inoremap [ []<esc>i
    inoremap { {}<esc>i
    set nopaste
  else
    inoremap " "
    inoremap ' '
    inoremap ( (
    inoremap [ [
    inoremap { {
    set paste
  endif
endfunction
command! -nargs=0  SwitchPasteOn  :call g:SwitchMapCompe(0)
command! -nargs=0  SwitchPasteOff :call g:SwitchMapCompe(1)
"call g:SwitchMapCompe(1)
" ------------------------------------------------



"" for LargeFile.vim, Mbytes
let g:LargeFile = 2

imap <c-f>      <Right>
imap <c-b>      <Left>
imap <c-p>      <Up>
imap <c-n>      <Down>
imap <c-a>      <Home>
imap <c-e>      <End>


""--------------------------------------------
" Window resizing mappings
""-------------------------

if bufwinnr(1)
  map + 8<C-W>+
  map = 8<C-W>+
  map - 8<C-W>-
  map _ 8<C-W>-
  map < 8<C-W><
  map > 8<C-W>>
endif 


"---------------------------------------------------------------------
"" MRU.vim Setting
"-----------------------------------------

augroup MRU
  autocmd!
  nmap <silent> mm <esc>:MRU<cr>
  let MRU_Max_Entries = 100
  let MRU_Add_Menu = 0
  let MRU_Exclude_Files = '.*\.pdf$\|.*\.zip$\|.*\.rar$\|.*\.7z$\|.*\.class$\|.*\.wiki$'
  let MRU_Exclude_Files .= '\|.*BExec_output.*\|.*NERD_tree_.*\|.*__MRU_Files__.*'
  let MRU_Exclude_Files .= '\|.*favex/favlist\|.*\.fugitiveblame' 
  let MRU_Exclude_Files .= '\|.*vim_mru_files.*' 

  autocmd BufRead,BufNewFile *__MRU_Files__*  setlocal  cursorline

augroup END
"---------------------------------------------------------------------


"-------------------------------------------------------------------
""  NERDtree setting
"---------------------------------------------
""  ref: $HOME/.NERDTreeBookmarks

let g:NERDTreeWinPos="right"
let g:NERDTreeMapMenu="M"

""  NERDTree ignore ['expression-a', 'expression-b']
let NERDTreeIgnore=['^CVS$', 'phpMyAdmin', 'svn$', '\.git$', '^Thumbs.db$', '.class$']
""  NERDTree render the exist tree
map <silent> mv :NERDTreeToggle<cr>


"-------------------------------------------------------------------



let g:mark_multiple_trigger = "<C-n>"



"------------------------------------------------
"" tab setting
"----------------------------
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

function! g:SetTab(expandEnable, spaceNum)
  let spaceNum = a:spaceNum
  let expandEnable = a:expandEnable

  ""当 'smarttab' 选项打开时，<Tab> 在行首插入 'shiftwidth' 个位置，而在其它地方插
  ""入 'tabstop' 个。这意味着经常会插入空格而不是 <Tab> 字符。当 'smarttab' 关闭
  ""时，<Tab> 总是插入 'tabstop' 个位置，而 'shiftwidth' 只有在 ">>" 和类似的命令
  ""中才会用到
  set smarttab

  "" 输入tab时自动将其转化为空格
  "" 如果此时需要输入真正的tab，则输入Ctrl+V, tab，在windows下是Ctrl+Q, tab
  "" 将已存在的tab都转化为空格命令 :retab
  if expandEnable
    set expandtab
  else
    set noexpandtab
  endif

  ""一个tab字符的长度
  execute ':set tabstop='.spaceNum

  ""vim中自动缩进，或者'<','>',ctrl+T,ctrl+D命令产生的空格数
  execute ':set shiftwidth='.spaceNum

  ""当按下tab键时，产生的空格数。当产生的softtab可以转换成一个tab字符时，vim自动将空格转换成tab字符
  ""如tabstop=8, softtabstop=4, 按一下tab产生4个空格，再按一下tab会把两次产生的8个空格转换成一个tab字符
  execute ':set softtabstop='.spaceNum
endfunction

call g:SetTab(1, 4)

"" 开关:是否显示Tab等不可见字符
"set list
set nolist

"" 定义显示<TAB>的方式:高亮<tab>
set listchars=tab:\ \ ,extends:>,precedes:<

"------------------------------------------------



"------------------------------------------------
" EasyAlign https://github.com/junegunn/vim-easy-align
" -------------- 
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"------------------------------------------------ 


"------------------------------------------------
"" https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"------------------------------------------------

