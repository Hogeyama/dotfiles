shopt -s expand_aliases

complete -f cowsayls
cowsayls(){
	ls $* | cowsay -n
}

ls_(){
	ls $*
}
cd-ls(){
	cd $* && ls
}

alias cd='cd-ls'
alias ls='cowsayls'

# some more ls aliases
alias l='ls_ -CF'
alias ll='ls -alF'
alias la='ls -A'
alias ll_='ls_ -alF'
alias la_='ls_ -A'

#others
alias mkcd='source ~/.local/bin/mkcd.sh'
alias xelatexmk='latexmk -xelatex'
alias gcc-ppc64='powerpc-linux-gnu-gcc -m64 -static'
alias ocaml='rlwrap ocaml'
alias ocamltop='rlwrap ./ocamltop'
alias vivado='vivado -mode tcl'

