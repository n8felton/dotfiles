set number
set relativenumber
set tabstop=4   " tab size eql 4 spaces

let monokai=expand("${HOME}/.vim/colors/monokai.vim")
if !filereadable(monokai)
    silent !mkdir -p ~/.vim/colors/
	silent !curl -Ls https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -o "${HOME}/.vim/colors/monokai.vim"
endif

colorscheme monokai
syntax enable
