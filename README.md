# How to install

## 0/ Prepare

(1) Install Plug installer:

[https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)

**UNIX(and Windows Git Bash):**
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Or simple copy file:
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim save as file ~/.vim/autoload/plug.vim
```

**Windows (PowerShell):**
``` powershell
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"
  )
)
```

(2) Git CRLF config:

Pls first ensure you could run `git` in your operation syste by https://git-scm.com

```bash
#On Windows(using CRLF): when checkin auto change CRLF toLF，when checkout auto change LF to CRLF
git config --global core.autocrlf true

#On Linux(using LF): when checkin auto change CRLF to LF，no change when checkout
git config --global core.autocrlf input
```

## 1/ git clone
```bash
git clone https://github.com/yishilin/RickVim.git ~/RickVim
```

## 2/ edit VIMRC
Where is the vimrc file? Using vim command `:version` you will find output for vimrc.<br>
note: on windows gVim and Git bash vim have different vimrc.

```bash
Edit your vimrc
Copy the CONTENT of ~/RickVim/platform_vimrc.vim to your vimrc file (and change per your need)
```
Note:
You need first comment the line of `colorscheme molokai` before the `:PlugInstall`,
after the installation finish, remember to uncomment it back.


## 3/ execute command in vim:
```bash
sudo vim #start vim in Linux
:PlugInstall  #install all plugin
:PlugStatus   #plug status
:PlugClean    #remove plugin
```

Uncomment the line of `colorscheme molokai`

## 4/ (Optional) Powershell setting

* Install http://ctags.sourceforge.net/ (ctags.exe into path)
  * Ubuntu/apt: sudo apt-get install ctags
  * Ubuntu/sudo: sudo snap install ctags
  * Mac/brew: brew install ctags

* https://github.com/majutsushi/tagbar
* add below content to vim ~/ctags.cnf (On Win7)

```bash
--langdef=powershell
--langmap=powershell:.ps1.psm1
--regex-powershell=/^[Ff]unction[\t ]* ([a-zA-Z0-9_-]+)/\1/f,function/
--regex-powershell=/^[Ff]ilter[\t ]* ([a-zA-Z0-9_-]+)/\1/i,filter/
--regex-powershell=/^[Ss]et-[Aa]lias[\t ]* ([a-zA-Z0-9_-]+)/\1/a,alias/
--regex-powershell=/^[Cc]lass[\t ]* ([a-zA-Z0-9_-]+)/\1/c,class/
--regex-powershell=/^\s*[Cc]lass[\t ]* ([a-zA-Z0-9_-]+)[\t ]+:[\t ]+([a-zA-Z0-9_-]+)/\1 : \2/d,class inherited/
--regex-powershell=/^.*([Ff]unction){0} ([a-zA-Z]+-[a-zA-Z0-9_]+)/\1/h,functionCall/
--regex-powershell=/^\s*#[rR]egion[\t ]*([a-zA-Z0-9_ -]+)\s*$/\1/r,region/
--regex-powershell=/\$(global:)?([a-zA-Z\-]+)/\2/v, variable/i
--regex-Powershell=/function\s+(script:)?([a-zA-Z\-]+)/\2/m, method/i
--languages=+powershell

```

## 5/ (Optional) Zsh
sudu apt-get install zsh

install https://ohmyz.sh/
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```bash



vim ~/.tmux.conf
```bash

```



## 6/ (Optional) Ruby

```bash
1. install ruby: https://rubyinstaller.org/
2. install gem m for ruby unit test
$ gem install m
```

## enhance the search
ack.vim for quick search
https://chocolatey.org/packages/ack
Windows (admin powershell): `choco install ack`

https://github.com/chinanf-boy/ripgrep-zh
windows: `choco install ripgrep`
rg -h

https://www.freecodecamp.org/news/how-to-search-project-wide-vim-ripgrep-ack/
https://www.hi-linux.com/posts/29245.html (*great doc*)
https://docs.rs/regex/1.3.5/regex/#syntax  
https://www.jb51.net/article/174964.htm

递归搜索，当前目录搜索 fast，包括所有子目录：rg fast
在 README.md 中查找 fast: rg fast README.md
一个单词中包含 fast，不包括 fast(正则表达式)：rg 'fast\w+'
一个单词中包含 fast，包括 fast: rg 'fast\w*'


根据需要使用-E参数来改编码，搜中文时更是如此，如果编码不对根本搜不到。 当不加-E参数时，可以搜到utf-8的文件，搜不到gkb的文件；当加上-E GBK，结果又反过来，可以搜到gbk文件，搜不到utf-8的文件：

