
### INTRODUCTION

This is my [Neovim](https://neovim.io) configuration for Windows (See: [Neovim Github repo](https://github.com/neovim/neovim)).  
Info:  [neovim/projects](https://github.com/neovim/neovim/projects?type=classic)  ==>  @bfredl, @tjdevries, @mfussenegger, @folke, ...


`init.lua` is the config entry point for terminal Nvim,
and `ginit.vim` is the additional config file for [GUI client of Nvim](https://github.com/neovim/neovim/wiki/Related-projects#gui).  
Info (My GUI client of Nvim): [neovim-qt](https://github.com/equalsraf/neovim-qt)  
This config is only maintained for [the latest nvim stable release](https://github.com/neovim/neovim/releases/tag/stable).  

A starting point for my configuration is [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).  

---

### FOLDERS AND FILES

```
nvim
├── after
│   └── plugin
│       ├── autocmd.lua
│       ├── commands.lua
│       ├── keymaps.lua
│       └── options.lua
│
├── doc\INSTALL.md
│
├── lua
│   ├── plugins\bufferline.lua, todocomments.lua, ...
│   └── plugins.lua
│
├── plugin\packer_compiled.lua
│
├── templates\HowToTemplate.txt, py.tpl, ...
│
├── ginit.vim
├── init.lua
├── README.md

```


`init.lua`: Main configuration file that call lua modules  

`nvim\lua\` Folder of lua modules, here reside all the Lua modules that needed.  
[See: where-to-put-lua-files](https://github.com/nanotee/nvim-lua-guide#where-to-put-lua-files)


---

### INSTALL AND SETUP

See [doc here](nvim/doc/INSTALL.md) on how to install Neovim and Neovim dependencies.

Check where the config folder is:
```
:echo stdpath("config")
==>  C:\Users\userName\AppData\Local\nvim

:echo stdpath("data")
==>  C:\Users\userName\AppData\Local\nvim-data

Windows command shell:
echo %userprofile%
==>  C:\Users\userName

echo %localappdata%
==>  C:\Users\userName\AppData\Local
```

#### Neovim config and plugins installation

Windows command shell:  `help XCOPY`  
/S    Copy folders and subfolders  
/H    Copy hidden and system files and folders (default=N)

1. Backup your previous configuration (show hidden files and folders)  
`XCOPY %LOCALAPPDATA%\nvim\* nvim\ /S /H`  
and (if you want) archive "nvim-data" folder with `zip` archiver  
( or XCOPY %LOCALAPPDATA%\nvim-data\* nvim-data\ /S /H )

2. Delete folders "nvim" and "nvim-data"  
( Delete file "packer_compiled.lua":  `DEL %LOCALAPPDATA%\nvim\plugin\packer_compiled.lua` )  
Delete folder "nvim":  `RD %LOCALAPPDATA%\nvim\`  
Delete folder "nvim-data":  `RD %LOCALAPPDATA%\nvim-data\`  

3. Download this repo with git  
`git clone https://github.com/mlabrkic/dotfiles.git`

4. Copy the "nvim" folder of this repo into `%LOCALAPPDATA%`  
`XCOPY nvim\* %LOCALAPPDATA%\ /S /H`  

5. Start (1.) Neovim (nvim)  
Ignore any error message about missing plugins!  
==> Wait for:   "packer.nvim - finished in" 463s (7,7 min)  
Quit Neovim -  `:q(uit)` (press Enter)

6. Start (2.) Neovim (nvim)  
"  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'vim' },"  
==> Wait for nvim-treesitter parsers to compile ( 1/9, 2/9, ... , 9/9).  
...  
[4/9] Treesitter parser fo lua has been installed.  
...  
Quit Neovim -  `:q(uit)` (press Enter)

If you want, install manually  
`:TSInstall java`  
`:TSInstallInfo`  
[Windows-support#troubleshooting](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting)  


---

### CHECK IT OUT

<details>
<summary>Various checks</summary>

#### LSP check

Open a source file of one of the supported languages with Neovim, and run command "LspInfo" for testing the LSP support.  
`:LspInfo`

#### Keymaps check

```
:echo mapcheck('<F4>', 'n')
:echo hasmapto('set relativenumber!<CR>', 'n')
```

#### Configuration check

Open nvim and run command "checkhealth", you should not see any error in the output (except for the one related to the Python 2 interpreter if don't have it):  
`:checkhealth`

</details>


---

### PLUGINS with POST-INSTALL/update HOOKS

Plugins can have post-install/update hooks ([Packer.nvim](https://github.com/wbthomason/packer.nvim).)  
It is best to install them **one by one**!

Info:  
-- Regenerate compiled loader file  :PackerCompile  
-- Clean, then install missing plugins  :PackerInstall  
-- Show list of installed plugins  :PackerStatus  
-- Loads opt plugin immediately :PackerLoad trouble.nvim

h packer.compile()



#### [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)  

```
init.lua :

  -- INFO: First install other plugins. After that uncomment this:
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', }  -- mlabrkic
```
To get fzf-native working, you need to build it with either cmake or make:  
* CMake, and the Microsoft C++ Build Tools, or  
* Make, and MinGW (gcc)(my choice)  
( See [doc here](nvim/doc/INSTALL.md#6-c-compiler) on how to install C compiler. )

Check this after installation:  
```
Windows Command shell:
cd %LOCALAPPDATA%\nvim-data\site\pack\packer\start\telescope-fzf-native.nvim\
cd build
dir
==> libfzf.dll exist?
```

<details>
<summary>If libfzf.dll does not exist ...</summary>

.  
A)
Check for "make" (in Neovim):  
:echo executable("make")  
or  
:lua print(vim.fn.executable('make'))

```
Windows Command shell:
make -v
make -h
```

B)
If you have "make":
```
Windows Command shell:
cd %LOCALAPPDATA%\nvim-data\site\pack\packer\start\telescope-fzf-native.nvim\
dir

make
```

C)
If you don't have a "make":
```
Windows Command shell:
cd %LOCALAPPDATA%\nvim-data\site\pack\packer\start\telescope-fzf-native.nvim\

mkdir build
gcc -O3 -Wall -Werror -fpic -std=gnu99 -shared src/fzf.c -o build/libfzf.dll

-->
telescope-fzf-native.nvim\build\libfzf.dll

```

NOTE:
If you want to uninstall this plugin later ...  

* First delete the "build" folder:  
cd %LOCALAPPDATA%\nvim-data\site\pack\packer\start\telescope-fzf-native.nvim\  
RD build\

* Comment plugin in "init.lua"
* Run  :PackerInstall


</details>


\--------------

#### [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

```
nvim\lua\plugins.lua :

  -- Please make sure that you have installed node.js .
  -- INFO: First install other plugins. After that uncomment this:

  use {
    "iamcco/markdown-preview.nvim", ft = { "markdown" },
    run = "cd app && npm install",
    -- requires = { "zhaozg/vim-diagram", "aklt/plantuml-syntax" },
    config = [[require('plugins.v_markdown-preview')]],
  }
```

* Open some markdown file.
* :MarkdownPreview ( `nnoremap <A-m> :<C-U>MarkdownPreview<CR>` )
* Wait cca 15 s.

<details>
<summary>If nothing happened after "MarkdownPreview" command ...</summary>

.  
Nothing happened after "MarkdownPreview" command. No page opened in browser.  
Check for errors `:messages`  
...  
Please make sure that you have installed node.js ( `node --version` ).  
If there are errors, then uninstall the plugin, and repeat everything.

</details>

\--------------

---

### FEATURES

<details>
<summary>I use these plugins</summary>

+ Plugin management via [Packer.nvim](https://github.com/wbthomason/packer.nvim).
+ Code, snippet, word auto-completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
+ Language server protocol (LSP) support via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
+ Git integration via [vim-fugitive](https://github.com/tpope/vim-fugitive).
+ [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Super fast git decorations implemented purely in lua/teal
+ Smarter and faster matching pair management (add, replace or delete) via [vim-sandwich](https://github.com/machakann/vim-sandwich).
+ Fast buffer jump via [hop.nvim](https://github.com/phaazon/hop.nvim).
+ Beautiful statusline via [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
+ Show search index and count with [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens).
+ Command line auto-completion via [wilder.nvim](https://github.com/gelguy/wilder.nvim).
+ Code highlighting via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
+ Markdown writing and previewing via [vim-markdown](https://github.com/preservim/vim-markdown) and [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim).
+ [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine for Neovim written in Lua
+ [indentBlankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Adds indentation guides to all lines (including empty lines)
+ [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - A super powerful autopairs for Neovim
+ ......

</details>

---

### REFERENCES

https://github.com/jdhao/nvim-config  
https://github.com/brainfucksec/neovim-lua  

:help lua-guide  (large part taken from https://github.com/nanotee/nvim-lua-guide)


#### [Learning Lua](https://github.com/nanotee/nvim-lua-guide#learning-lua)

Lua in Y minutes - https://learnxinyminutes.com/docs/lua/  
Lua Quick Guide - https://github.com/medwatt/Notes/blob/main/Lua/Lua_Quick_Guide.ipynb  
( [Lua 5.1 Reference Manual](https://www.lua.org/manual/5.1/) )  


#### [Guides for writing Lua in Neovim](https://github.com/nanotee/nvim-lua-guide#existing-tutorials-for-writing-lua-in-neovim)

+ Devlog | [Build your first Neovim configuration in lua](https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/)  
+ Devlog | [Everything you need to know to configure neovim using lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)  


#### Windows Command shell info

https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands
https://ss64.com/nt/


