
"dein{{{
if has('vim_starting')
  set runtimepath+=~/.nvim/dein/repos/github.com/Shougo/dein.vim/
endif

call dein#begin(expand('~/.nvim/dein'))

filetype plugin indent on

"essential
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/vimshell')
call dein#add('Shougo/vimproc')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('thinca/vim-quickrun')
call dein#add('scrooloose/nerdtree')
call dein#add('kana/vim-submode')
"便利,拡張
call dein#add('vim-scripts/zoom.vim')
call dein#add('Shougo/unite-outline')
call dein#add('vim-scripts/Align')
call dein#add('kana/vim-smartinput')
call dein#add('kana/vim-textobj-user')
call dein#add('osyo-manga/vim-textobj-multiblock')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
"text-typeとか
call dein#add('lervag/vimtex')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('itchyny/vim-haskell-indent')
"Motion
call dein#add('Lokaltog/vim-easymotion')
call dein#add('rhysd/clever-f.vim')
"Haskell
call dein#add('thinca/vim-ref')
call dein#add('ujihisa/ref-hoogle')
call dein#add('eagletmt/unite-haddock')
call dein#add('eagletmt/neco-ghc')
call dein#add('eagletmt/ghcmod-vim')
"MarkDown
call dein#add('Bakudankun/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('vim-pandoc/vim-pandoc')
call dein#add('vim-pandoc/vim-pandoc-syntax')
"Scheme
call dein#add('losingkeys/vim-niji')
"Color Scheme
call dein#add('zsoltf/vim-maui')
call dein#add('djjcast/mirodark')
call dein#add('nanotech/jellybeans.vim')
call dein#add('w0ng/vim-hybrid')
call dein#add('miyakogi/seiya.vim')
call dein#add('tomasr/molokai')
call dein#add('chriskempson/tomorrow-theme')
call dein#add('chriskempson/vim-tomorrow-theme')
call dein#add('djjcast/mirodark')
call dein#add('sickill/vim-monokai')
call dein#add('ciaranm/inkpot')
call dein#add('vim-scripts/pyte')
"
call dein#add('benekastah/neomake')
"Coq
call dein#add('jvoorhis/coq.vim')
call dein#add('eagletmt/coqtop-vim')

call dein#end()
"}}}

"各種設定"{{{
set fileencoding=utf-8
set termencoding=utf-8

filetype plugin on
filetype indent on
"カーソルの形状
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
"カラースキーム
set background=dark
colorscheme maui
"マーカー
set foldmethod=marker
"ビープ音無効
set visualbell t_vb=
"保存されていないファイルがあっても他を開ける
set hidden
"シンタックスハイライトを有効にする
syntax on
"モードラインをONにする
set modeline
"メニューバーを非表示にする
set guioptions-=m
"水平スクロールバーを非表示にする
set guioptions-=b
"行数を表示
set number
"タブの設定
set expandtab
set tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType vim setlocal et sw=2 sts=2
"インデントの設定
set autoindent
set smartindent
"スワップファイルを作成しない
set noswapfile
"バックアップファイルを作成しない
set nobackup
"安藤ファイルを作成しない
set noundofile
"conceal許すまじ
set conceallevel=0
"ステータスラインを常に表示
set laststatus=2
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"他で書き換えられたら自動で読み直す
set autoread
"カーソルの上または下に表示する最小限の行数
set scrolloff=5
"コマンドラインモードで保存する履歴件数
set history=100
"コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
"検索時に大文字・小文字を区別しない
set ignorecase
"ただし、検索後に大文字小文字が混在しているときは区別する
set smartcase
"不可視文字を可視化する
set list
set listchars=tab:>.,trail:_
""行を跨げるようにする
set whichwrap =b,s,h,l,<,>,[,]
"BS
set backspace=indent,eol,start
"grepはquickfixで
autocmd QuickFixCmdPost *grep* cwindow

set statusline=\ %f\ %y%m%r%w%q\ %=(%l,%v)[%p%%]\ %{fnamemodify(getcwd(),':~')}\ \ \ 
set wildmode=longest:full,full
"}}}

"Unite{{{
"設定
call unite#custom#profile('default', 'context', {
  \   'start_insert': 0,
  \   'winheight': 5,
  \   'winwidth': 40,
  \   'direction': 'botright',
  \ })
call unite#custom#source('file',
  \   'ignore_pattern','\.\(hi\|o\|log\|gz\|dvi\|aux\|fdb_latexmk\)$')
