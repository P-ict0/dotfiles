# My Own Neovim config
This is my personal neovim config that I use in a day to day basis.
The aim of this repo is to be able to take my config files wherever I want and maybe inspire others to build their own configs.

<hr>

## Installation
It is important to note that the config <mark>only works on Linux systems or wsl</mark> and on <mark>neovim</mark> because of the folder structure.

### Getting the config files and folders.
In the `$HOME/.config` directory, you just have to clone the repo as `git clone https://github.com/Yoquec/nvim.git` to get all the config files.

### Installing neovim
To install neovim, use your built-in package manager. For example, in debian based systems (Ubuntu, mint, PopOs, etc) you can just run `sudo apt install neovim`.

### Installing vim-plug
In order to get all the extensions working you need to install [vim-plug](https://github.com/junegunn/vim-plug "Official vim-plug repo"), which you can install on it's official repo.

### Installing and updating nodejs
For the language servers for code completion, you will need the LTS version of nodejs.
You can install nodejs with nvm (Node Version Manager), a bash script which handles node version installation.
Nvm can be installed in it's correspondent [nvm repo](https://github.com/nvm-sh/nvm "Official nvm repo").
Once installed, run the bash command `nvm install --lts` to install the latest lts version of nodejs.

### Installing the plugins
Once you have everything installed and ready to go, enter vim and type `:PlugInstall` to install all the plugins.

# Have fun playing around the config and setting everything as you wish!
