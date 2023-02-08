### [INSTALL NEOVIM (Windows)](https://github.com/neovim/neovim/wiki/Installing-Neovim)

[Windows, Neovim pre-built archives](https://github.com/neovim/neovim/wiki/Installing-Neovim#pre-built-archives)

Optional steps:
Add the bin folder (e.g. C:\UTILS\Neovim\bin ) to your PATH (Win-s, environ, Enter).  
This makes it easy to run `nvim` and `nvim-qt` from anywhere.  

[Install from download](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-download)  

[==> Latest stable release](https://github.com/neovim/neovim/releases/tag/stable)  

date: 2023-02M-06 11:39:24

github-actions released this 3 days ago 129264d  
NVIM v0.8.3
Build type: Release
LuaJIT 2.1.0-beta3

Install:
1. Download nvim-win64.zip (Assets 16: nvim-win64.zip)
2. Extract the zip (C:\UTILS\Neovim\bin\nvim-qt.exe)
3. Run nvim-qt.exe



### INSTALL DEPENDENCIES

##### 1. Git
First check if `git` is already installed:  git --version  
Git is required by plugin manager [packer.nvim](https://github.com/wbthomason/packer.nvim) and other git-related plugins.  
For Windows, install [Git for Windows](https://git-scm.com/download/win) and make sure you can run `git` from command line.  

##### 2. Node
node --version  
Install [Node.js - npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) for download packages of LSP language servers.
We need to install `node.js` from [here](https://nodejs.org/en/download/).

##### 3. Nerd Fonts [github repo](https://github.com/ryanoasis/nerd-fonts)
Download [Nerd Font](https://www.nerdfonts.com/font-downloads)  
[See: How to install fonts in Windows 10?](https://support.microsoft.com/en-us/office/add-a-font-b7c5f17c-4426-4b53-967f-455339c564c1)

##### 4. Ripgrep
rg --version  
[Ripgrep](https://github.com/BurntSushi/ripgrep/releases), aka, `rg`, is a fast grepping tool available for both Linux, Windows and macOS.
It is used by several searching plugins.  

ripgrep-13.0.0-x86_64-pc-windows-msvc.zip  
Set its PATH properly and make sure you can run `rg` from command line.  
(C:\UTILS\)

##### 5. fd
fd --version  
fd --help  
[fd](https://github.com/sharkdp/fd/releases) - A simple, fast and user-friendly alternative to [find](https://www.gnu.org/software/findutils/)  
(C:\UTILS\)

##### 6. C compiler
C compiler is required for  
[nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim#make-linux-macos-windows-with-mingw)  
[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#which-c-compiler-will-be-used)  

(my choice) Install [MinGW toolchain](https://www.mingw-w64.org/), and [make](https://www.gnu.org/software/make/)  
or  
Install MSVC toolchain: [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019) and CMake


### References
https://github.com/jdhao/nvim-config#install-and-setup
(Look also: Python, Pynvim)

