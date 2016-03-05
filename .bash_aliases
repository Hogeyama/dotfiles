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
alias pandoc-md='pandoc -s -f markdown+tex_math_double_backslash+lists_without_preceding_blankline+ignore_line_breaks --latex-engine=xelatex'
alias open='xdg-open'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls_ -CF'
alias ll_='ls_ -alF'
alias la_='ls_ -A'

#alias gcc-ppc64='powerpc-linux-gnu-gcc -m64 -static'
#alias run-ppc64='qemu-ppc64'
#alias rm-latex-subproducts='rm *.aux *.dvi *.synctex.gz *.ps *.fls *.fdb_latexmk'