"ヤンク履歴許可
let g:unite_source_history_yank_enable=0
"ファイル履歴最大
let g:unite_source_file_mru_limit=200
"unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
"grep
nnoremap <silent> <Space>g  :<C-u>Unite grep:. -winheight=20 -buffer-name=search-buffer<CR>
"grep検索結果の再呼出
nnoremap <silent> <Space>rg  :<C-u>UniteResume search-buffer<CR>
""ファイル操作
nnoremap <C-u><C-y> :<C-u>Unite history/yank<CR>
nnoremap <C-u><C-b> :<C-u>Unite buffer<CR>
nnoremap <C-h>      :<C-u>Unite file_mru<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ?
    \ quickrun#sweep_sessions() : ":UniteWithBufferDir -buffer-name=files file<CR>"
nnoremap <C-u><C-o> :Unite -vertical outline<CR>


"}}}

"QuickFix"{{{
let QFix_Height=5
"above didn't work
au FileType qf call AdjustWindowHeight(1, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
"}}}

"QuickRun{{{
let g:quickrun_config = {}
let g:quickrun_config = {
  \ '_' : {
  \ 'runner/vimproc/updatetime' : 40,
  \ 'outputter' : 'quickfix',
  \ 'hook/copen/enable_exit' : 1,
  \ 'runner' : 'vimproc',
  \ },
  \ 'haskell' : {
  \ 'command' : 'stack',
  \ 'cmdopt' : 'runghc',
  \ 'exec' : '%c %o %s'
  \},
  \ 'pandoc' : {
  \ 'command' : 'pandoc',
  \ 'cmdopt' : '-f markdown+tex_math_double_backslash+lists_without_preceding_blankline --latex-engine=xelatex',
  \ 'exec' : '%c %s %o -s -o output.tex'
  \ },
  \}
call watchdogs#setup(g:quickrun_config)
"}}}

"{{{Neomake
let g:neomake_airline=1
let g:neomake_open_list=1
let g:neomake_place_signs=0
let g:neomake_echo_current_error=0
let g:neomake_haskell_hlint_remove_invalid_entries=1
let g:neomake_haskell_ghcmod_remove_invalid_entries=1
let g:neomake_haskell_runghc_remove_invalid_entries=1
nnoremap ,g :update!<CR>:NeomakeSh ghc-mod check %<CR>
nnoremap ! :NeomakeSh 
"}}}

"VimFiler{{{
"safe modeを切る
let g:vimfiler_safe_mode_by_default = 0
"デフォルトのエクスプローラーにする
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'edit_action' : 'tabopen',
      \ })
"}}}

"NERD_tree"{{{
let NERDTreeWinPos='right'
let NERDTreeWinSize=32
let NERDTreeDirArrows=1
"}}}

"deoplete neosnippet{{{
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
" <Tab>で選ぶ
inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"BS
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
"Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ }
"Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
endif

"neosnippet
imap <C-f> <Plug>(neosnippet_expand_or_jump)
smap <C-f> <Plug>(neosnippet_expand_or_jump)
xmap <C-f> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = '~/.nvim/snippets'
"}}}

"submode{{{
call submode#enter_with('winsize', 'n', '', 'z>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', 'z<', '<C-w><')
call submode#enter_with('winsize', 'n', '', 'z+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', 'z-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
"}}}

"smartinput{{{
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
  \   'at'    : '{\%#}',
  \   'char'  : '<CR>',
  \   'input' : '<CR><Left><CR><Tab>',
  \   })

call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')
call smartinput#define_rule({
            \   'at'    : '(\%#)',
            \   'char'  : '<Space>',
            \   'input' : '<Space><Space><Left>',
            \   })"}}}

"C"{{{
autocmd FileType c setlocal expandtab tabstop=4
"}}}

"Haskell"{{{
autocmd FileType haskell setlocal expandtab tabstop=2 foldmethod=marker
autocmd FileType haskell nnoremap <buffer> ,t :update!<CR>:GhcModType<CR>
autocmd FileType haskell nnoremap <buffer> ,T :update!<CR>:GhcModTypeInsert<CR>
autocmd FileType haskell nnoremap <buffer> ,i :update!<CR>:GhcModInfo<CR>
autocmd FileType haskell nnoremap <buffer> ,I :update!<CR>:GhcModInfoPreview<CR>
autocmd FileType haskell nnoremap <buffer> ,w :update!<CR>:GhcModCheckAsync<CR>
autocmd FileType haskell nnoremap <buffer> ,l :update!<CR>:GhcModLint<CR>
autocmd FileType haskell nnoremap <buffer> ,h :Unite hoogle<CR>
autocmd FileType haskell nnoremap <buffer> ,c :noh<CR>:GhcModTypeClear<CR>
call unite#custom_default_action('source/hoogle', 'preview')
let g:haskell_conceal       = 0
let g:haskell_tabular       = 0
let g:haskell_hsp           = 0
let g:haskell_quasi         = 0
let g:haskell_interpolation = 0
let g:haskell_regex         = 0
let g:haskell_jmacro        = 0
let g:haskell_shqq          = 0
let g:haskell_sql           = 0
let g:haskell_json          = 0
let g:haskell_xml           = 0
autocmd FileType cabal   setlocal expandtab tabstop=4
"}}}

"OCaml"{{{
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
autocmd FileType ocaml nnoremap <buffer> ,t :update!<CR>:MerlinTypeOf<CR>
autocmd FileType ocaml vnoremap <buffer> ,t :MerlinTypeOfSel<CR>
autocmd FileType ocaml nnoremap <buffer> >  :MerlinGrowEnclosing<CR>
autocmd FileType ocaml nnoremap <buffer> <  :MerlinShrinkEnclosing<CR>

autocmd FileType ocaml nnoremap <buffer> ,o :update!<CR>:MerlinOutline<CR>
autocmd FileType ocaml nnoremap <buffer> ,w :update!<CR>:MerlinErrorCheck<CR>
autocmd FileType ocaml nnoremap <buffer> <C-j> :update!<CR>:MerlinLocate<CR>
autocmd FileType ocaml nnoremap <buffer> ,c :noh<CR>a<Esc>
autocmd FileType ocaml nnoremap <buffer> <C-q> :update!<CR>:OCamlExpr 
autocmd FileType ocaml setlocal tabstop=2 shiftwidth=2 softtabstop=0
autocmd FileType ocaml colorscheme hybrid
autocmd FileType ocaml GoodMatchParen
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "helptags " . g:opamshare . "/merlin/vim/doc"

"}}}

"LaTeX{{{
let g:vimtex_view_general_viewer = 'apvlv'
au BufRead,BufNewFile *.tex set filetype=tex
let g:vimtex_complete_close_braces = 1
let g:vimtex_latexmk_options = '-xelatex'

"有用そう
"   <localleader>lY  |<plug>(vimtex-labels-toggle)|        `n`
"   <localleader>ll  |<plug>(vimtex-compile-toggle)|       `n`
"   <localleader>lk  |<plug>(vimtex-stop)|                 `n`
"}}}

"MarkDown/Pandoc{{{
augroup pandoc_syntax
    au! BufNewFile,BufFilePRe,BufRead *.md set filetype=pandoc
augroup END
autocmd FileType pandoc setlocal et sw=2 sts=2 foldmethod=marker
autocmd FileType pandoc let &spell = 0

let g:previm_enable_realtime = 1
let g:vim_markdown_math = 1
let g:pandoc#folding#mode = 'marker'
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#modules#disabled = ["folding"]

let g:pandoc_md_out='out.tex'
command! -nargs=? PandocMd call PandocMdFun(<f-args>)
function! PandocMdFun(...) abort
  let s = 'pandoc-md ' . expand('%') . ' -o '. (a:0 == 0? g:pandoc_md_out: a:1)
  call neomake#Sh(s)
endfunction
autocmd FileType pandoc nnoremap <buffer> <C-q> :update!<CR>:PandocMd<CR>
"}}}

"scheme{{{
autocmd FileType scheme setlocal iskeyword=@,33,35-38,42-43,45-58,60-64,94,_,126
autocmd FileType scheme setlocal et ts=2 sts=2 sw=2
"}}}

"multiblock{{{
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)
"}}}

"EasyMotion{{{
let g:EasyMotion_keys='jfkdlamvneioc'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_enter_jump_first = 1
"}}}

"clever-f.vim{{{
let g:clever_f_smart_case = 1
let g:clever_f_chars_match_any_signs = ';'
"}}}

"キーマッピング{{{
nnoremap dk ddk
nnoremap dj dd
nnoremap Y  y$
"<C-d> $
inoremap <C-d> $
"ttでtabnew
nnoremap <silent> tt  :<C-u>tabe<CR>
"tgで前のタブ
nnoremap tg gT
"<space>oで改行
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
"jkで<esc>
inoremap jk <Esc>
nnoremap <C-]> <Esc>
cnoremap <C-]> <Esc>
"<Space>\で保存
nnoremap <C-\> :update!<CR>
inoremap <C-\> <Esc>:update!<CR>
"qで閉じる
nnoremap q :q
"移動
nnoremap <C-a> I
nnoremap <C-e> A
noremap J 5j
noremap K 5k
noremap H B
noremap L W
"物理行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
"削除関連
noremap dw diw
noremap diw dw
noremap cw ciw
noremap ciw cw
noremap yw yiw
noremap yiw yw
"window関連
nnoremap zh <C-w>h
nnoremap zj <C-w>j
nnoremap zk <C-w>k
nnoremap zl <C-w>l
nnoremap zo <C-w>_
nnoremap cj <C-w>j:q<CR><C-w>k
nnoremap ck <C-w>k:q<CR><C-w>j
nnoremap ch <C-w>h:q<CR><C-w>l
nnoremap cl <C-w>l:q<CR><C-w>h
"折りたたみ
nnoremap zn za
"paste mode
nnoremap <F10> :set paste<CR>
autocmd InsertLeave * set nopaste
"インサートモードでいろいろ
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>
"inoremap <expr><C-h> neocomplete#close_popup() . "\<Left>"
"inoremap <expr><C-l> neocomplete#close_popup() . "\<Right>"
inoremap <C-b> <esc>lBi
inoremap <expr><C-n> deoplete#mappings#close_popup()."<Esc>lWi"
inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
inoremap <C-o> <esc>o
"コマンドライン上下
cnoremap <C-j> <down>
cnoremap <C-k> <up>
"<Space>cdで開いているファイルのディレクトリに移動する
nnoremap <Space>cd :cd %:h<CR>
nnoremap <Space>n  :NERDTreeToggle<CR>
nnoremap <Space>pj :NERDTree ~/Dropbox/pj<CR>
"QuickRun関連
nnoremap <C-q> :QuickRun<CR>
nnoremap <C-q> :QuickRun -exec "gcc -ansi report.c ; ./a.out <input.txt"<CR>
nnoremap <Space>m :update!<CR>:cd %:h<CR>:QuickRun -exec "make "<Left>
nnoremap <Space>r :update!<CR>:cd %:h<CR>:QuickRun -exec "make run"<CR>
nnoremap <Space>t :update!<CR>:cd %:h<CR>:QuickRun -exec "fast-tags -R ./"<CR>
nnoremap ,w :update!<CR>:WatchdogsRun<CR>
autocmd FileType haskell nnoremap <buffer> <Space>w :update!<CR>:GhcModCheckAsync<CR>
"ctag
nnoremap <C-j> <C-]>
"VimFiler
nnoremap <Space>e :VimFilerCurrentDir<CR>
"VimShell
nnoremap <Space>sh  :VimShell<CR>
nnoremap <Space>sht :VimShellTab<CR>
nnoremap <Space>si  :VimShellInteractive 
"Quickrun
nnoremap <C-q> :update!<CR>:QuickRun<CR>
"""EasyMotion
"s{char}{char}{label}
nmap s <Plug>(easymotion-s2)
nmap s <Plug>(easymotion-s2)
"w/e motion
nmap w <Plug>(easymotion-bd-w)
nmap W <Plug>(easymotion-bd-W)
nmap e <Plug>(easymotion-bd-e)
nmap E <Plug>(easymotion-bd-E)
vmap w <Plug>(easymotion-bd-w)
vmap W <Plug>(easymotion-bd-W)
vmap e <Plug>(easymotion-bd-e)
vmap E <Plug>(easymotion-bd-E)
"検索
nmap <C-g> <Plug>(easymotion-sn)
nnoremap ,c :noh<CR>
"}}}

autocmd FileType json set conceallevel=0
let @a = "->"
let @b = "<-"

nnoremap .. :cd..<CR>
nnoremap <Space>se :SeiyaEnable<CR>
nnoremap <Space>sd :SeiyaDisable<CR>
nnoremap te :vs<CR><C-w>l:te<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap jk    <C-\><C-n>
tnoremap JK    <C-\><C-n><C-w>h
tnoremap zh    <C-\><C-n><C-w>h
tnoremap zj    <C-\><C-n><C-w>j
tnoremap zk    <C-\><C-n><C-w>k
tnoremap zl    <C-\><C-n><C-w>l
tnoremap <C-k> <Up>
tnoremap <C-j> <Down>
tnoremap <C-h> <Left>
tnoremap <C-l> <Right>

let $BASH_ENV='~/.bashenv'
let g:previm_open_cmd="google-chrome"

command! -nargs=1 MV call system("[ ! -f <args> ]rm ".expand("%")) | :file <args> | :w!

command! GoodMatchParen hi MatchParen ctermfg=253 ctermbg=0
au VimEnter * GoodMatchParen

"OCamlExpr"
command! -nargs=? OCamlExpr call OCamlExprFun(<f-args>)
function! OCamlExprFun(...) abort
  let tmp_init  = '/tmp/ocamlexpr_init'
  let pwd_init  = expand('%:h').'/.ocamlinit'
  let home_init = expand('~/.ocamlinit')

  call writefile([], tmp_init)
  if filereadable(pwd_init)
    call writefile(readfile(pwd_init), tmp_init, 'a')
  elseif filereadable(home_init)
    call writefile(readfile(home_init), tmp_init, 'a')
  endif
  call writefile(readfile(expand('%')), tmp_init, 'a')

  let tmp_source = '/tmp/ocamlexpr_source'
  let expr = a:0==0? '': a:1
  call writefile([expr.';;'], tmp_source)

  let cmd = "cat ".tmp_source." | "."ocaml -init ".tmp_init
  call neomake#Sh(cmd)
endfunction

"vim: set et ts=2 sts=2 tw=2:
