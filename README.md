# nvim-dots
Collection of magic files that turn my neovim into an IDE.

> ⚠️ Hey, if you are already here, check out my [custom Neovim theme](https://github.com/tpaau-17DB/habamax.nvim)!

## Installation
First, make sure you have both [neovim](https://github.com/neovim/neovim) and [packer.nvim](https://github.com/wbthomason/packer.nvim) installed.

You can also install the following language servers, but that's completely up to you:
 - [clangtd](https://github.com/clangd/clangd) - C/C++
 - [omnisharp](https://github.com/OmniSharp/omnisharp-roslyn) - C#
 - [pyright](https://github.com/microsoft/pyright) - python
 - [glsl_analyzer](https://github.com/nolanderc/glsl_analyzer) - GLSL

To copy the files from the `config/` directory, use the script provided in the repo:
```
./install
```
The script will make a `backup/` directory in `~/.config/nvim` if it finds any items there.
Note that if you already have a backup directory, it will get overwritten.

After the installation, open `~/.config/nvim/lua/required/packer.lua`:
```
nvim ~/.config/nvim/lua/required/packer.lua
```

Sync that packages:
```
:PackerSync
```

Then, run checkhealths to confirm everything is working fine:
```
:checkhealth
```
