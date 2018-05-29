
"dein {{{

filetype plugin indent on
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.config/nvim/dein'))
  call dein#begin(expand('~/.config/nvim/dein'))
  """essential
  "call dein#add('vim-airline/vim-airline')
  "call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/denite.nvim')
  "call dein#add('Shougo/echodoc.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('thinca/vim-quickrun')
  call dein#add('kana/vim-submode')
  "call dein#add('kien/ctrlp.vim')
  call dein#add('benekastah/neomake')
  call dein#add('kassio/neoterm')
  "call dein#add('Shougo/vimfiler')
  """便利
  call dein#add('Shougo/deol.nvim')
  "call dein#add('vim-scripts/zoom.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('vim-scripts/Align')
  call dein#add('kana/vim-smartinput')
  call dein#add('kana/vim-textobj-user')
  call dein#add('osyo-manga/vim-textobj-multiblock')
  call dein#add('osyo-manga/shabadou.vim')
  call dein#add('osyo-manga/vim-watchdogs')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('scrooloose/nerdtree')
  call dein#add('majutsushi/tagbar')
  call dein#add('bitc/lushtags')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('lambdalisue/gina.vim')
  call dein#add('thinca/vim-ref')
  """LSP
  "call dein#add('tjdevries/nvim-langserver-shim') "だめ
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('prabirshrestha/async.vim')
  "call dein#add('natebosch/vim-lsc')              "これから試す
  """""filetypeとか
  """Motion
  call dein#add('Lokaltog/vim-easymotion')
  call dein#add('rhysd/clever-f.vim')
  """Haskell
  call dein#add('neovimhaskell/haskell-vim')
  call dein#add('vim-scripts/alex.vim')
  call dein#add('vim-scripts/happy.vim')
  call dein#add('Hogeyama/nvim-hs-lsp')
  call dein#add('Hogeyama/ghc-mod-deoplete')
  call dein#add('Hogeyama/unite-haddock')
  call dein#add('Hogeyama/unite-haskellimport')
  """Scala
  call dein#add('derekwyatt/vim-scala')
  "call dein#add('ensime/ensime-vim')
  call dein#add('ktvoelker/sbt-vim')
  call dein#add('rhysd/vim-llvm')
  """Idris Agda
  call dein#add('idris-hackers/idris-vim')
  call dein#add('raichoo/agda-vim')
  """MarkDown
  call dein#add('Bakudankun/previm')
  call dein#add('tyru/open-browser.vim')
  call dein#add('vim-pandoc/vim-pandoc')
  call dein#add('vim-pandoc/vim-pandoc-syntax')
  """Coq
  call dein#add('jvoorhis/coq.vim')
  call dein#add('eagletmt/coqtop-vim')
  """Rust
  call dein#add('rust-lang/rust.vim')
  call dein#add('racer-rust/vim-racer')
  """Others
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('rgrinberg/vim-ocaml')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('Hogeyama/vimtex')
  """Color Scheme
  call dein#add('joshdick/onedark.vim')
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
  "true_color
  call dein#add('chriskempson/base16-vim')
  call dein#add('mhartington/oceanic-next') "OceanicNext
  """otameshi
  call dein#add('Yggdroot/indentLine')
  call dein#add('fholgado/minibufexpl.vim')
  "call dein#add('equalsraf/neovim-gui-shim')
  call dein#add('losingkeys/vim-niji')
  call dein#add('luochen1990/rainbow')
  "call dein#add('dannyob/quickfixstatus')
  "call dein#add('jceb/vim-hier')
  call dein#end()
  call dein#save_state()

  "remove unused plugins
  let unused = dein#check_clean()
  if len(unused) > 0
    echom "unused plugin: " . string(unused)
    if input("remove all unused plugins? (y/n): ") == "y"
      call map(dein#check_clean(), "delete(v:val, 'rf')")
      echom "removed"
    endif
  endif
endif
"}}}

"gonvim"{{{
if exists('g:GuiLoaded')
  GuiFont Rounded\ Mgen+\ 1mn\ Medium:h18:b
endif
"}}}

"Color"{{{
syntax on
set background=dark
"colorscheme maui
"colorscheme base16-atelier-estuary
"colorscheme base16-atelier-lakeside
"colorscheme base16-woodland
colorscheme base16-harmonic-dark
"colorscheme base16-material

let true_color = 1
if true_color == 1
  set termguicolors
  "対応表 http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
  "hi Normal guibg=#182020
  "hi LineNr guibg=#182020
else
  SeiyaEnable
endif
command! GoodMatchParen hi MatchParen ctermfg=253 guifg=#dadada ctermbg=0 guibg=#000000
command! Maui echo "maui"
  \ | colorscheme base16-spacemacs
  \ | colorscheme maui
  \ | hi Folded ctermbg=None guibg=None guifg=#506080
  \ | hi Normal guibg=#182020
  \ | hi LineNr guibg=None
  \ | GoodMatchParen
GoodMatchParen

hi Folded ctermbg=None guibg=None guifg=#506080
hi LineNr ctermbg=None guibg=None
au InsertLeave * GoodMatchParen

" terminal color
if has("nvim") "{{{
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
set fileencoding=utf-8
set termencoding=utf-8
let mapleader=","
let maplocalleader=","

filetype plugin on
filetype indent on
set mouse=
set ambiwidth=single
set foldmethod=marker
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
set sbr=\ \ >\ 
set noswapfile
set nobackup
set noundofile
set conceallevel=0
set laststatus=2
set completeopt=menuone,noselect,preview,noinsert
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
au QuickFixCmdPost *grep* cwindow
au FileType vim setlocal et ts=2 sw=2 sts=2

set statusline=\ %f\ %y%m%r%w%q\ %=(%l,%v)[%p%%]\ %{fnamemodify(getcwd(),':~')}\ \ \ 
"}}}

"""echodoc {{{
"doesn't work ;-)
inoremap <C-q> <C-e>
set splitbelow
set noshowmode
set cmdheight=2
let g:echodoc#enable_at_startup=0
"set completeopt+=noselect
"set completeopt-=preview
"autocmd CompleteDone,CursorMovedI * call s:on_cursor_moved()
set completeopt=menuone,noselect
"           menu     Use a popup menu to show the possible completions.  The
"                    menu is only shown when there is more than one match and
"                    sufficient colors are available.  |ins-completion-menu|
"
"           menuone  Use the popup menu also when there is only one match.
"                    Useful when there is additional information about the
"                    match, e.g., what file it comes from.
"
"           longest  Only insert the longest common text of the matches.  If
"                    the menu is displayed you can use CTRL-L to add more
"                    characters.  Whether case is ignored depends on the kind
"                    of completion.  For buffer text the 'ignorecase' option is
"                    used.
"
"           preview  Show extra information about the currently selected
"                    completion in the preview window.  Only works in
"                    combination with "menu" or "menuone".
"
"          noinsert  Do not insert any text for a match until the user selects
"                    a match from the menu. Only works in combination with
"                    "menu" or "menuone". No effect if "longest" is present.
"
"          noselect  Do not select a match in the menu, force the user to
"                    select one from the menu. Only works in combination with
"                    "menu" or "menuone".
"}}}

"Unite{{{
"設定
call unite#custom#profile('default', 'context', {
      \ 'start_insert': 0,
      \ 'winheight': 10,
      \ 'winwidth': 40,
      \ 'direction': 'botright',
      \ 'prompt_direction' : 'top'
      \ })
call unite#custom#source('file',
\   'ignore_pattern','\.\(hi\|o\|log\|gz\|dvi\|aux\|fdb_latexmk\|cmo\|cmi\|cmx\|cmt\)$')
"ヤンク履歴許可
let g:unite_source_history_yank_enable=100
"ファイル履歴最大
let g:unite_source_file_mru_limit=100

"""map
nnoremap [unite] <nop>
nmap     <C-u> [unite]
""ファイル操作
nnoremap [unite]y :Unite history/yank<CR>
nnoremap [unite]o :Unite -vertical outline<CR>
"nnoremap <expr><silent> <C-c>
"    \ quickrun#is_running() ?
"    \ quickrun#sweep_sessions() :
"    \ ":UniteWithBufferDir -buffer-name=files file<CR>"
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
call unite#custom#default_action('haddock', 'browse_remote')

"}}}

"Denite"{{{
hi CursorLine ctermbg=8
call denite#custom#map('normal', 'd'    , '<denite:do_action:delete>'     , 'nowait')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>'    ,         )
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>',         )
call denite#custom#map('normal', '<C-j>', '<denite:move_to_next_line>'    ,         )
call denite#custom#map('normal', '<C-k>', '<denite:move_to_previous_line>',         )
call denite#custom#map('normal', 'zh'   , '<denite:wincmd:h>', 'nowait'   ,         )
call denite#custom#map('normal', 'zj'   , '<denite:wincmd:j>', 'nowait'   ,         )
call denite#custom#map('normal', 'zk'   , '<denite:wincmd:k>', 'nowait'   ,         )
call denite#custom#map('normal', 'zl'   , '<denite:wincmd:l>', 'nowait'   ,         )
call denite#custom#map('normal', 'zw'   , '<denite:wincmd:w>', 'nowait'   ,         )
call denite#custom#map('normal', 'zW'   , '<denite:wincmd:W>', 'nowait'   ,         )
call denite#custom#map('normal', 'zt'   , '<denite:wincmd:t>', 'nowait'   ,         )
call denite#custom#map('normal', 'zb'   , '<denite:wincmd:b>', 'nowait'   ,         )
call denite#custom#map('normal', 'zp'   , '<denite:wincmd:p>', 'nowait'   ,         )
call denite#custom#map('normal', '..'   , '<denite:move_up_path>', 'nowait')
call denite#custom#map('normal', 'tt'   ,
  \ '<denite:toggle_matchers:matcher_regexp>', 'nowait')

call denite#custom#source('_', 'matchers', ['matcher_substring', 'matcher_ignore_globs'])
command! DeniteNext     Denite -resume -cursor-pos=+1 -immediately
command! DenitePrevious Denite -resume -cursor-pos=-1 -immediately
command! DeniteGrep     Denite -auto-resume -mode=normal -winheight=10 -no-quit grep
"nnoremap [denite] <nop>
"nnoremap <C-u>    [denite]
nnoremap [unite]r :Denite -resume<CR>
nnoremap [unite]b :Denite -auto-resume -mode=normal -winheight=10 buffer<CR>
nnoremap [unite]d :Denite -auto-resume -mode=normal -winheight=10 
nnoremap [unite]g :DeniteGrep<CR>
nnoremap [unite]n :DeniteNext<CR>
nnoremap [unite]p :DenitePrevious<CR>
nnoremap [unite]h :Denite -auto-resume -mode=normal -winheight=10 file_mru<CR>
nnoremap <C-c>    :DeniteBufferDir -mode=normal -winheight=10 file<CR>
"nnoremap <Space>c :Denite -auto-resume -mode=normal -winheight=10 file<CR>
"TODO outline, output

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/', '*.cmo*', '*.cmi',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'
      \ ])

"}}}

"QuickFix"{{{
au FileType qf call AdjustWindowHeight(5,5)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
"}}}

"QuickRun, WatchDogs{{{

let s:rust_errorformat =
  \ '%-Gerror: aborting due to previous error,'.
  \ '%-Gerror: aborting due to %\\d%\\+ previous errors,'.
  \ '%-Gerror: Could not compile `%s`.,'.
  \ '%Eerror[E%n]: %m,'.
  \ '%Eerror: %m,'.
  \ '%Wwarning: %m,'.
  \ '%Inote: %m,'.
  \ '%-Z\ %#-->\ %f:%l:%c,'.
  \ '%G\ %#\= %*[^:]: %m,'.
  \ '%G\ %#|\ %#%\\^%\\+ %m,'.
  \ '%I%>help:\ %#%m,'.
  \ '%Z\ %#%m,'

let g:quickrun_config = {
  \ '_' : {
  \   'runner/vimproc/updatetime' : 40,
  \   'outputter' : 'quickfix',
  \   'outputter/quickfix/open_cmd' : 'botright copen',
  \   'outputter/buffer/split' : ':botright',
  \   'hook/copen/enable_exit' : 1,
  \   'hook/copen/hook_command' : ':botright',
  \   'hook/copen/hook_args' : 'copen',
  \   'runner' : 'vimproc',
  \   },
  \ 'watchdogs_checker/_' : {
  \   'outputter/quickfix/open_cmd' : 'botright copen',
  \   'outputter/buffer/split' : ':botright',
  \   'hook/copen/enable_exit' : 1,
  \   'hook/copen/hook_command' : ':botright',
  \   'hook/copen/hook_args' : 'copen',
  \   },
  \ 'haskell' : {
  \   'command' : 'stack',
  \   'cmdopt' : 'runghc',
  \   'exec' : '%c %o %s',
  \   },
  \ 'rust' : {
  \   'command' : 'cargo',
  \   'cmdopt' : 'run',
  \   'exec' : '%c %o',
  \   "quickfix/errorformat" : s:rust_errorformat
  \       .'%-G\ %#Compiling%s,'
  \       .'%-G\ %#Finished%s,'
  \       .'%-G\ %#Running%s,'
  \   },
  \ 'rust/watchdogs_checker' : {
  \   'command' : 'cargo',
  \   'cmdopt' : 'build',
  \   'exec' : '%c %o',
  \   'hook/copen/hook_command' : ':botright',
  \   "quickfix/errorformat" : s:rust_errorformat
  \   },
  \ 'pandoc' : {
  \   'command' : 'pandoc-wrapper',
  \   'exec' : '%c %s',
  \   'hook/copen/enable_exit' : 0,
  \   'hook/close_quickfix/enable_success' : 1,
  \   'comment' : "成功したときは表示しない"
  \   },
  \}

function! TestErrFmt(errfmt,lines)
  let temp_errorfomat = &errorformat
  try
    let &errorformat = a:errfmt
    cexpr join(a:lines,"\n")
    copen
  catch
    echo v:exception
    echo v:throwpoint
  finally
    let &errorformat = temp_errorfomat
  endtry
endfunction

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

"NERD_tree, NERD_commenter"{{{
let g:NERDTreeWinPos="right"
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeIgnore=['\.bin$']
nnoremap <Space>n :NERDTreeToggle<CR>
nnoremap <Space>N :NERDTreeMirror<CR>
nmap ,, <plug>NERDCommenterToggle
vmap ,, <plug>NERDCommenterToggle

command! NERDTreeWithBufferDir call NERDTreeWithBufferDirFun()
function! NERDTreeWithBufferDirFun() abort
  let dir = fnamemodify(expand('%'),':p:h')
  echo "NERDTree " . dir
  exec "NERDTree " . dir
endfunction
"nnoremap <Space>c :NERDTreeWithBufferDir<CR>

"}}}

"deoplete neosnippet{{{
" Use deoplete.
let g:deoplete#enable_at_startup  = v:true
call deoplete#custom#option('ignore_case', v:false)
call deoplete#custom#option('camel_case', v:true)
" <Tab>で選ぶ
inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"BS
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<BS>"
"cancel completion
inoremap <C-c> <C-e>

"neosnippet
imap <C-f> <Plug>(neosnippet_expand_or_jump)
smap <C-f> <Plug>(neosnippet_expand_or_jump)
xmap <C-f> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'
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
let g:smartinput_no_default_key_mappings=0
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')
call smartinput#map_to_trigger('i', '(', '(', '(')
call smartinput#map_to_trigger('i', '{', '{', '{')
call smartinput#define_rule({
  \   'at'    : '{\%#}',
  \   'char'  : '<CR>',
  \   'input' : '<CR><Left><CR><Tab>',
  \   })
call smartinput#define_rule({
  \   'at': '\%#',
  \   'char': '(',
  \   'input': '()<Left>',
  \   })
call smartinput#define_rule({
  \   'at'    : '(\%#)',
  \   'char'  : '<Space>',
  \   'input' : '<Space><Space><Left>',
  \   })
call smartinput#define_rule({
  \   'at': '\%#',
  \   'char': '{',
  \   'input': '{}<Left>',
  \   })
"inoremap ( (
"inoremap { {
"}}}

"LSP {{{
let use_nvim_hs_lsp           = 1
let use_LanguageClient_neovim = 0
let use_vim_lsp               = 0

""" 'Hogeyama/nvim-hs-lsp'
if use_nvim_hs_lsp
  let g:NvimHsLsp_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'ocaml': ['ocaml-language-server', '--stdio'],
      \ 'haskell': ['stack', 'exec', '--', 'hie', '--lsp', '-d', '-l', '/tmp/LanguageServer.log'],
      \ }
  let g:NvimHsLsp_autoLoadQuickfix = 1
  nnoremap [nvim-hs-lsp] <nop>
  nmap     <C-l> [nvim-hs-lsp]
  nnoremap [nvim-hs-lsp]i :NvimHsLspInitialize<CR>
  nnoremap [nvim-hs-lsp]h :NvimHsLspInfo<CR>
  nnoremap [nvim-hs-lsp]H :NvimHsLspHover<CR>
  nnoremap [nvim-hs-lsp]j :NvimHsLspDefinition<CR>
  nnoremap [nvim-hs-lsp]w :NvimHsLspLoadQuickfix<CR>
endif

""" 'autozimu/LanguageClient-neovim'
if use_LanguageClient_neovim
  let g:LanguageClient_autoStart = 0
  let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'ocaml': ['ocaml-language-server', '--stdio'],
      \ 'haskell': ['stack', 'exec', '--', 'hie', '--lsp', '-d', '-l', '/tmp/LanguageServer.log'],
      \ }
  let g:LanguageClient_loggingLevel = 'DEBUG'
  au FileType haskell setlocal omnifunc=LanguageClient#complete
  au FileType haskell nnoremap <buffer> gi    :call LanguageClient_textDocument_hover()<CR>
  au FileType haskell nnoremap <buffer> <C-j> :call LanguageClient_textDocument_definition()<CR>
  au FileType haskell nnoremap <buffer> <F2>  :call LanguageClient_textDocument_rename()<CR>
  au FileType haskell inoremap <buffer> <C-o> <C-x><C-o>
  au FileType rust setlocal omnifunc=LanguageClient#complete
  au FileType rust nnoremap <buffer> Q     :call LanguageClient_textDocument_hover()<CR>
  au FileType rust nnoremap <buffer> <C-j> :call LanguageClient_textDocument_definition()<CR>
  au FileType rust nnoremap <buffer> <F2>  :call LanguageClient_textDocument_rename()<CR>
  au FileType rust inoremap <buffer> <C-o> <C-x><C-o>
  au FileType rust setlocal foldmethod=marker
endif

""" 'prabirshrestha/vim-lsp'
if use_vim_lsp
  let g:lsp_auto_enable       = 1
  let g:lsp_async_completion  = 1
  let g:lsp_log_verbose       = 1
  let g:lsp_log_file          = '/tmp/vim-lsp.log'
  let g:asyncomplete_log_file = '/tmp/vim-lsp-asyncomplete.log'
  au User lsp_setup call lsp#register_server({
      \ 'name': 'hie',
      \ 'cmd': {server_info->['stack', 'exec', '--', 'hie', '--lsp', '-d', '-l', '/tmp/LanguageServer.log']},
      \ 'whitelist': ['haskell'],
      \ })
  au User lsp_setup call lsp#register_server({
      \ 'name': 'rls',
      \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
      \ 'whitelist': ['rust'],
      \ })
  autocmd FileType haskell setlocal omnifunc=lsp#complete
  autocmd FileType haskell nnoremap <buffer> Q        :LspHover<CR>
  autocmd FileType haskell nnoremap <buffer> gi       :LspHover<CR>
  autocmd FileType haskell nnoremap <buffer> <C-j>    :LspDefinition<CR>
  autocmd FileType haskell nnoremap <buffer> <F2>     :LspReferences<CR>
  autocmd FileType haskell nnoremap <buffer> <Space>w :update!<CR>:LspDocumentDiagnostics<CR>
  autocmd FileType haskell inoremap <buffer> <C-o> <C-x><C-o>
endif

"QuickFixを開けっ放しにする場合は
au InsertLeave * let g:airline_disabled = 1
au FileType qf let g:airline_disabled = 1
"しとくといいかも
"}}}

"MiniBufExpr{{{
let g:miniBufExplorerAutoStart = 0
let g:miniBufExplBRSplit = 0
"}}}

" indentLine {{{
let g:indentLine_char = '⁞' "U+205E VERTICAL FOUR DOTS
let g:indentLine_char = '⏐' "U+23D0 VERTICAL LINE EXTENSION
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" FileType
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"C"{{{
au FileType c setlocal expandtab ts=4 sts=4 sw=4
"}}}

"sh"{{{
au FileType sh   setlocal expandtab shiftwidth=2
au FileType bash setlocal expandtab shiftwidth=2
"}}}

"Haskell"{{{
""general
au FileType haskell inoremap <buffer> <C-o> <C-x><C-o>
au FileType haskell setlocal tabstop=2 shiftwidth=2 softtabstop=0 ambiwidth=single
""nvim_hs_lsp
if use_nvim_hs_lsp
  au FileType haskell setlocal omnifunc=NvimHsLspComplete
  au FileType haskell nnoremap <buffer> [nvim-hs-lsp]a :NvimHsLspApplyRefactOne<CR>
  au FileType haskell nnoremap <buffer> <C-j> :NvimHsLspDefinition<CR>
  au FileType haskell nnoremap <buffer> <C-h> :NvimHsLspInfo<CR>
  au FileType haskell nnoremap <buffer> <Space>w :NvimHsLspLoadQuickfix<CR>
endif
""ghc-mod-nvim
au FileType haskell nnoremap <buffer> ,t :update!<CR>:NeoGhcModType<CR>
au FileType haskell nnoremap <buffer> ,T :update!<CR>:NeoGhcModType!<CR>
au FileType haskell nnoremap <buffer> ,i :update!<CR>:NeoGhcModInfo<CR>
au FileType haskell nnoremap <buffer> ,I :update!<CR>:NeoGhcModInfo 
au FileType haskell nnoremap <buffer> ,l :update!<CR>:NeoGhcModLintAll<CR>
au FileType haskell nnoremap <buffer> ^  :noh    <CR>:NeoGhcModTypeClear<CR>
""hoogle
call unite#custom_default_action('source/hoogle', 'preview')
au FileType haskell nnoremap <buffer> ,H :Unite hoogle<CR>
au FileType haskell nnoremap <buffer> ,h :Unite haskellimport<CR>
""fast-tags
au FileType haskell nnoremap <buffer> <Space>t :update!<CR>:QuickRun -exec "fast-tags -R ./"<CR>
""neovim-ghcmod
au FileType haskell nnoremap <buffer> ,c :GhcModCaseSplit<CR>
au FileType haskell nnoremap <buffer> ,d :GhcModAddDecl<CR>
""ghcid-nvim-hs
au FileType haskell nnoremap <buffer> ,w :update!<CR>:GhcidCheck!<CR>
au FileType haskell nnoremap <buffer> ,W :update!<CR>:GhcidCheck<CR>
au FileType haskell nnoremap <buffer> <Space>r :GhcidStopAll<CR>
""other file type
au FileType cabal   setlocal expandtab tabstop=4
au! BufNewFile,BufFilePRe,BufRead *.x set filetype=alex
au! BufNewFile,BufFilePRe,BufRead *.y set filetype=happy
""neco-ghc (currently not used)
"let g:necoghc_use_stack              = 1
"let g:necoghc_enable_detailed_browse = 1

"}}}

"OCaml"{{{
""general
au FileType ocaml inoremap <buffer> <C-o> <C-x><C-o>
au FileType ocaml setlocal tabstop=2 shiftwidth=2 softtabstop=0 commentstring=(*%s*)
""merlin
au FileType ocaml nnoremap <buffer> ,t :update!<CR>:MerlinTypeOf<CR>
au FileType ocaml vnoremap <buffer> ,t :MerlinTypeOfSel<CR>
au FileType ocaml nnoremap <buffer> >  :MerlinGrowEnclosing<CR>
au FileType ocaml nnoremap <buffer> <  :MerlinShrinkEnclosing<CR>
au FileType ocaml nnoremap <buffer> ,y :MerlinYankLatestType<CR>
au FileType ocaml nnoremap <buffer> ,w :update!<CR>:MerlinErrorCheck<CR>
au FileType ocaml nnoremap <buffer> <C-j> :update!<CR>:MerlinLocate<CR>
au FileType ocaml nnoremap <buffer> ^ :noh<CR>a<Esc>
""nvim_hs_lsp
if use_nvim_hs_lsp
  au FileType ocaml setlocal omnifunc=NvimHsLspComplete
  au FileType ocaml nnoremap <buffer> <C-j> :NvimHsLspDefinition<CR>
  au FileType ocaml nnoremap <buffer> <C-h> :NvimHsLspInfo<CR>
endif
"config for merlin and ocp-indent
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "helptags " . g:opamshare . "/merlin/vim/doc"
execute "set rtp^=" . g:opamshare . "/ocp-indent/vim"

"}}}

"Agda"{{{
"let maplocalleader="\\"
au FileType agda setlocal expandtab ts=2 sts=2 sw=2
"au FileType agda set commentstring=\ --%s
au FileType agda set commentstring=--%s
"}}}
"
"LaTeX{{{
au FileType tex setlocal et sw=2 sts=2 noautoindent
au BufRead,BufNewFile *.tex setlocal filetype=tex
au filetype tex nnoremap <buffer> ,w :update!<CR>:VimtexErrors<CR>
au filetype tex nnoremap <buffer> <C-q>    :update!<CR>:VimtexCompileSS<CR>
au filetype tex nnoremap <buffer> <F8>     :VimtexTocToggle<CR>
au filetype tex nnoremap <buffer> <Space>c :VimtexCountWords<CR>
let g:vimtex_view_general_viewer   = 'evince'
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

"有用そう
"   <localleader>lY  |<plug>(vimtex-labels-toggle)|        `n`
"   <localleader>ll  |<plug>(vimtex-compile-toggle)|       `n`
"   <localleader>lk  |<plug>(vimtex-stop)|                 `n`
"}}}

"MarkDown/Pandoc{{{
augroup pandoc_syntax
  au! BufNewFile,BufFilePRe,BufRead *.md set filetype=pandoc
augroup END
au FileType pandoc setlocal et ts=2 sw=2 sts=2 foldmethod=marker
au FileType pandoc let &spell = 0

let g:previm_enable_realtime = 1
let g:vim_markdown_math = 1
let g:pandoc#folding#mode = 'marker'
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#modules#disabled = ["folding", "chdir"]
"}}}

"Scheme{{{
au FileType scheme setlocal iskeyword=@,33,35-38,42-43,45-58,60-64,94,_,126
au FileType scheme setlocal et ts=2 sts=2 sw=2
"}}}

"Prolog{{{
au! BufNewFile,BufFilePRe,BufRead *.pl set filetype=prolog
"}}}

"Rust "{{{
let $RUST_SRC_PATH                 = expand('$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust')
let g:rustfmt_autosave             = 0
let g:rust_recommended_style       = 1
let g:racer_experimental_completer = 0
let g:rust_fold                    = 0
let g:racer_insert_paren           = 0
au FileType rust nmap <buffer> <C-j> <Plug>(rust-def)
au FileType rust nmap <buffer> gs    <Plug>(rust-def-split)
au FileType rust nmap <buffer> gv    <Plug>(rust-def-vertical)
au FileType rust nmap <buffer> gK    <Plug>(rust-doc)
let g:racer_no_default_keymappings=0
""nvim_hs_lsp
if use_nvim_hs_lsp
  au FileType rust setlocal omnifunc=NvimHsLspComplete
  au FileType rust nnoremap <buffer> <C-l>a :NvimHsLspApplyRefactOne<CR>
  au FileType rust nnoremap <buffer> <C-j>  :NvimHsLspDefinition<CR>
  au FileType rust nnoremap <buffer> <C-h>  :NvimHsLspInfo<CR>
endif


"}}}

"Scala {{{
au FileType scala nnoremap <buffer>,w    :update!<CR>:EnTypeCheck<CR>
au FileType scala nnoremap <buffer>,t    :update!<CR>:EnInspectType<CR>
au FileType scala nnoremap <buffer><C-j> :update!<CR>:EnDeclaration<CR>
"}}}

"Makefile {{{
au FileType make setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
"}}}

"json {{{
au FileType make setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Other Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"multiblock{{{
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)
"}}}

"EasyMotion{{{
"もっとちゃんと使おう
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
"""<C-d> $
inoremap <C-d> $
"""ttでtabnew
nnoremap <silent> tt  :<C-u>tabe<CR>
"""tgで前のタブ
nnoremap tg gT
"""<space>oで改行
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
"jkで<esc>
"inoremap jk <Esc>
inoremap jk <Esc>:w<CR>
inoremap <C-j><C-k> <Esc>:w<CR>
"""<Space>\で保存
nnoremap <C-\> :update!<CR>
inoremap <C-\> <Esc>:update!<CR>
"""qで閉じる
nnoremap q :q
"""削除関連
nnoremap dk ddk
nnoremap dj dd
nnoremap Y  y$
nnoremap dw diw
nnoremap diw dw
nnoremap cw ciw
nnoremap ciw cw
nnoremap yw yiw
nnoremap yiw yw
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
"""折りたたみ
nnoremap zn za
"""paste mode
nnoremap <F10> :set paste<CR>
au InsertLeave * set nopaste
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
"""<Space>cdで開いているファイルのディレクトリに移動する
nnoremap <Space>cd :cd %:h<CR>
"""QuickRun関連
nnoremap <C-q> :update!<CR>:QuickRun<CR>
nnoremap ,w    :update!<CR>:WatchdogsRun<CR>
"""ctag
nnoremap <C-j> <C-]>
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
"w/e motion
nnoremap b B
nnoremap B b
"nnoremap w W
"nnoremap W w
nnoremap e E
nnoremap E e
"""easymotion
nmap s <Plug>(easymotion-s2)
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
nmap <Space>; <Plug>(easymotion-prev)
"}}}

"Terminal他"{{{
"nnoremap .. :cd..<CR>
"nnoremap te :vs<CR><C-w>l:te<CR>
nnoremap te :vs<CR><C-w>l:Deol<CR>
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

"AirLine"{{{
"let g:airline_theme='wombat'
let g:airline_theme='distinguished'
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

if has('nvim') " This way, you can also put this in your plain vim config
  " function which starts a nvim-hs instance with the supplied name
  function! s:RequireHaskellHost(name)
    " It is important that the current working directory (cwd) is where
    " your configuration files are.
    return jobstart(['stack', 'exec', '--', 'nvim-hs', '-l', '/tmp/nvim-hs.log', '-v', 'DEBUG', a:name.name], {'rpc': v:true, 'cwd': expand('$HOME') . '/.config/nvim'})
  endfunction

  " Register a plugin host that is started when a haskell file is opened
  call remote#host#Register('haskell', "*.l\?hs", function('s:RequireHaskellHost'))

  " But if you need it for other files as well, you may just start it
  " forcefully by requiring it
  let hc=remote#host#Require('haskell')
endif
"}}}

"Align {{{
au VimEnter * AlignCtrl W=
"}}}

"Rainbow {{{
au FileType lisp nmap <buffer> <F7> :RainbowToggle<CR>
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

"tmp"{{{
let $BASH_ENV='~/.bashenv'
let g:previm_open_cmd="google-chrome"

nnoremap <F8> :TagbarToggle<CR>
nnoremap gs :Gstatus<CR>
vnoremap * "zy:let @/ = @z<CR>n
vnoremap ,a :Align 

command! -nargs=+ -complete=command Redir let s:reg = @@ | redir @"> | silent execute <q-args> | redir END | e /tmp/vim_tmp_redir | pu | 1,2d_ | let @@ = s:reg

command! RmTrailingWhiteSpaces %s/\s\+$//g | :noh

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

let g:init_vim = $XDG_CONFIG_HOME != ""
                  \ ? $XDG_CONFIG_HOME   . "/nvim/init.vim"
                  \ : $HOME . "/.config" . "/nvim/init.vim"
command! EditInitVim   execute "e " .  g:init_vim
command! SourceInitVim execute "so " .  g:init_vim
"}}}

nmap ,o <Plug>(openbrowser-open)

let g:python3_host_prog = '/usr/bin/python3.5'

map <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <C-w> :update!<CR>

"TODO
let g:pandoc_sel_option = '-fmarkdown+lists_without_preceding_blankline+ignore_line_breaks '
                      \ . '-t latex --listings '
function! PandocSel() range
  let lines = getline(a:firstline, a:lastline)
  let tmp = tempname()
  call writefile(lines, tmp.".md")
  execute "!pandoc " . g:pandoc_sel_option . tmp.".md " . "-o " . tmp."tex"
endfunction

"vim: set et ts=1 sts=2 tw=2:
