" ################################################################################
" #                                           
" #  _    _   _ _               _             author: t.tiberius
" # | |  | | (_) |             (_)            usage:
" # | |_ | |_ _| |__   ___ _ __ _ _   _ ___     neovim configuration file
" # | __|| __| | '_ \ / _ \ '__| | | | / __|    
" # | |_ | |_| | |_) |  __/ |  | | |_| \__ \    
" #  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/    
" #                                             
" ################################################################################

source $HOME/.config/nvim/lib/hello.vim

source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/neovide.vim
source $HOME/.config/nvim/keys/mapping.vim
source $HOME/.config/nvim/themes/molokai.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/plug-config/nerdcommenter.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/telescope.vim

luafile $HOME/.config/nvim/lua/plug-colorizer.lua
luafile $HOME/.config/nvim/lua/neo-tree.lua

