"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LSP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Either 'nvim-hs-lsp' or 'coc'
let g:lsp_plugin = 'coc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Python3
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python3_host_prog = '/usr/local/bin/python3.8'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VM-unique Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! MyClipboard(lines,regtype) abort
  " TODO パス解決
  call writefile(a:lines, "/c/Users/cq2n-iwym/.clipboard")
  call extend(g:, {'my_clipboard': [a:lines, a:regtype]})
endfunction
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': function("MyClipboard"),
      \      '*': function("MyClipboard")
      \    },
      \   'paste': {
      \      '+': {-> get(g:, 'my_clipboard', [])},
      \      '*': {-> get(g:, 'my_clipboard', [])},
      \   },
      \ }
" Windowsで次のプログラムを走らせる
" #!/bin/bash
" INTERVAL=1
" MY_CLIPBOARD_FILE=~/.clipboard
" last=`ls --full-time $MY_CLIPBOARD_FILE | awk '{print $6"-"$7}'`
" while true; do
"   sleep $INTERVAL
"   current=`ls --full-time $MY_CLIPBOARD_FILE | awk '{print $6"-"$7}'`
"   if [ $last != $current ] ; then
"     last=$current
"     echo "updated @$current"
"     cat $MY_CLIPBOARD_FILE
"     echo "EOF"
"     iconv -f utf-8 -t sjis $MY_CLIPBOARD_FILE | clip
"   fi
" done

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plug{{{
call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/defx.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/deoplete-terminal'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'kana/vim-submode'
Plug 'benekastah/neomake'
Plug 'kassio/neoterm'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"""便利
"Plug 'vim-scripts/Align'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-smartinput'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-sandwich'
Plug 'itchyny/lightline.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
Plug 'losingkeys/vim-niji'
Plug 'mhinz/vim-grepper'
Plug 'wellle/visual-split.vim'
Plug 'mhinz/vim-startify'
""Git TODO 整理
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'lambdalisue/gina.vim'
""Motion
Plug 'Lokaltog/vim-easymotion'
Plug 'rhysd/clever-f.vim'
"""nvim-hs
"Plug 'Hogeyama/nvim-hs.vim', {'branch': 'develop'}
"Plug '~/.config/nvim/nvim-hs-libs/nvim-hs-lsp'
"Plug '~/.config/nvim/nvim-hs-libs/ghcid-nvim-simple'
" Plug 'Hogeyama/intero-neovim'
"""filetype
""Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-scripts/alex.vim'
Plug 'vim-scripts/happy.vim'
Plug 'Hogeyama/unite-haddock'
Plug 'Hogeyama/unite-haskellimport'
Plug 'LnL7/vim-nix'
""Elm
Plug 'carmonw/elm-vim'
" Plug 'w0rp/ale'
""PureScript
Plug 'purescript-contrib/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'
""Dhall
Plug 'vmchale/dhall-vim'
"""Python
" Plug 'numirias/semshi'
Plug 'vim-python/python-syntax'
""Scala
Plug 'derekwyatt/vim-scala'
" Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
"Plug 'ktvoelker/sbt-vim'
""Idris Agda
Plug 'idris-hackers/idris-vim'
Plug 'raichoo/agda-vim'
""Erlang
Plug 'vim-erlang/vim-erlang-runtime'
""SATySFi
Plug 'qnighy/satysfi.vim'
""MarkDown
Plug 'tyru/open-browser.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-voom/VOoM'
"""Textile
Plug 'amiorin/vim-textile'
""Coq
Plug 'jvoorhis/coq.vim'
Plug 'eagletmt/coqtop-vim'
""Rust
Plug 'rust-lang/rust.vim'
""Others
Plug 'bohlender/vim-smt2'
Plug 'jelera/vim-javascript-syntax'
Plug 'rgrinberg/vim-ocaml'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
"""Color Scheme
Plug 'zsoltf/vim-maui'
Plug 'rakr/vim-one'
Plug 'w0ng/vim-hybrid'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'chriskempson/base16-vim' "true_color
"""otameshi
Plug 'vim-scripts/paredit.vim'
Plug 'tomtom/tlib_vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'neovim/node-host', { 'do': 'npm install -g neovim' }
" Plug 'euclio/vim-markdown-composer', { 'do': 'cargo build --release' }
if g:lsp_plugin == 'coc'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
call plug#end()
"}}}

"Color"{{{
syntax on
set background=dark
colorscheme deep-space
" colorscheme maui

if 1 "true color
  set termguicolors
  "対応表 http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
  hi Normal guibg=#182020
  "hi LineNr guibg=#182020
endif
command! GoodMatchParen hi MatchParen ctermfg=253 guifg=#dadada ctermbg=0 guibg=#000000
GoodMatchParen
" hi Normal guibg=None
hi Folded ctermbg=None guibg=None "guifg=#506080
hi LineNr ctermbg=None guibg=None
autocmd InsertLeave * GoodMatchParen

" terminal color
if has("nvim") "{{{
  "base16-spacemacsから
  let g:terminal_color_0 =  "#1f2022"
  let g:terminal_color_1 =  "#f2241f"
  let g:terminal_color_2 =  "#67b11d"
  let g:terminal_color_3 =  "#b1951d"
  let g:terminal_color_4 =  "#4f97d7"
  let g:terminal_color_5 =  "#a31db1"
  let g:terminal_color_6 =  "#2d9574"
  let g:terminal_color_7 =  "#a3a3a3"
  let g:terminal_color_8 =  "#585858"
  let g:terminal_color_9 =  "#f2241f"
  let g:terminal_color_10 = "#67b11d"
  let g:terminal_color_11 = "#b1951d"
  let g:terminal_color_12 = "#4f97d7"
  let g:terminal_color_13 = "#a31db1"
  let g:terminal_color_14 = "#2d9574"
  let g:terminal_color_15 = "#f8f8f8"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_5
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
endif "}}}
"}}}

"各種設定"{{{
filetype plugin indent on

set fileencoding=utf-8
set termencoding=utf-8
let mapleader=","
let maplocalleader=","

filetype plugin on
filetype indent on
set mouse=
set ambiwidth=double
" set ambiwidth=single
set foldmethod=marker
set fillchars=fold:-
set visualbell t_vb=
set hidden
set modeline
"set number
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set linebreak
set breakindent
set breakindentopt=shift:0
set showbreak=..
" set showbreak=\ \ 
" set showbreak=\ \ >\
" set showbreak=
set noswapfile
set nobackup
set noundofile
set conceallevel=0
set concealcursor=
set laststatus=2
" set completeopt=menuone,noselect,preview,noinsert
set completeopt=menuone,noselect,noinsert
"set autoread
set scrolloff=5
set history=100
set wildmenu
set wildmode=longest:full,full
set ignorecase
set smartcase
set list
set listchars=tab:>.,trail:_
set whichwrap =b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set wildoptions=pum
set showtabline=2
set switchbuf="split"
autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType vim setlocal et ts=2 sw=2 sts=2

let g:lightline = {}
let g:lightline.active = {
      \ 'left':  [['mode', 'paste'], ['readonly', 'relativepath', 'filetype', 'modified']],
      \ 'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'example']]
      \}
let g:lightline.inactive = {
      \ 'left':  [['relativepath', 'modified']],
      \ 'right': [['lineinfo'], ['percent']]
      \}
let g:lightline.tabline = {
      \ 'left':  [['tabs']],
      \ 'right': [['cwd']]
      \}
let g:lightline.component = {
      \ 'cwd': '%{fnamemodify(getcwd(), ":~")}',
      \}
function! SetLightlineConfig() abort
  augroup lightline
    autocmd!
    autocmd WinEnter,SessionLoadPost * call lightline#update()
    autocmd SessionLoadPost * call lightline#highlight()
    autocmd ColorScheme * if !has('vim_starting')
          \ | call lightline#update() | call lightline#highlight() | endif
  augroup END
endfunction
autocmd VimEnter * call SetLightlineConfig()
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"おためし{{{
nmap s <nop>
xmap s <nop>
let g:EditorConfig_max_line_indicator = 'exceeding'
set pumblend=15
let g:grepper = {}
let g:grepper.quickfix = 0
command! -nargs=+ -complete=file Ag Grepper -noprompt -tool ag -query <args>

" coc.nvim
set updatetime=300
"}}}

"Denite{{{
hi CursorLine ctermbg=8
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q       denite#do_map('quit')
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> t       denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> ..      denite#do_map('move_up_path') ":move_up_path>
endfunction
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
endfunction

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#var('grep', 'command', ['ack'])
call denite#custom#var('grep', 'default_opts', ['-H','-i','--nopager','--nocolor','--nogroup','--column'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--match'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#var('grep', 'command', ['hoge'])

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/', '*.cmo*', '*.cmi',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '.stack-work/', '_build/'
      \ ])
call denite#custom#source('_', 'matchers', ['matcher_substring', 'matcher_ignore_globs'])
command! DeniteNext     Denite -resume -cursor-pos=+1 -immediately
command! DenitePrevious Denite -resume -cursor-pos=-1 -immediately

nnoremap [denite] <nop>
nmap <C-u> [denite]
nnoremap [denite]r :Denite -resume<CR>
nnoremap [denite]b :Denite buffer -winheight=10 -split=floating buffer<CR>
nnoremap [denite]d :Denite -winheight=10 
nnoremap [denite]g :Denite -winheight=10 grep:::<CR>
nnoremap [denite]n :DeniteNext<CR>
nnoremap [denite]p :DenitePevious<CR>
nnoremap [denite]c :DeniteBufferDir -winheight=10 -split=floating file<CR>
nnoremap [denite]h :Denite          -winheight=10 -split=floating file_mru<CR>
nnoremap <C-c>     :Denite          -winheight=10 -split=floating file/rec<CR>
"TODO outline, output
"メモ grep:$0:$1:$2は次に展開される
"  ag -i --vimgrep $1 -- $2 $PWD/$0
"interactiveに指定する場合，Argumentが$1でPatternが$2に対応するっぽい

call denite#custom#source('file/rec', 'sorters', ['sorter/word'])
call denite#custom#source('file', 'sorters', ['sorter/word'])

"}}}

"Unite{{{
"設定
call unite#custom#profile('default', 'context', {
      \ 'start_insert': 0,
      \ 'winheight': 10,
      \ 'winwidth': 40,
      \ 'direction': 'botright',
      \ 'prompt_direction' : 'top'
      \})
call unite#custom#source('file',
\   'ignore_pattern','\.\(hi\|o\|log\|gz\|dvi\|aux\|fdb_latexmk\|cmo\|cmi\|cmx\|cmt\)$')

"""map
"""unite map
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  imap <buffer> jk        <Plug>(unite_insert_leave)
  imap <buffer> <TAB>     <Plug>(unite_select_next_line)
  imap <buffer> <S-TAB>   <Plug>(unite_select_previous_line)
  nmap <buffer> <C-j>     <Plug>(unite_select_next_line)
  nmap <buffer> <C-k>     <Plug>(unite_select_previous_line)
endfunction"}}}
call unite#custom#default_action('haddock', 'browse_remote')

"}}}

"defx{{{
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr><CR>
    \ defx#do_action('drop', 'rightbelow vsplit')
  nnoremap <silent><buffer><expr>tt
    \ defx#do_action('drop', 'tabnew')
  nnoremap <silent><buffer><expr>K
    \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr>N
    \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr>..
    \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr>~
    \ defx#do_action('cd')
  nnoremap <silent><buffer><expr><Space>
    \ defx#do_action('open_or_close_tree')
    " \ defx#do_action('toggle_select') . 'j'
endfunction
"}}}

"QuickFix"{{{
autocmd FileType qf wincmd J
autocmd FileType qf 3 wincmd _
"}}}

"{{{Neomake
let g:neomake_airline=1
let g:neomake_open_list=0
" let g:neomake_open_list=2
let g:neomake_place_signs=0
let g:neomake_echo_current_error=0
let g:neomake_virtualtext_current_error=0
" let g:neomake_haskell_hlint_remove_invalid_entries=1
" let g:neomake_haskell_ghcmod_remove_invalid_entries=1
" let g:neomake_haskell_runghc_remove_invalid_entries=1
nnoremap ! :NeomakeSh 
"}}}

"neoterm{{{
let g:neoterm_default_mod = "botright"
let g:neoterm_size = 10
let g:neoterm_autoinsert = 0
nnoremap <F12> :Ttoggle<CR><C-w>ji
"}}}

"NERD_tree"{{{
let g:NERDTreeWinPos="left"
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeIgnore=['\.bin$']
nnoremap <Space>n :NERDTreeToggle<CR>
nnoremap <Space>N :NERDTreeMirror<CR>

nmap ,, <Plug>TComment_gcc
vmap ,, <Plug>TComment_gc
vmap ,l <Plug>TComment_,_r
"vmap ,b <Plug>TComment_,_b
"vmap ,i <Plug>TComment_,_i
vmap ,b :TCommentRight!<CR>
vmap ,i :TCommentInline!<CR>
"}}}

"neosnippet{{{
imap <C-f> <Plug>(neosnippet_expand_or_jump)
smap <C-f> <Plug>(neosnippet_expand_or_jump)
xmap <C-f> <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_conceal_markers = 0
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'
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

"submode{{{
let g:submode_always_show_submode = 1
let g:submode_timeout = 0
"}}}

"smartinput{{{
let g:smartinput_no_default_key_mappings=0
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')
call smartinput#map_to_trigger('i', '(', '(', '(')
call smartinput#map_to_trigger('i', '{', '{', '{')
call smartinput#define_rule({
      \ 'at'    : '{\%#}',
      \ 'char'  : '<CR>',
      \ 'input' : '<CR><Left><CR><Tab>',
      \})
call smartinput#define_rule({
      \ 'at': '\%#',
      \ 'char': '(',
      \ 'input': '()<Left>',
      \})
call smartinput#define_rule({
      \ 'at'    : '(\%#)',
      \ 'char'  : '<Space>',
      \ 'input' : '<Space><Space><Left>',
      \})
call smartinput#define_rule({
      \ 'at': '\%#',
      \ 'char': '{',
      \ 'input': '{}<Left>',
      \})
"inoremap ( (
"inoremap { {
"}}}

"deoplete neosnippet{{{
let g:deoplete#enable_at_startup  = g:lsp_plugin != 'coc'
call deoplete#custom#option('ignore_case', v:false)
call deoplete#custom#option('camel_case', v:true)
"call deoplete#custom#option('ignore_sources', {'elm': ['nvim-hs-lsp']})
call deoplete#custom#var('terminal', 'require_same_tab', v:false)
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

" <Tab>で選ぶ
inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"BS
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
"cancel completion
inoremap <C-c> <C-e>
"}}}

"LSP {{{
nnoremap [lsp] <nop>
xnoremap [lsp] <nop>
nmap     <C-l> [lsp]
xmap     <C-l> [lsp]

function! s:lsp_my_setting() abort
  if g:lsp_plugin == 'nvim-hs-lsp'
    setlocal omnifunc=NvimHsLspComplete
    nnoremap <buffer> [lsp]i :NvimHsLspInitialize<CR>
    nnoremap <buffer> [lsp]s :NvimHsLspStartServer<CR>
    nnoremap <buffer> [lsp]q :NvimHsLspStopServer<CR>
    nnoremap <buffer> <C-j>  :NvimHsLspDefinition<CR>
    nnoremap <buffer> [lsp]j :NvimHsLspDefinition<CR>
    nnoremap <buffer> [lsp]h :NvimHsLspInfo<CR>
    nnoremap <buffer> [lsp]H :NvimHsLspHover<CR>
    nnoremap <buffer> <C-h>  :NvimHsLspHoverFloat<CR>
    nnoremap <buffer> [lsp]w :NvimHsLspLoadQuickfix<CR>
    nnoremap <buffer> [lsp]r :NvimHsLspReferences<CR>
    nnoremap <buffer> [lsp]f :NvimHsLspFormatting!<CR>
    xnoremap <buffer> [lsp]f :NvimHsLspFormatting<CR>
    nnoremap <buffer> [lsp]a :NvimHsLspCodeAction<CR>
    nnoremap <buffer> [lsp]r :NvimHsLspRename 
    inoremap <buffer> <C-o>  <C-x><C-o>
  elseif g:lsp_plugin == 'coc'
    nmap     <buffer> <C-j>  <Plug>(coc-definition)
    nmap     <buffer> [lsp]j <Plug>(coc-definition)
    nmap     <buffer> [lsp]r <Plug>(coc-references)
    nmap     <buffer> [lsp]f <Plug>(coc-format)
    xmap     <buffer> [lsp]f <Plug>(coc-format-selected)
    nmap     <buffer> [lsp]a <Plug>(coc-codeaction)
    nmap     <buffer> [lsp]r <Plug>(coc-rename)
    nmap     <buffer> [lsp]l <Plug>(coc-openlink)
    nnoremap <buffer> [lsp]h :call CocAction('doHover')<CR>
    nnoremap <buffer> <C-h>  :call CocAction('doHover')<CR>
  else
  endif
endfunction

" nvim-hs-lsp config"{{{
" g:NvimHsLsp_languageConfig {{{
let g:NvimHsLsp_languageConfig = {}
let g:NvimHsLsp_languageConfig['_'] = {
      \ 'settingsPath': expand("$HOME/.config/nvim/settings.json"),
      \ 'autoloadQuickfix': v:true,
      \}
let g:NvimHsLsp_languageConfig['haskell'] = {
      \ 'serverCommand':
      \     ['haskell-language-server-wrapper', '--lsp', '-d', '-l', '/tmp/LanguageServer.log'],
      \ 'formattingOptions': {
      \     'tabSize': 2,
      \     'insertSpaces': v:true,
      \   },
      \}
      " \     ['cabal', 'exec', '--', 'ghcide', '--lsp'],
      " \     ['hie-wrapper', '--lsp', '-d', '-l', '/tmp/LanguageServer.log'],
      " \     ['haskell-language-server-wrapper', '--lsp', '-d', '-l', '/tmp/LanguageServer.log'],
      " \     ['stack', 'exec', '--', 'ghcide', '--lsp'],
let g:NvimHsLsp_languageConfig['tex'] = {
      \ 'serverCommand':
      \     ['texlab'],
      \ 'formattingOptions': {
      \     'tabSize': 2,
      \     'insertSpaces': v:true,
      \   },
      \}
let g:NvimHsLsp_languageConfig['rust'] = {
      \ 'serverCommand':
      \     ['rust-analyzer-linux'],
      \ 'formattingOptions': {
      \     'tabSize': 4,
      \     'insertSpaces': v:true,
      \   },
      \ }
      " \     ['rustup', 'run', 'stable', 'rls'],
let g:NvimHsLsp_languageConfig['ocaml'] = {
      \ 'serverCommand':
      \     ['ocaml-language-server', '--stdio'],
      \ 'formattingOptions': {
      \     'tabSize': 2,
      \     'insertSpaces': v:true,
      \   },
      \ 'autoloadQuickfix': v:true,
      \ }
      " \     ['ocamllsp'],
      " \     ['ocaml_lsp_server'],
      " \     ['ocamlmerlin-lsp'],
      " \     ['ocaml-language-server', '--stdio'],
      " \     ['ocamlmerlin-server'],
let g:NvimHsLsp_languageConfig['elm'] = {
      \ 'serverCommand':
      \   [ 'elm-language-server', '-l', '/tmp/LanguageServer.log'],
      \ 'formattingOptions': {
      \   'tabSize': 2,
      \   'insertSpaces': v:true,
      \   },
      \ }
let g:NvimHsLsp_languageConfig['python'] = {
      \ 'serverCommand':
      \     ['pyls', '-v', '--log-file', '/tmp/pyls.log'],
      \ 'formattingOptions': {
      \     'tabSize': 4,
      \     'insertSpaces': v:true,
      \   },
      \ }
let g:NvimHsLsp_languageConfig['erlang'] = {
      \ 'serverCommand':
      \     ['erlang_ls', '-t', 'stdio', '-v', '10'],
      \ 'formattingOptions': {
      \     'tabSize': 2,
      \     'insertSpaces': v:true,
      \   },
      \ }
let g:NvimHsLsp_languageConfig['scala'] = {
      \ 'serverCommand':
      \     ['metals'],
      \ 'formattingOptions': {
      \     'tabSize': 2,
      \     'insertSpaces': v:true,
      \   },
      \ }
let g:NvimHsLsp_languageConfig['typescript'] = {
      \ 'serverCommand':
      \     ['typescript-language-server', '--stdio'],
      \ 'formattingOptions': {
      \     'tabSize': 2,
      \     'insertSpaces': v:true,
      \   },
      \ }
"}}}
"let g:nvimhsPluginStarter=nvimhs#cabal#pluginstarter()
"}}}

"QuickFixを開けっ放しにする
autocmd InsertLeave * let g:airline_disabled = 1
autocmd FileType qf let g:airline_disabled = 1
"}}}

" indentLine {{{
let g:indentLine_enabled = 0
let g:indentLine_char = '⁞' "U+205E VERTICAL FOUR DOTS
let g:indentLine_char = '⏐' "U+23D0 VERTICAL LINE EXTENSION
"}}}

"EasyMotion{{{
let g:EasyMotion_keys='jfkdlamvneioc'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_enter_jump_first = 1
"}}}

"clever-f.vim{{{
let g:clever_f_smart_case = 1
"}}}

"vim-niji{{{
let g:niji_matching_filetypes = ['lisp', 'smt2', 'python']
"}}}

"fzf{{{
set rtp+=~/.fzf
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" FileType
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"C"{{{
autocmd FileType c setlocal expandtab ts=4 sts=4 sw=4
augroup lsp
  autocmd FileType c call s:lsp_my_setting()
augroup END
"}}}

"sh"{{{
autocmd FileType sh   setlocal expandtab shiftwidth=2
autocmd FileType bash setlocal expandtab shiftwidth=2
"}}}

"Haskell"{{{
""general
autocmd FileType haskell inoremap <buffer> <C-o> <C-x><C-o>
autocmd FileType haskell setlocal tabstop=2 shiftwidth=2 softtabstop=0 ambiwidth=single

""syntax
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1

""indent
"let g:haskell_indent_disable = 1
augroup lsp
  autocmd FileType haskell call s:lsp_my_setting()
augroup END


""ghc-mod-nvim
"autocmd FileType haskell nnoremap <buffer> ,t :update!<CR>:NeoGhcModType<CR>
"autocmd FileType haskell nnoremap <buffer> ,T :update!<CR>:NeoGhcModType!<CR>
"autocmd FileType haskell nnoremap <buffer> ,i :update!<CR>:NeoGhcModInfo<CR>
"autocmd FileType haskell nnoremap <buffer> ,I :update!<CR>:NeoGhcModInfo
"autocmd FileType haskell nnoremap <buffer> ,l :update!<CR>:NeoGhcModLintAll<CR>
"autocmd FileType haskell nnoremap <buffer> ^  :noh    <CR>:NeoGhcModTypeClear<CR>

""hoogle
call unite#custom_default_action('source/hoogle', 'preview')
autocmd FileType haskell nnoremap <buffer> ,H :Unite hoogle<CR>
autocmd FileType haskell nnoremap <buffer> ,h :Unite haskellimport<CR>

""ghcid-nvim-hs
" TODO ghcidのautoreload
function! GhcidAutoReload() abort
  augroup ghcid_autoreload
    autocmd!
    "autocmd BufWrite *.hs GhcidCheck
  augroup END
endfunction
function! GhcidExecMain() abort
  let l:lines = getline(1, line('$'))
  let l:moduleLine = matchstr(l:lines, '^module')
  let l:mModuleName = matchlist(l:moduleLine, '^module\s\+\(\S*\)')
  let l:moduleName = len(l:mModuleName) is 0 ? "Main" : l:mModuleName[1]
  execute "GhcidExec " . l:moduleName . ".main"
endfunction
autocmd FileType haskell nnoremap <buffer> <leader>w :update!<CR>:GhcidCheck!<CR>
autocmd FileType haskell nnoremap <buffer> <leader>W :update!<CR>:GhcidCheck<CR>
autocmd FileType haskell nnoremap <buffer> <leader>r :GhcidStopAll<CR>
autocmd FileType haskell nnoremap <buffer> <leader>q :GhcidExec 
autocmd FileType haskell nnoremap <buffer> <leader>t :GhcidTypeCurrentWord<CR>
autocmd FileType haskell nnoremap <buffer> <C-S-q>   :GhcidExec main<CR>
autocmd FileType haskell nnoremap <buffer> <C-q>     :call GhcidExecMain()<CR>

""other filetype
autocmd FileType cabal   setlocal expandtab tabstop=4
autocmd! BufNewFile,BufFilePRe,BufRead *.x set filetype=alex
autocmd! BufNewFile,BufFilePRe,BufRead *.y set filetype=happy

""intero
let g:use_intero = 0
if g:use_intero
  let g:intero_start_immediately = 0
  let g:intero_type_on_hover = 0
  nnoremap [intero] <nop>
  autocmd FileType haskell nmap     <buffer> <C-l> [intero]
  autocmd FileType haskell nnoremap <buffer> [intero]i :InteroOpen<CR>
  autocmd FileType haskell nnoremap <buffer> [intero]r :InteroRestart<CR>
  autocmd FileType haskell nnoremap <buffer> [intero]h :InteroGenericType<CR>
  autocmd FileType haskell nnoremap <buffer> [intero]H :InteroType<CR>
  autocmd FileType haskell nnoremap <buffer> <C-j> :InteroGoToDef<CR>
  autocmd FileType haskell nnoremap <buffer> <C-h> :InteroGenericType<CR>
  autocmd FileType haskell nnoremap <buffer> <Space>r :InteroReload<CR>
  autocmd FileType haskell nnoremap <buffer> <Space>t :InteroGenericType<CR>
  autocmd FileType haskell nnoremap <buffer> <Space>T :InteroType<CR>
  augroup interoAutoReload
      autocmd!
      autocmd BufWrite *.hs InteroReload
  augroup END
endif
"}}}

"OCaml"{{{
""general
autocmd FileType ocaml inoremap <buffer> <C-o> <C-x><C-o>
autocmd FileType ocaml setlocal tabstop=2 shiftwidth=2 softtabstop=0 commentstring=(*%s*)
""merlin
autocmd FileType ocaml nnoremap <buffer> ,t :update!<CR>:MerlinTypeOf<CR>
autocmd FileType ocaml vnoremap <buffer> ,t :MerlinTypeOfSel<CR>
autocmd FileType ocaml nnoremap <buffer> >  :MerlinGrowEnclosing<CR>
autocmd FileType ocaml nnoremap <buffer> <  :MerlinShrinkEnclosing<CR>
autocmd FileType ocaml nnoremap <buffer> ,y :MerlinYankLatestType<CR>
" autocmd FileType ocaml nnoremap <buffer> ,w :update!<CR>:MerlinErrorCheck<CR>
autocmd FileType ocaml nnoremap <buffer> <C-j> :update!<CR>:MerlinLocate<CR>
autocmd FileType ocaml nnoremap <buffer> ^ :noh<CR>a<Esc>
autocmd FileType ocaml let g:neomake_enabled_makers = ['dune'] "b:だと効かない
let g:neomake_ocaml_dune_maker = {
      \ 'exe': 'dune',
      \ 'args': ['build'],
      \ 'errorformat':
      \   join([ "%DEntering directory '%f',"
      \        , 'File "%f"\, line %l\, characters %c%m,%m']),
      \}
""nvim-hs-lsp
augroup lsp
  autocmd FileType ocaml call s:lsp_my_setting()
augroup END
"config for merlin and ocp-indent
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
try
  execute "set rtp+=" . g:opamshare . "/merlin/vim"
  execute "helptags " . g:opamshare . "/merlin/vim/doc"
  execute "set rtp^=" . g:opamshare . "/ocp-indent/vim"
  execute "set rtp^=" . g:opamshare . "/ocp-index/vim"
catch /.*/
endtry
"}}}

"Elm{{{
let g:elm_jump_to_error = 1
let g:elm_make_output_file = "elm.js"
let g:elm_browser_command = 'google-chrome'
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 1
"}}}

"PureScript{{{
let g:psc_ide_syntastic_mode=1
autocmd FileType purescript nnoremap <buffer> <C-h> :Ptype<CR>
autocmd FileType purescript nnoremap <buffer> ,w :Prebuild<CR>
"}}}

"TypeScript{{{
autocmd FileType typescript nnoremap <buffer> <C-j> :NvimHsLspDefinition<CR>
"}}}

"Agda"{{{
"let maplocalleader="\\"
autocmd FileType agda setlocal expandtab ts=2 sts=2 sw=2
"autocmd FileType agda set commentstring=\ --%s
autocmd FileType agda set commentstring=--%s
"}}}

"Elm{{{
autocmd FileType elm nnoremap <buffer> ,w :ElmMake<CR>
"}}}

"LaTeX{{{
let g:tex_flavor = "latex"
autocmd FileType tex setlocal et sw=2 sts=2
" autocmd FileType tex setlocal et sw=2 sts=2 noautoindent
" autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
autocmd filetype tex nnoremap <buffer> ,w :update!<CR>:VimtexErrors<CR>
autocmd filetype tex nnoremap <buffer> <C-q>    :update!<CR>:VimtexCompileSS<CR>
autocmd filetype tex nnoremap <buffer> <F8>     :VimtexTocToggle<CR>
autocmd filetype tex nnoremap <buffer> <Space>c :VimtexCountWords<CR>
let g:vimtex_view_general_viewer   = 'evince'
let g:vimtex_latexmk_options       = ''
let g:vimtex_complete_close_braces = 1
let g:vimtex_fold_enabled          = 0
let g:vimtex_indent_enabled        = 1
let g:vimtex_quickfix_method       = 'latexlog'
let g:vimtex_quickfix_mode         = 2
let g:vimtex_compiler_latexmk      = {
      \ 'backend'    : 'nvim',
      \ 'background' : 1,
      \ 'build_dir'  : '_build',
      \ 'callback'   : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'options'    : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}
let g:vimtex_quickfix_latexlog = { 'overfull' : 0 }
let g:vimtex_index_split_pos   = 'vert botright'
let g:vimtex_index_split_width = 40
let g:vimtex_compiler_progname = 'nvr'
"nmap <c-z> /\$<CR>srb\(
"有用そう
"   <localleader>lY  |<plug>(vimtex-labels-toggle)|        `n`
"   <localleader>ll  |<plug>(vimtex-compile-toggle)|       `n`
"   <localleader>lk  |<plug>(vimtex-stop)|                 `n`
"}}}

"MarkDown/Pandoc{{{
augroup pandoc_syntax
  autocmd! BufNewFile,BufFilePRe,BufRead *.md set filetype=pandoc
augroup END
autocmd FileType pandoc setlocal et ts=2 sw=2 sts=2 foldmethod=marker
autocmd FileType pandoc let &spell = 0
" TODO errorformat
autocmd FileType pandoc let g:neomake_enabled_makers = ['pandoc'] "b:だと効かない
let g:neomake_pandoc_pandoc_maker = {
    \ 'exe': 'pandoc-wrapper',
    \ 'args': ['%t'],
    \ 'errorformat': '',
    \ 'process_output': {-> []},
    \ }
"autocmd InsertLeave *.md Neomake pandoc

let g:previm_enable_realtime = 1
let g:vim_markdown_math = 1
let g:pandoc#syntax#codeblocks#embeds#use = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["ocaml","haskell","python3"]
let g:pandoc#folding#mode = 'marker'
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#modules#disabled = ["folding", "chdir"]

"markdown-composer
let g:markdown_composer_open_browser = 0
"let g:markdown_composer_autostart = 0
"let g:markdown_composer_external_renderer =
"    \ 'pandoc -s -f markdown+lists_without_preceding_blankline+ignore_line_breaks -t html'
"}}}

"Scheme{{{
autocmd FileType scheme setlocal iskeyword=@,33,35-38,42-43,45-58,60-64,94,_,126
autocmd FileType scheme setlocal et ts=2 sts=2 sw=2
"}}}

"Prolog{{{
autocmd! BufNewFile,BufFilePRe,BufRead *.pl set filetype=prolog
"}}}

"Rust "{{{
"let g:racer_cmd = "~/.cargo/bin/racer"
"let g:rustfmt_autosave             = 0
"let g:rust_recommended_style       = 1
"let g:racer_experimental_completer = 0
"let g:rust_fold                    = 0
"let g:racer_insert_paren           = 0
"autocmd FileType rust nmap <buffer> <C-j> <Plug>(rust-def)
"autocmd FileType rust nmap <buffer> gs    <Plug>(rust-def-split)
"autocmd FileType rust nmap <buffer> gv    <Plug>(rust-def-vertical)
"autocmd FileType rust nmap <buffer> gK    <Plug>(rust-doc)
"let g:racer_no_default_keymappings=0
""nvim-hs-lsp
augroup lsp
  autocmd FileType rust call s:lsp_my_setting()
augroup END
"}}}

"Scala {{{
autocmd FileType scala nnoremap <buffer><C-h> :update!<CR>:EnTypeCheck<CR>
autocmd FileType scala nnoremap <buffer>,t    :update!<CR>:EnInspectType<CR>
autocmd FileType scala nnoremap <buffer><C-j> :update!<CR>:EnDeclaration<CR>
" autocmd FileType scala setlocal omnifunc=NvimHsLspComplete
" autocmd FileType scala nnoremap <buffer> <C-j> :NvimHsLspDefinition<CR>
" autocmd FileType scala nnoremap <buffer> <C-h> :NvimHsLspInfo<CR>
" autocmd FileType scala nnoremap <buffer> <Space>w :NvimHsLspLoadQuickfix<CR>
"}}}

"Makefile {{{
autocmd FileType make setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
"}}}

"Align {{{
"autocmd VimEnter * AlignCtrl W=
"}}}

"Rainbow {{{
autocmd FileType lisp nmap <buffer> <F7> :RainbowToggle<CR>
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ["darkblue", "darkgreen", "red", "yellow"],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\     '*': {},
\     'tex': {
\       'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\     },
\   }
\ }
"\  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
"\  'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
"\       'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
"}}}

" Python{{{
let g:python_highlight_all = 1
let g:ale_python_autopep8_executable = ''
autocmd FileType python Python3Syntax
function! NvimHsLspFormattingPython3() abort
  NvimHsLspFormatting!
  Python3Syntax
endfunction
autocmd FileType python nnoremap [lsp]f call NvimHsLspFormattingPython3()
autocmd InsertLeave,BufNewFile,BufFilePRe,BufRead *.py Python3Syntax
augroup lsp
  autocmd FileType python call s:lsp_my_setting()
augroup END
"}}}

"smt2{{{
autocmd FileType smt2 call PareditInitBuffer()
autocmd FileType smt2 setlocal lisp
autocmd FileType smt2 setlocal lispwords+=assert,forall,exists
" あってもなくても良い
" autocmd bufread,bufnewfile *.smt2,*.scm,*.lisp setlocal equalprg=scmindent
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Other Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"key-map{{{
"""<C-d> $
inoremap <C-d> $
"""ttでtabnew
nnoremap <silent> tt  :<C-u>tabe<CR>
"""tgで前のタブ
nnoremap tg gT
"""<space>oで改行
"nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
"jkで<esc>
inoremap jk <Esc>
" inoremap jk <Esc>:w<CR>
"inoremap kj <Esc>:w<CR>
inoremap <C-j><C-k> <Esc>:w<CR>
"""<Space>\で保存
nnoremap <C-\> :update!<CR>
inoremap <C-\> <Esc>:update!<CR>
"""削除関連
nnoremap dk ddk
nnoremap dj dd
nnoremap Y  y$
" nnoremap dw diw
" nnoremap diw dw
" nnoremap cw ciw
" nnoremap ciw cw
" nnoremap yw yiw
" nnoremap yiw yw
inoremap <C-w> <esc>ldbi
"""window関連
nnoremap zh <C-w>h
nnoremap zj <C-w>j
nnoremap zk <C-w>k
nnoremap zl <C-w>l
nnoremap zo <C-w>_
nnoremap cj <C-w>j:q<CR><C-w>k
nnoremap ck <C-w>k:q<CR><C-w>j
nnoremap ch <C-w>h:q<CR><C-w>l
nnoremap cl <C-w>l:q<CR><C-w>h
call submode#enter_with('winsize', 'n', '', 'z>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', 'z<', '<C-w><')
call submode#enter_with('winsize', 'n', '', 'z+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', 'z-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
"""折りたたみ
nnoremap zn za
"""paste mode
nnoremap <F10> :set paste<CR>
autocmd InsertLeave * set nopaste
"""インサートモードでいろいろ
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-b> <esc>lBi
inoremap <expr><C-n> deoplete#mappings#close_popup()."<Esc>lWi"
inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
"""コマンドライン上下
cnoremap <C-j> <down>
cnoremap <C-k> <up>
"""開いているファイルのディレクトリに移動する
nnoremap <Space>cd :cd %:h<CR>
"""Neomake
nnoremap <C-q> :update!<CR>:Neomake!<CR>
nnoremap ,w    :update!<CR>:Neomake!<CR>
"""ctag
"nnoremap <C-j> <C-]>
""" noh
nnoremap ^ :noh<CR>
"""移動
nnoremap <C-a> I
nnoremap <C-e> A
nnoremap gJ J
noremap J 5j
noremap K 5k
noremap H B
noremap L W
noremap <A-h> gE
noremap <A-l> E
"物理行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k
"w/e motion
nnoremap b B
nnoremap B b
"nnoremap w W
"nnoremap W w
nnoremap e E
nnoremap E e
"""easymotion
"nmap s <Plug>(easymotion-s2)
"nmap / <Plug>(easymotion-sn)
nmap w <Plug>(easymotion-bd-w)
nmap W <Plug>(easymotion-bd-W)
nmap e <Plug>(easymotion-bd-e)
nmap E <Plug>(easymotion-bd-E)
vmap w <Plug>(easymotion-bd-w)
vmap W <Plug>(easymotion-bd-W)
vmap e <Plug>(easymotion-bd-e)
vmap E <Plug>(easymotion-bd-E)
nmap r <Plug>(easymotion-repeat)
nmap ; <Plug>(easymotion-next)
"nmap <Space>; <Plug>(easymotion-prev)
"}}}

"Terminal他"{{{
"nnoremap te :vs<CR><C-w>l:Deol<CR>
nnoremap te :terminal with-log neovim-terminal zsh<CR>
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

"tab"{{{
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"}}}

"register"{{{
let @a = "->"
let @b = "<-"
"}}}

"tmp"{{{
let $BASH_ENV='~/.bashenv'
let g:previm_open_cmd="google-chrome"

nnoremap <F8> :TagbarToggle<CR>
nnoremap gs :Gstatus<CR>
vnoremap * "zy:let @/ = @z<CR>n
"vnoremap ,a :Align

command! -nargs=+ -complete=command Redir let s:reg = @@ | redir @"> | silent execute <q-args> | redir END | e /tmp/vim_tmp_redir | pu | 1,2d_ | let @@ = s:reg

command! RmTrailingWhiteSpaces %s/\s\+$//g | :noh

command! LNextRecursive call CRecursive("lnext")
command! LPreviousRecursive call CRecursive("lprevious")
command! CNextRecursive call CRecursive("cnext")
command! CPreviousRecursive call CRecursive("cprevious")
function! CRecursive(cmd) abort "{{{
  let p0 = getpos('.')
  let p  = p0
  try
    while p == p0
      execute a:cmd
      let p = getpos('.')
    endwhile
  catch
    echomsg "no more items"
  endtry
endfunction "}}}
nnoremap <C-n> :CNextRecursive<CR>
nnoremap <C-p> :CPreviousRecursive<CR>
nnoremap <M-n> :LNextRecursive<CR>
nnoremap <M-p> :LPreviousRecursive<CR>
call submode#enter_with('lnext', 'n', '', '<Space>l', ':LNextRecursive<CR>')
call submode#map('lnext', 'n', '', '<C-n>', ':LNextRecursive<CR>')
call submode#map('lnext', 'n', '', '<C-p>', ':LPreviousRecursive<CR>')

let g:init_vim = $XDG_CONFIG_HOME != ""
                  \ ? $XDG_CONFIG_HOME   . "/nvim/init.vim"
                  \ : $HOME . "/.config" . "/nvim/init.vim"
command! EditInitVim   execute "e " .  g:init_vim
command! SourceInitVim execute "so " .  g:init_vim
"}}}

set conceallevel=0


"vim: set et ts=1 sts=2 tw=2:
