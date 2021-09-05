" ###################################
"
" in MAC create soft link:
" ln -s /Users/rick/local/code/RickVim/_ideavimrc.vim ~/.ideavimrc
"
" ###################################
"
" google: IntelliJ IDEA Action List: https://bit.ly/3n2VPpu

" close the current tab: cmd+w
map <M-w> <ESC>:action CloseContent<CR>

map ,ee <ESC>:edit ~/.ideavimrc<CR>
map ,ss <ESC>:source ~/.ideavimrc<CR>
set clipboard+=unnamed

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmode
set number
"set relativenumber
set scrolloff=3
set history=100000

"map s <Nop>


let mapleader = " " 
map <leader>q :action SearchEverywhere<CR>
map <leader>a :action $SelectAll<CR>
map <leader>b :action GotoDeclaration<CR>
map <leader>c :action $Copy<CR>
map <leader>d :action EditorDuplicate<CR>
map <leader>e :action RecentFiles<CR>
map <leader>h :action TypeHierarchy<CR>
map <leader>i :action ImplementMethods<CR>
map <leader>m :action EditorScrollToCenter<CR>
map <leader>n :action FileChooser.NewFolder<CR>
map <leader>o :action MethodHierarchy.OverrideMethodAction<CR>
map <leader>p :action ParameterInfo<CR>
map <leader>r :action Replace<CR>
"map <leader>s :action SaveAll<CR>
map <leader>t :action Vcs.UpdateProject<CR>
map <leader>u :action GotoSuperMethod<CR>
map <leader>v :action $Paste<CR>
map <leader>w :action EditorSelectWord<CR>
map <leader>x :action $Cut<CR>
map <leader>y :action EditorDeleteLine<CR>
map <leader>[ :action EditorCodeBlockStart<CR>
map <leader>] :action EditorCodeBlockEnd<CR>

imap <c-f>      <Right>
imap <c-b>      <Left>
imap <c-p>      <Up>
imap <c-k>      <Up>
imap <c-n>      <Down>
imap <c-j>      <Down>
imap <c-a>      <Home>
imap <c-e>      <End>
imap <c-l>      <Del>
imap <c-BS>     <c-w>


"imap <C-n> <ESC>:action HippieCompletion<CR>a
"imap <C-p> <ESC>:action HippieBackwardCompletion<CR>a


" Toggle 最大化编辑器内容: ctrl+w
"map <C-w> <ESC>:action HideAllWindows<CR>

map ma :action HideAllWindows<CR>
map mc :action ChooseRunConfiguration<CR>
map md :action ActivateProjectToolWindow<CR>
map mf :action Find<CR>
map mg :action Generate<CR>
map mm :action RecentFiles<CR>
map mr :action ReformatCode<CR>
map ms :action ActivateStructureToolWindow<CR>


map <c-o> :action Back<CR>
map <c-i> :action Forward<CR>



"switch btw test/subject files
map mt :action GotoTest<CR>

map mu :action FindUsages<CR>

nnoremap ,fs :action ToggleFullScreen<CR>

nnoremap <Space>gc :action GotoClass<CR>
nnoremap <Space>ga :action GotoAction<CR>
nnoremap <Space>fp :action ShowFilePath<CR>
nnoremap <Space>pm :action ShowPopupMenu<CR>

"" Refactorings.QuickListPopupAction


" Press `f` to activate AceJump
"map f :action AceAction<CR>
" Press `F` to activate Target Mode
"map F :action AceTargetAction<CR>
" Press `g` to activate Line Mode
"map g :action AceLineAction<CR>


