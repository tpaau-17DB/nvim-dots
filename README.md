# nvim-dots
A collection of magic files that turn my neovim into an IDE.


## Installation
First, make sure you have both [neovim](https://github.com/neovim/neovim) and [packer.nvim](https://github.com/wbthomason/packer.nvim) installed.

You can also install the following language servers, but that's completely up to you:
 - [clangtd](https://github.com/clangd/clangd) - C/C++
 - [omnisharp](https://github.com/OmniSharp/omnisharp-roslyn) - C#
 - [pyright](https://github.com/microsoft/pyright) - python
 - [glsl_analyzer](https://github.com/nolanderc/glsl_analyzer) - GLSL
 - [ts_ls](https://github.com/typescript-language-server/typescript-language-server) - TypeScript

To copy the files from the `config/` directory, use the script provided in the repo:
```
./install
```
The script will make a `backup/` directory in `~/.config/nvim` if it finds any items there.
Note that if you already have a backup folder, it will get overwritten.

After the installation, open `~/.config/nvim/lua/required/packer.lua`:
```
nvim ~/.config/nvim/lua/required/packer.lua
```

Source the file and sync that packages:
```
:so
:PackerSync
```
