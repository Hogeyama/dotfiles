
"dein {{{

filetype plugin indent on
set runtimepath+=~/.nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.nvim/dein'))
call dein#add('repos/github.com/Shougo/dein.vim')

"essential
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/vimproc')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('thinca/vim-quickrun')
call dein#add('kana/vim-submode')
call dein#add('kien/ctrlp.vim')
call dein#add('benekastah/neomake')
call dein#add('kassio/neoterm')
"便利
call dein#add('Shougo/deol.nvim')
call dein#add('vim-scripts/zoom.vim')
call dein#add('Shougo/unite-outline')
call dein#add('vim-scripts/Align')
call dein#add('kana/vim-smartinput')
call dein#add('kana/vim-textobj-user')
call dein#add('osyo-manga/vim-textobj-multiblock')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('scrooloose/nerdcommenter')
call dein#add('majutsushi/tagbar')
call dein#add('bitc/lushtags')
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
"text-typeとか
call dein#add('lervag/vimtex')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')
call dein#add('derekelkins/agda-vim')
"Motion
call dein#add('Lokaltog/vim-easymotion')
call dein#add('rhysd/clever-f.vim')
"Haskell
" indentはhaskell-vimから|を消すのがよい
call dein#add('thinca/vim-ref')
call dein#add('ujihisa/ref-hoogle')
call dein#add('eagletmt/unite-haddock')
call dein#add('eagletmt/neco-ghc')
"call dein#add('eagletmt/ghcmod-vim')
call dein#add('vim-scripts/alex.vim')
call dein#add('vim-scripts/happy.vim')
call dein#add('neovimhaskell/neovim-ghcmod')
call dein#add('ujihisa/unite-haskellimport')
"Scala
call dein#add('derekwyatt/vim-scala')
call dein#add('ensime/ensime-vim')
call dein#add('ktvoelker/sbt-vim')
call dein#add('rhysd/vim-llvm')
"MarkDown
call dein#add('Bakudankun/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('vim-pandoc/vim-pandoc')
call dein#add('vim-pandoc/vim-pandoc-syntax')
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
"Coq
call dein#add('jvoorhis/coq.vim')
call dein#add('eagletmt/coqtop-vim')

call dein#end()
"}}}

"各種設定"{{{
set fileencoding=utf-8
set termencoding=utf-8
let mapleader=","
let maplocalleader=","

filetype plugin on
filetype indent on
"カーソルの形状
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
"マウス
set mouse=
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
au FileType vim setlocal et sw=2 sts=2
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
au QuickFixCmdPost *grep* cwindow

set statusline=\ %f\ %y%m%r%w%q\ %=(%l,%v)[%p%%]\ %{fnamemodify(getcwd(),':~')}\ \ \ 
set wildmode=longest:full,full
"}}}

"Unite{{{
"設定
call unite#custom#profile('default', 'context', {
\   'start_insert': 0,
\   'winheight': 10,
\   'winwidth': 40,
\   'direction': 'botright',
\   'prompt_direction' : 'top'
\ })
call unite#custom#source('file',
\   'ignore_pattern','\.\(hi\|o\|log\|gz\|dvi\|aux\|fdb_latexmk\)$')
"ヤンク履歴許可
let g:unite_source_history_yank_enable=100
"ファイル履歴最大
let g:unite_source_file_mru_limit=100

"""map
nnoremap [unite] <nop>
nmap     <C-u> [unite]
nnoremap [unite]g  :Unite grep -no-quit<CR>
"grep検索結果の再呼出
nnoremap [unite]rg  :<C-u>UniteResume<CR>
""ファイル操作
nnoremap [unite]y :Unite history/yank<CR>
nnoremap [unite]b :Unite buffer<CR>
nnoremap [unite]h :Unite file_mru<CR>
nnoremap [unite]o :Unite -vertical outline<CR>
nnoremap <C-h>    :Unite file_mru<CR>
nnoremap <expr><silent> <C-c>
\ quickrun#is_running() ?
\ quickrun#sweep_sessions() :
\ ":UniteWithBufferDir -buffer-name=files file<CR>"
"""unite map
au FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  imap <buffer> jk        <Plug>(unite_insert_leave)
  imap <buffer> <TAB>     <Plug>(unite_select_next_line)
  imap <buffer> <S-TAB>   <Plug>(unite_select_previous_line)
  nmap <buffer> <C-j>     <Plug>(unite_select_next_line)
  nmap <buffer> <C-k>     <Plug>(unite_select_previous_line)
