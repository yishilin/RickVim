How to use vim?

## Indent
LINE SELECT, or NORMAL: 
>, <

## Method list, files list
symbal list: NORMAL mt
file/directory list: NORMAL cd, or ,p
recently file list: Normal mm, or ,h


## Surround
1. You have 3 lines and you want each line add <p>:
1) ctrl+v enter visual block mode (not V)
2) select the content and rows
3) $ to the end of line
4) S<p>

2. You have 3 lines and you want add <p> for the whole 3 lines:
1) V enter visual mode (not Visual block)
2) select the content and rows
3) S<p>

more see 
http://kana.github.io/config/vim/surround.html
https://weibeld.net/vim/surround-plugin.html
https://towardsdatascience.com/how-i-learned-to-enjoy-vim-e310e53e8d56


## Emmet.vim
CN: https://blog.zfanw.com/zencoding-vim-tutorial-chinese/ 
https://medium.com/vim-drops/be-a-html-ninja-with-emmet-for-vim-feee15447ef1


## Toggle Highlight Search
NORMAL: F3


## Comment/UnComment
NORMAL:
,cc 
,cu

LINE SELECT:
,cc
,cc


## Insert Date
INSERT: idate
INSERT: iday


## Open current File in Vscode
Command: :VScodeOpenCurFile
NORMAL: F4


## Copy code as html
1. In LINE SELECT(will only convert selected lines) or NORMAL mode:
:TOhtml
2. use MRU command to copy the generated *.html file
3. open the html file in browser

see https://vim.fandom.com/wiki/Pasting_code_with_syntax_coloring_in_emails
http://vimdoc.sourceforge.net/htmldoc/syntax.html#convert-to-HTML


## Paste over without overwriting register
see https://stackoverflow.com/questions/290465/how-to-paste-over-without-overwriting-register


## Move
word: w, b, e, f, t
WORD(non blank): W, B, E, F, T
; ,
^, 0, $, A, I



=======================================

## Plugins:
https://blog.lourenci.com/my-favorite-vim-plugins/
https://blog.csdn.net/andylauren/article/details/52830328

FZF plugin:
https://segmentfault.com/a/1190000016186540
https://yqc.im/vim-fzf-config.html
https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
https://github.com/junegunn/fzf.vim



## CheetSheet
https://www.fprintf.net/vimCheatSheet.html
https://vimsheet.com/
https://vimsheet.com/advanced.html
