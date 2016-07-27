shopt -s expand_aliases

complete -f cowsayls
cowsayls(){
	ls $* | cowsay -n
}

ls_(){
	ls $*
}
cd-ls(){
	cd $* && ls -CF
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
alias ocaml='rlwrap ocaml'
alias ocamltop='rlwrap ./ocamltop'
alias vivatcl='vivado -mode tcl'
alias vivabatch='vivado -mode batch -source'
alias csc='ssh csc.is.s.u-tokyo.ac.jp'
alias stack-exec='rlwrap stack exec'

