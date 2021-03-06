"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LSP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Either 'nvim-hs-lsp' or 'coc'
let g:lsp_plugin = 'coc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Python3
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:python3_host_prog = '/usr/local/bin/python3.8'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VM-unique Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! MyClipboard(lines,regtype) abort
"   call extend(g:, {'my_clipboard': [a:lines, a:regtype]})
"   call system("myclip", a:lines)
" endfunction
" let g:clipboard = {
"       \   'name': 'myClipboard',
"       \   'copy': {
"       \      '+': function("MyClipboard"),
"       \      '*': function("MyClipboard")
"       \    },
"       \   'paste': {
"       \      '+': {-> get(g:, 'my_clipboard', [])},
"       \      '*': {-> get(g:, 'my_clipboard', [])},
"       \   },
"       \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plug{{{
call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deol.nvim'
" Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/deoplete-terminal'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'kana/vim-submode'
Plug 'benekastah/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug '~/fzf'
Plug 'junegunn/fzf.vim'
"""便利
"Plug 'vim-scripts/Align'
Plug 'junegunn/vim-easy-align'
Plug 'tomtom/tcomment_vim'
Plug 'machakann/vim-sandwich'
Plug 'itchyny/lightline.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
Plug 'losingkeys/vim-niji'
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
if g:lsp_plugin is 'nvim-hs-lsp'
  Plug 'Hogeyama/nvim-hs.vim', {'branch': 'develop'}
  Plug 'Hogeyama/nvim-hs-lsp'
endif
"""filetype
""Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-scripts/alex.vim'
Plug 'vim-scripts/happy.vim'
Plug 'LnL7/vim-nix'
""Elm
Plug 'carmonw/elm-vim'
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
"Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
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
""Toml
Plug 'cespare/vim-toml'
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
Plug 'neovim/node-host', { 'do': 'npm install neovim' }
if g:lsp_plugin is 'coc'
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
  "hi Normal guibg=#182020
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
  if &background is "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
endif "}}}
"}}}

"Set{{{
filetype plugin indent on
set fileencodings=utf-8,cp932
set termencoding=utf-8
let mapleader=","
let maplocalleader=","

filetype plugin on
filetype indent on
set mouse=
" set ambiwidth=double
set ambiwidth=single
set foldmethod=marker
set fillchars=fold:-,vert:\|
set visualbell t_vb=
set hidden
set modeline
set number
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
set conceallevel=0
autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType qf wincmd J
autocmd FileType qf 3 wincmd _
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"editorconfig{{{
let g:EditorConfig_max_line_indicator = 'exceeding'
"}}}

"LSP {{{
nnoremap [lsp] <nop>
xnoremap [lsp] <nop>
nmap     <C-l> [lsp]
xmap     <C-l> [lsp]
if g:lsp_plugin is 'coc'
  nmap     <C-j>  <Plug>(coc-definition)
  nmap     [lsp]j <Plug>(coc-definition)
  nmap     [lsp]r <Plug>(coc-references)
  nmap     [lsp]f <Plug>(coc-format)
  xmap     [lsp]f <Plug>(coc-format-selected)
  nmap     [lsp]a <Plug>(coc-codeaction)
  nmap     <F2>   <Plug>(coc-rename)
  nmap     [lsp]l <Plug>(coc-openlink)
  nmap     [lsp]n <Plug>(coc-diagnostics-next)
  nmap     [lsp]p <Plug>(coc-diagnostics-prev)
  nnoremap [lsp]c :CocCommand<CR>
  nnoremap [lsp]h :call CocActionAsync('doHover')<CR>
  nnoremap <C-h>  :call CocActionAsync('doHover')<CR>
elseif g:lsp_plugin is 'nvim-hs-lsp'
  setlocal omnifunc=NvimHsLspComplete
  nnoremap [lsp]i :NvimHsLspInitialize<CR>
  nnoremap [lsp]s :NvimHsLspStartServer<CR>
  nnoremap [lsp]q :NvimHsLspStopServer<CR>
  nnoremap <C-j>  :NvimHsLspDefinition<CR>
  nnoremap [lsp]j :NvimHsLspDefinition<CR>
  nnoremap [lsp]h :NvimHsLspInfo<CR>
  nnoremap [lsp]H :NvimHsLspHover<CR>
  nnoremap <C-h>  :NvimHsLspHoverFloat<CR>
  nnoremap [lsp]w :NvimHsLspLoadQuickfix<CR>
  nnoremap [lsp]r :NvimHsLspReferences<CR>
  nnoremap [lsp]f :NvimHsLspFormatting!<CR>
  xnoremap [lsp]f :NvimHsLspFormatting<CR>
  nnoremap [lsp]a :NvimHsLspCodeAction<CR>
  nnoremap [lsp]r :NvimHsLspRename 
  inoremap <C-o>  <C-x><C-o>
