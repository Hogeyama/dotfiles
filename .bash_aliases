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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls_ -CF'
alias ll_='ls_ -alF'
alias la_='ls_ -A'

#alias gcc-ppc64='powerpc-linux-gnu-gcc -m64 -static'
#alias run-ppc64='qemu-ppc64'
#alias rm-latex-subproducts='rm *.aux *.dvi *.synctex.gz *.ps *.fls *.fdb_latexmk'


