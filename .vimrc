set number
set relativenumber
set tabstop=4   " tab size eql 4 spaces

let vibrantink=expand("${HOME}/.vim/colors/vibrantink.vim")
if !filereadable(vibrantink)
    silent !mkdir -p ~/.vim/colors/
	silent !curl -Ls https://raw.githubusercontent.com/vim-scripts/vibrantink/master/colors/vibrantink.vim -o "${HOME}/.vim/colors/vibrantink.vim"
endif

colorscheme vibrantink
syntax enable