endfunction"}}}

"}}}

"Denite"{{{
"今のところfile_mru以外はuniteでいいかなという気持ち
"autoload/denite/init.vimを編集する必要があるかも
hi CursorLine ctermbg=8
call denite#custom#map('_', "<Tab>", 'move_to_next_line')
call denite#custom#map('_', "<S-Tab>", 'move_to_prev_line')
call denite#custom#map('insert', "\<C-j>", 'move_to_next_line')
call denite#custom#map('insert', "\<C-k>", 'move_to_prev_line')
call denite#custom#map('insert', "jk", 'enter_mode:normal')
nnoremap <C-h>
    \ :call denite#start([{'name': 'file_mru', 'args': []}]
    \                    ,{'winheight': 10
    \                     ,'mode': 'normal'})<CR>
nnoremap <C-u>r
    \ :call denite#start([{'name': 'file_rec', 'args': []}]
    \                    ,{'winheight': 10
    \                     ,'mode': 'normal'})<CR>
nnoremap <Space>d :Denite -mode=nomal -winheight=10 
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
let g:quickrun_config = {
\ '_' : {
\ 'runner/vimproc/updatetime' : 40,
\ 'outputter' : 'quickfix',
\ 'outputter/quickfix/open_cmd' : 'botright copen',
\ 'outputter/buffer/split' : ':botright',
\ 'hook/copen/enable_exit' : 1,
\ 'hook/copen/hook_command' : ':botright',
\ 'hook/copen/hook_args' : 'copen',
\ 'runner' : 'vimproc',
\ },
\ 'haskell' : {
\ 'command' : 'stack',
\ 'cmdopt' : 'runghc',
\ 'exec' : '%c %o %s'
\}
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
nnoremap ! :NeomakeSh 
"}}}

"neoterm{{{
let g:neoterm_size       = 10
let g:neoterm_autoinsert = 0
nnoremap <F12> :Ttoggle<CR><C-w>ji
"}}}

"VimFiler{{{
"safe modeを切る
let g:vimfiler_safe_mode_by_default = 0
"デフォルトのエクスプローラーにする
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context',
    \ { 'edit_action' : 'tabopen'
    \ , 'simple' : 1
    \ , 'split' : 1
    \ , 'direction' : 'botright'
    \ , 'winwidth' : 32
    \ })
nnoremap <Space>n :VimFilerCurrentDir<CR>
"au FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_open_file_in_another_vimfiler)
au FileType vimfiler nmap <buffer> K    5k
"}}}

"NERD_tree, NERD_commenter"{{{
nmap ,, <plug>NERDCommenterToggle
vmap ,, <plug>NERDCommenterToggle
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

"git-gutter {{{
let g:gitgutter_map_keys = 0
let g:gitgutter_signs = 0
nnoremap [gitgutter] <nop>
nmap     <C-g> [gitgutter]
nnoremap [gitgutter]n :GitGutterNextHunk<CR>
nnoremap [gitgutter]p :GitGutterPrevHunk<CR>
nnoremap [gitgutter]P :GitGutterPreviewHunk<CR>
nnoremap [gitgutter]e :GitGutterSignsEnable<CR>
nnoremap [gitgutter]d :GitGutterSignsDisable<CR>
nnoremap [gitgutter]s :GitGutterStageHunk<CR>
"}}}

"vim-fugitive{{{
".dein/plugin/fugitive.vim
" l:1447 pedit -> vertical pedit
" wincmd P -> wincmd P | vertical resize 40
" と書き換えるとgStatusが見やすい
"}}}

"smartinput{{{
".dein/autoload/smartinput.vim smartinput#define_default_rules()を編集
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')

call smartinput#define_rule({
  \   'at'    : '{\%#}',
  \   'char'  : '<CR>',
  \   'input' : '<CR><Left><CR><Tab>',
  \   })
call smartinput#define_rule({
  \   'at'    : '(\%#)',
  \   'char'  : '<Space>',
  \   'input' : '<Space><Space><Left>',
  \   })