endif
"}}}

"coc.nvim {{{
if g:lsp_plugin is 'coc'
  set updatetime=300
  let g:coc_global_extensions = [
    \ 'coc-java',
    \ 'coc-git',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-pairs',
    \ 'coc-lists',
    \ 'coc-snippets',
    \ 'coc-neosnippet',
    \ 'coc-highlight'
    \ ]
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
  inoremap <expr> <CR>
    \ pumvisible() ? coc#refresh()."\<C-y>" : "\<CR>"
  inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
  inoremap <silent><expr> <S-Tab>
    \ pumvisible() ? "\<C-p>" :
    \ <SID>check_back_space() ? "\<S-Tab>" :
    \ coc#refresh()
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  autocmd CursorHold * silent call CocActionAsync('highlight')
endif
"}}}

" nvim-hs-lsp"{{{
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
if g:lsp_plugin is 'nvim-hs-lsp'
  let g:nvimhsPluginStarter=nvimhs#cabal#pluginstarter()
endif
"}}}

"deoplete{{{
let g:deoplete#enable_at_startup = g:lsp_plugin isnot 'coc'
if g:lsp_plugin isnot 'coc'
  call deoplete#custom#option('ignore_case', v:false)
  call deoplete#custom#option('camel_case', v:true)
  call deoplete#custom#var('terminal', 'require_same_tab', v:false)
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
  endfunction

  "<Tab>で選ぶ
  inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  "BS
  inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
  "cancel completion
  inoremap <C-c> <C-e>
endif
"}}}

"neosnippet{{{
imap <C-f> <Plug>(neosnippet_expand_or_jump)
smap <C-f> <Plug>(neosnippet_expand_or_jump)
xmap <C-f> <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_conceal_markers = 0
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'
"}}}

"fzf{{{
set rtp+=~/.fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ['right:50%:noborder']
nmap <C-u> [fzf]
nnoremap [fzf]b :FzfBuffers<CR>
nnoremap [fzf]h :FzfHistory<CR>
nnoremap [fzf]c :FzfFiles %:p:h<CR>
nnoremap [fzf]f :FzfFiles<CR>
nnoremap [fzf]g :FzfGFiles<CR>
nnoremap [fzf]G :FzfGFiles?<CR>
nnoremap [fzf]/ :FzfRg 
nnoremap <C-c>  :FzfCommands<CR>
"}}}

"lightline{{{
let g:lightline = {}
let g:lightline.component_function = {
      \ 'cocstatus': 'coc#status'
      \ }
let g:lightline.active = {
      \ 'left':  [['mode', 'paste'], ['readonly', 'relativepath', 'filetype', 'modified']],
      \ 'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'cocstatus']]
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

"{{{Neomake
let g:neomake_open_list=0
" let g:neomake_open_list=2
let g:neomake_place_signs=0
let g:neomake_echo_current_error=0
let g:neomake_virtualtext_current_error=0
nnoremap ! :NeomakeSh 
"}}}

"tcomment{{{
nmap ,, <Plug>TComment_gcc
vmap ,, <Plug>TComment_gc
vmap ,l <Plug>TComment_,_r
"vmap ,b <Plug>TComment_,_b
"vmap ,i <Plug>TComment_,_i
vmap ,b :TCommentRight!<CR>
vmap ,i :TCommentInline!<CR>
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

"vim-easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" FileType
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"C"{{{
autocmd FileType c setlocal expandtab ts=4 sts=4 sw=4
"}}}

"Java"{{{
autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4
"}}}

"sh"{{{
autocmd FileType sh   setlocal expandtab shiftwidth=2
autocmd FileType bash setlocal expandtab shiftwidth=2
"}}}

"Haskell"{{{
autocmd FileType haskell setlocal tabstop=2 shiftwidth=2 softtabstop=0 ambiwidth=single
autocmd FileType haskell inoremap <buffer> <C-d> $
autocmd FileType haskell let @a = "->"
autocmd FileType haskell let @b = "<-"

""syntax
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1

""other filetype
autocmd FileType cabal   setlocal expandtab tabstop=4
autocmd! BufNewFile,BufFilePRe,BufRead *.x set filetype=alex
autocmd! BufNewFile,BufFilePRe,BufRead *.y set filetype=happy
"}}}

"OCaml"{{{
""general
autocmd FileType ocaml setlocal tabstop=2 shiftwidth=2 softtabstop=0 commentstring=(*%s*)
""merlin
autocmd FileType ocaml let g:neomake_enabled_makers = ['dune'] "b:だと効かない
let g:neomake_ocaml_dune_maker = {
      \ 'exe': 'dune',
      \ 'args': ['build'],
      \ 'errorformat':
      \   join([ "%DEntering directory '%f',"
      \        , 'File "%f"\, line %l\, characters %c%m,%m']),
      \}
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

"Agda"{{{
"let maplocalleader="\\"
autocmd FileType agda setlocal expandtab ts=2 sts=2 sw=2
"autocmd FileType agda set commentstring=\ --%s
autocmd FileType agda set commentstring=--%s
"}}}

"Elm{{{
autocmd FileType elm nnoremap <buffer> ,w :ElmMake<CR>
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

"Scala {{{
autocmd FileType scala nnoremap <buffer><C-h> :update!<CR>:EnTypeCheck<CR>
autocmd FileType scala nnoremap <buffer>,t    :update!<CR>:EnInspectType<CR>
autocmd FileType scala nnoremap <buffer><C-j> :update!<CR>:EnDeclaration<CR>
"}}}

"Makefile {{{
autocmd FileType make setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
"}}}

"vim{{{
autocmd FileType vim setlocal et ts=2 sw=2 sts=2
"}}}

" Python{{{
let g:python_highlight_all = 1
autocmd FileType python Python3Syntax
"}}}

"Smt2{{{
autocmd FileType smt2 call PareditInitBuffer()
autocmd FileType smt2 setlocal lisp
autocmd FileType smt2 setlocal lispwords+=assert,forall,exists
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Other Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"My Command{{{
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
    while p is p0
      execute a:cmd
      let p = getpos('.')
    endwhile
  catch
    echomsg "no more items"
  endtry
endfunction "}}}
let g:init_vim = $XDG_CONFIG_HOME != ""
                  \ ? $XDG_CONFIG_HOME   . "/nvim/init.vim"
                  \ : $HOME . "/.config" . "/nvim/init.vim"
command! EditInitVim   execute "e " .  g:init_vim
command! SourceInitVim execute "so " .  g:init_vim
"}}}

"Key mapping{{{
"""esc
inoremap jk <Esc>
inoremap <C-j><C-k> <Esc>:w<CR>
nnoremap <C-\> :update<CR>
inoremap <C-\> <Esc>:update<CR>
"""tab
nnoremap <silent> tt  :<C-u>tabe<CR>
nnoremap tg gT
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"""delete
nnoremap dk ddk
nnoremap dj dd
inoremap <C-w> <esc>ldba
"""yank
nnoremap Y  y$
"""window
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
"""folding
nnoremap zn za
"""paste mode
nnoremap <F10> :set paste<CR>
autocmd InsertLeave * set nopaste
"""moving: normal mode
nnoremap <C-a> I
nnoremap <C-e> A
nnoremap gJ J
noremap J 5j
noremap K 5k
noremap H B
noremap L W
noremap <A-h> gE
noremap <A-l> E
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k
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
"""moving: insert mode
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-b> <esc>lBi
inoremap <C-n> <esc>lWi
inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
"""moving: mode
cnoremap <C-j> <down>
cnoremap <C-k> <up>
"""terminal
nnoremap te :terminal<CR>
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
"""other
nnoremap <Space>cd :cd %:h<CR>
nnoremap ^ :noh<CR>
vnoremap * "zy:let @/ = @z<CR>n
nnoremap <C-n> :CNextRecursive<CR>
nnoremap <C-p> :CPreviousRecursive<CR>
nnoremap <M-n> :LNextRecursive<CR>
nnoremap <M-p> :LPreviousRecursive<CR>
"}}}

"vim: set et ts=1 sts=2 tw=2:
