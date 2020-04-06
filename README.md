# How to install

### 0/ Prepare

(1) Install Plug installer: 

[https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)

**UNIX(and Windows Git Bash):**
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Or simple copy file:
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim save as file ~/.vim/autoload/plug.vim
```

(2) Git CRLF config:
```bash
#On Windows(using CRLF): when checkin auto change CRLF toLF，when checkout auto change LF to CRLF
git config --global core.autocrlf true

#On Linux(using LF): when checkin auto change CRLF to LF，no change when checkout
git config --global core.autocrlf input
```

### 1/ git clone 
```bash
git clone https://github.com/yishilin/RickVim.git ~/RickVim
```

### 2/ edit VIMRC
Where is the vimrc file? Using vim command `:version` you will find output for vimrc.<br>
note: on windows gVim and Git bash vim have different vimrc.

```bash
Edit your vimrc
Copy the CONTENT of ~/RickVim/platform_vimrc.vim to your vimrc file (and change per your need)
```

### 3/ execute command in vim:
```bash
sudo vim #start vim in Linux
:PlugInstall  #install all plugin
:PlugStatus   #plug status
:PlugClean    #remove plugin
```