"}}}

"C"{{{
au FileType c setlocal expandtab tabstop=4
"}}}

"sh"{{{
au FileType sh   setlocal expandtab shiftwidth=2
au FileType bash setlocal expandtab shiftwidth=2
"}}}

"Haskell"{{{
"neovimhaskell/haskell-vimのindentファイルは邪悪なので消すべき
"neovimhaskell/haskell-vimのsyntaxとvim2hsのindentを組み合わせるのが良さげ
"やっぱりindentファイルは消そう
au FileType haskell setlocal tabstop=2 shiftwidth=2 softtabstop=0 foldmethod=marker
au FileType haskell nnoremap <buffer> ,t :update!<CR>:NeoGhcModType<CR>
au FileType haskell nnoremap <buffer> ,T :update!<CR>:GhcModTypeInsert<CR>
au FileType haskell nnoremap <buffer> ,i :update!<CR>:NeoGhcModInfo<CR>
au FileType haskell nnoremap <buffer> ,I :update!<CR>:NeoGhcModInfo 
au FileType haskell nnoremap <buffer> ,w :update!<CR>:NeoGhcModCheck<CR>
au FileType haskell nnoremap <buffer> ,l :update!<CR>:NeoGhcModLint<CR>
au FileType haskell nnoremap <buffer> ,c :noh    <CR>:NeoGhcModTypeClear<CR>
au FileType haskell nnoremap <buffer> ,H :Unite hoogle<CR>
au FileType haskell nnoremap <buffer> ,h :Unite haskellimport<CR>
au FileType haskell nnoremap <buffer> <Space>t :update!<CR>:QuickRun -exec "fast-tags -R ./"<CR>
call unite#custom_default_action('source/hoogle', 'preview')
au FileType cabal   setlocal expandtab tabstop=4
au! BufNewFile,BufFilePRe,BufRead *.x set filetype=alex
au! BufNewFile,BufFilePRe,BufRead *.y set filetype=happy
"neco-ghc
let g:necoghc_enable_detailed_browse = 1
au FileType haskell setlocal omnifunc=necoghc#omnifunc
au FileType haskell inoremap <buffer> <C-o> <C-x><C-o>
"vim2hs
let g:haskell_haddock              = 0
let g:haskell_ffi                  = 0
let g:haskell_cpp                  = 0
let g:haskell_th                   = 0
let g:haskell_quasi                = 0
let g:haskell_interpolation        = 0
let g:haskell_regex                = 0
let g:haskell_jmacro               = 0
let g:haskell_shqq                 = 0
let g:haskell_rlangqq              = 0
let g:haskell_sql                  = 0
let g:haskell_json                 = 0
let g:haskell_xml                  = 0
let g:haskell_hsp                  = 0
let g:haskell_conceal              = 0
let g:haskell_conceal_comments     = 0
let g:haskell_conceal_enumerations = 0
let g:haskell_conceal_wide         = 0
let g:haskell_conceal_bad          = 0
let g:haskell_multiline_strings    = 0
"haskell-vim
let g:haskell_indent_if    = 2
let g:haskell_indent_case  = 2
let g:haskell_indent_let   = 4
let g:haskell_indent_where = 2
let g:haskell_indent_do    = 3
let g:haskell_indent_in    = 0
let g:haskell_indent_guard = 2
"}}}

"OCaml"{{{
au FileType ocaml nnoremap <buffer> ,t :update!<CR>:MerlinTypeOf<CR>
au FileType ocaml vnoremap <buffer> ,t :MerlinTypeOfSel<CR>
au FileType ocaml nnoremap <buffer> >  :MerlinGrowEnclosing<CR>
au FileType ocaml nnoremap <buffer> <  :MerlinShrinkEnclosing<CR>
au FileType ocaml nnoremap <buffer> ,y :MerlinYankLatestType<CR>

"au FileType ocaml nnoremap <buffer> ,o :update!<CR>:MerlinOutline<CR> CtrlPが必要
au FileType ocaml nnoremap <buffer> ,w :update!<CR>:MerlinErrorCheck<CR>
au FileType ocaml nnoremap <buffer> <C-j> :update!<CR>:MerlinLocate<CR>
au FileType ocaml nnoremap <buffer> ,c :noh<CR>a<Esc>
au FileType ocaml nnoremap <buffer> <C-q> :update!<CR>:OCamlTop2<CR>
au FileType ocaml setlocal tabstop=2 shiftwidth=2 softtabstop=0
au FileType ocaml setlocal commentstring=(*%s*)
"au FileType ocaml colorscheme hybrid
au FileType ocaml GoodMatchParen
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
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
au FileType pandoc setlocal et sw=2 sts=2 foldmethod=marker
au FileType pandoc let &spell = 0

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
au FileType pandoc nnoremap <buffer> <C-q> :update!<CR>:PandocMd<CR>
"}}}

"Scheme{{{
au FileType scheme setlocal iskeyword=@,33,35-38,42-43,45-58,60-64,94,_,126
au FileType scheme setlocal et ts=2 sts=2 sw=2
"}}}

"Prolog{{{
au! BufNewFile,BufFilePRe,BufRead *.pl set filetype=prolog
"}}}

"Rust "{{{
set hidden
let g:racer_cmd = expand('$HOME/.cargo/bin/racer')
let $RUST_SRC_PATH='$HOME/apps/rustc-1.11.0/src'

let g:rustfmt_autosave = 0
"let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
let g:rustc_path = expand('$HOME/.cargo/bin/rustc')
let g:rust_recommended_style = 1
let g:rust_fold = 0
au FileType rust nnoremap <buffer> <C-q> :update!<CR>:RustRun<CR>
"}}}

"Scala {{{
au FileType scala nnoremap <buffer>,w    :update!<CR>:EnTypeCheck<CR>
au FileType scala nnoremap <buffer>,t    :update!<CR>:EnInspectType<CR>
au FileType scala nnoremap <buffer><C-j> :update!<CR>:EnDeclaration<CR>
"}}}

"Seiya"{{{
nnoremap <Space>se :SeiyaEnable<CR>
nnoremap <Space>sd :SeiyaDisable<CR>
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
"let g:clever_f_chars_match_any_signs = ';'
"}}}

"key-map{{{
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
nnoremap gJ J
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
au InsertLeave * set nopaste
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
"inoremap <C-o> <esc>o
"コマンドライン上下
cnoremap <C-j> <down>
cnoremap <C-k> <up>
"<Space>cdで開いているファイルのディレクトリに移動する
nnoremap <Space>cd :cd %:h<CR>
"QuickRun関連
nnoremap <C-q> :update!<CR>:QuickRun<CR>
nnoremap <Space>m :update!<CR>:cd %:h<CR>:QuickRun -exec "make "<Left>
nnoremap <Space>r :update!<CR>:cd %:h<CR>:QuickRun -exec "make run"<CR>
nnoremap ,w :update!<CR>:WatchdogsRun<CR>
"ctag
nnoremap <C-j> <C-]>
"VimShell
nnoremap <Space>sh  :VimShell<CR>
nnoremap <Space>sht :VimShellTab<CR>
nnoremap <Space>si  :VimShellInteractive 
"w/e motion
nnoremap b B
nnoremap B b
nnoremap w W
nnoremap W w
nnoremap e E
nnoremap E e
inoremap <C-b>   <esc>Bi
inoremap <C-S-b> <esc>bi
inoremap <C-w>   <esc>lWi
inoremap <C-S-w> <esc>lwi
"""EasyMotion
"s{char}{char}{label}
nmap s <Plug>(easymotion-s2)
"nmap s <Plug>(easymotion-sn)
nmap M <Plug>(easymotion-bd-jk)
nmap w <Plug>(easymotion-bd-w)
"nmap W <Plug>(easymotion-bd-W)
nmap e <Plug>(easymotion-bd-e)
"nmap E <Plug>(easymotion-bd-E)
vmap w <Plug>(easymotion-bd-w)
"vmap W <Plug>(easymotion-bd-W)
vmap e <Plug>(easymotion-bd-e)
"vmap E <Plug>(easymotion-bd-E)
"検索
"nmap <C-g> <Plug>(easymotion-sn)
nnoremap ,c :noh<CR>
nnoremap ^ :noh<CR>
"}}}

"Terminal他"{{{
nnoremap .. :cd..<CR>
nnoremap te :vs<CR><C-w>l:te<CR>
":botright split | resize 15 | te
nnoremap vs :rightbelow vs<CR>
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
"}}}

"OCamlExpr "{{{
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
"}}}

" OCamlTop {{{
let g:ocamltop = ''
let g:ocamlmktop_cmd = "make top"
command! -nargs=? OCamlTop2 call OCamlTopFun(<f-args>)
function! OCamlTopFun(...) abort
  "topcmd
  if strlen(g:ocamltop) == 0
    if !(filereadable(expand('%:h').'/Makefile'))
      throw "Makefile not found"
    endif
    let makefile = readfile(expand('%:h').'/Makefile')
    let topcmd = ''
    for line in makefile
      let result = substitute(line, '^RESULT\s*=\s*\(.*\)\s*$', '\1', '')
      if strlen(result) != strlen(line)
        let topcmd = result . '.top'
        break
      endif
    endfor
    if strlen(topcmd) == 0
        throw "OCamlTopFun: $RESULT not found in Makefile"
    endif
  else
    let topcmd = g:ocamltop
  endif

  let open_module_name = substitute(expand('%:t:r'), '^.', '\u&', '')
  echo open_module_name

  let cmd = g:ocamlmktop_cmd . ' 1> /dev/null' . ' && ' .
          \ 'rlwrap ./' . topcmd . ' -open ' . open_module_name
  exe 'rightbelow vs | te ' . cmd
endfunction
"}}}

"tab"{{{
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"}}}

"register"{{{
let @a = "->"
let @b = "<-"
"}}}

"nvim-hs"{{{
let g:ghc_mod_nvim_log_directory = expand('~/.cache/ghc-mod-nvim')
if has('nvim')
    call jobstart([expand('$HOME/.local/bin/nvim-hs-devel.sh')], {'rpc' : v:true})
endif
"}}}

"tmp"{{{
let $BASH_ENV='~/.bashenv'
let g:previm_open_cmd="google-chrome"

command! -nargs=1 MV call system("[ ! -f <args> ]rm ".expand("%")) | :file <args> | :w!
command! RmTrailingWhiteSpaces %s/\s\+$//g | :noh
command! GoodMatchParen hi MatchParen ctermfg=253 ctermbg=0
au InsertLeave * GoodMatchParen
au VimEnter * GoodMatchParen
au VimEnter * hi Folded ctermbg=233

nnoremap ,cl <nop>
nnoremap Q <nop>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <Space>r :RestartNvimhs<CR>
nnoremap <Space>m :NeomakeSh stack build<CR>
nnoremap gs :Gstatus<CR>
vnoremap * "zy:let @/ = @z<CR>n

au FileType asm setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
au FileType tex setlocal et sw=2 sts=2
"}}}

"vim: set et ts=2 sts=2 tw=2:
