### [Install Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

[Windows pre-built-archives](https://github.com/neovim/neovim/wiki/Installing-Neovim#pre-built-archives)

Optional steps:
Add the bin folder (e.g. C:\UTILS\Neovim\bin ) to your PATH.
This makes it easy to run nvim and nvim-qt from anywhere.
(Win-s, environ)

init.vim ("vimrc"): If you already have Vim installed you can copy
%userprofile%\_vimrc
to
%userprofile%\AppData\Local\nvim\init.vim
to use your Vim config with Neovim.

Windows command shell:
echo %userprofile%


[install-from-download](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-download)  

[Latest stable release](https://github.com/neovim/neovim/releases/tag/stable)  

date: 2023-02M-06 11:39:24

ithub-actions released this 3 days ago 129264d  
NVIM v0.8.3
Build type: Release
LuaJIT 2.1.0-beta3

Install Windows:  
1. Download nvim-win64.zip (Assets 16: nvim-win64.zip)  
2. Extract the zip (C:\UTILS\Neovim\bin\nvim-qt.exe)
3. Run nvim-qt.exe



### Install dependencies

##### Git

git --version  
Git is required by plugin manager [packer.nvim](https://github.com/wbthomason/packer.nvim) and other git-related plugins.  
For Windows, install [Git for Windows](https://git-scm.com/download/win) and make sure you can run `git` from command line.


##### Node

node --version  
We need to install node.js from [here](https://nodejs.org/en/download/).


##### Ripgrep

rg --version  
[Ripgrep](https://github.com/BurntSushi/ripgrep/releases), aka, `rg`, is a fast grepping tool available for both Linux, Windows and macOS.
It is used by several searching plugins.  

ripgrep-13.0.0-x86_64-pc-windows-msvc.zip  
Set its PATH properly and make sure you can run `rg` from command line.


##### [fd](https://github.com/sharkdp/fd)

A simple, fast and user-friendly alternative to [find](https://www.gnu.org/software/findutils/)


##### c compiler - gcc or tcc or zig

https://github.com/nvim-telescope/telescope-fzf-native.nvim#make-linux-macos-windows-with-mingw  

https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#which-c-compiler-will-be-used  

(my choice) Install [MinGW toolchain](https://www.mingw-w64.org/), and [make](https://www.gnu.org/software/make/)  
or  
Install MSVC toolchain: [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019) and CMake


