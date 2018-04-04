""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Peng Cheng
" Version:
"   1.0 - 24/01/2018 10:42:33
" Sections:
"   -> General
"   -> Vim user interface
"   -> Colors and Fonts
"   -> Files and backups
"   -> Text,tab and indent related
"   -> Visual mode related
"   -> Moving around, tabs and buffers
"   -> Editing mappings
"   -> vimgrep searching and cope displaying
"   -> Misc
"   -> Helper function
"   -> Plugins configure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'trevordmiller/nova-vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', {'do': function('BuildYCM')}
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plugin 'marijnh/tern_for_vim'

call plug#end()


" Enable filetype plugins
filetype indent on              "针对不同文件类型采用不同缩进格式
filetype plugin on              "针对不同的文件类型加载对应的插件
filetype plugin indent on       "启用自动补全
set history=100 " Sets how many lines of history VIM has to remember

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let g:mapleader=","

" Fast saving and quit and so on
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" Quickly get out of insert mode without your fingers having to leave
" the home row (either use 'jj' or 'jk')
imap jj <Esc> 

map <leader>ss :setlocal spell!<CR> " Pressing ,ss will toggle and untoggle spell checking

set clipboard=unnamed

" set cursorline "突出显示当前行 卡顿

set foldmethod=indent
set foldlevel=99


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the wild menu
set wildmenu

" Ingore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignorecase case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax hightlighting
syntax on 
set t_Co=256
color molokai
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencodings=ucs-bom,utf-8,gbk,gb2312,default,latin1

" Use Unix as the standard file type
set ffs=unix,dos,mac
let g:sol = {
      \"gui": {
      \"base03": "#002b36",
      \"base02": "#073642",
      \"base01": "#586e75",
      \"base00": "#657b83",
      \"base0": "#839496",
      \"base1": "#93a1a1",
      \"base2": "#eee8d5",
      \"base3": "#fdf6e3",
      \"yellow": "#b58900",
      \"orange": "#cb4b16",
      \"red": "#dc322f",
      \"magenta": "#d33682",
      \"violet": "#6c71c4",
      \"blue": "#268bd2",
      \"cyan": "#2aa198",
      \"green": "#719e07"
      \},
      \"cterm": {
      \"base03": 8,
      \"base02": 0,
      \"base01": 10,
      \"base00": 11,
      \"base0": 12,
      \"base1": 14,
      \"base2": 7,
      \"base3": 15,
      \"yellow": 3,
      \"orange": 9,
      \"red": 1,
      \"magenta": 5,
      \"violet": 13,
      \"blue": 4,
      \"cyan": 6,
      \"green": 2
      \}
      \}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off                                       
set nobk
set nowb
"set noswapfile
set directory=~/tmp/vim/swap
set undodir=~/tmp/vim/undo
" 设置备份时的行为为覆盖
set backupcopy=yes 
"set directory=~/tmp/vim/swap if swap file is needed, use this

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab "Use spaces instead of tabs
set smarttab "Be smart when using tabs ; )

set tabstop=2       "将tab键改为4个空格
set softtabstop=2
set shiftwidth=2   "自动缩进时，使用4个空格，默认是8个

" Linebreak on 200 characters
set lbr
set tw=200

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set autoindent "C language indent
set nu              "Show line numbers 
set showcmd         "在ruler左边显示当前正在输入的命令，提示性的，避免误操作
set shell=/bin/zsh


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Visual mode related 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Moving around, tabs, windows and buffers 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break as break lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Userful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Editing mappings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()





""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Plugins configure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"pathogen用于管理插件的插件
"execute pathogen#infect() 

" NERDTree settings {{{
" nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
" map <Leader>n <plug>NERDTreeTabsToggle<CR>
" map <Leader>n :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1 "一直显示书签
let NERDTreeChDirMode=2 "打开书签时，自动将vim的pwd设为打开的目录，如果您的项目有tags文件，你会发现这个命令很有帮助
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1 " Show hidden files, too
let NERDTreeQuitOnOpen=1 " Quit on opening files from the tree
let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
let NERDTreeMouseMode=2 " Single click to fold/unfold directories and a double click to open
" Don't display these kinds of files
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.vim$', '\.class$', '\.beam$', '^CVS$', '\~$', '\.lo$', '\.o$', '\.so$', '\.DS_Store$', '\.git$', '\.idea$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeMapOpenInTab='<ENTER>'

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', '193', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', '224', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('rc', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('less', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('scss', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', '95', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('sh', 'blue', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ignore', '241', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('lock', 'red', 'none', '#ffa500', '#151515')
" nerdtree ends

let g:nerdtree_tabs_open_on_console_startup=1
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
" }}}

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


"taglist settings {{{
"nnoremap <leader>l :TlistClose<CR>:TlistToggle<CR>
"nnoremap <leader>L :TlistClose<CR>
"let Tlist_Show_One_File=1 "一次只显示一个文件的TAG
"let Tlist_Exit_OnlyWindow=1 "如果taglist是最后一个窗口则自动退出
"let Tlist_GainFocus_On_ToggleOpen=1 " put focus on the Taglist window when it opens
"let Tlist_Close_On_Select=0
"let Tlist_Use_Right_Window=1  "taglist win display right, if 0 left
"let Tlist_WinWidth=40
"let Tlist_Ctags_Cmd='/usr/bin/ctags'
"let g:tlist_javascript_settings='javascript;s:string;a:array;o:object;f:function'
"" }}}
"
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"
""ctags
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" vim-javascript settings {{{
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:javascript_plugin_jsdoc = 1 " Enable JSDoc highlighting
let g:javascript_plugin_flow = 1 " Enable Flow syntax highlighting
" JavaScript Concealing
" let g:javascript_conceal = 0
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
" }}}

" vim-jsx settings {{{
let g:jsx_ext_required = 0
" }}}

" emmet-vim settings {{{
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_leader_key='<C-e>'
" }}}

" ctrlp.vim settings {{{
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}
let g:ctrlp_user_command = 'find %s -type f'
" }}}

" ultisnips settings {{{
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsMappingsToIgnore = ['autocomplete']
let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']
" }}}

" YouCompleteMe settings {{{
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_filetype_blacklist = {
      \   'notes': 1,
      \   'unite': 1,
      \   'tagbar': 1,
      \   'pandoc': 1,
      \   'qf': 1,
      \   'vimwiki': 1,
      \   'infolog': 1,
      \   'mail': 1
      \ }
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}

" powerline settings {{{
set rtp+=~/Library/Python/2.7/lib/pyhont/site-packages/powerline/bindings/bash/powerline.sh
let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set noshowmode
" }}}

" vim-devicons settings {{{
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
augroup devicons
  autocmd!
  autocmd FileType nerdtree setlocal nolist
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
  autocmd FileType nerdtree setlocal conceallevel=3
  autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END
function! DeviconsColors(config)
  let colors = keys(a:config)
  augroup devicons_colors
    autocmd!
    for color in colors
      if color == 'normal'
        exec 'autocmd FileType nerdtree if &background == ''dark'' | '.
              \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
              \ 'else | '.
              \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
              \ 'endif'
      elseif color == 'emphasize'
        exec 'autocmd FileType nerdtree if &background == ''dark'' | '.
              \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
              \ 'else | '.
              \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
              \ 'endif'
      else
        exec 'autocmd FileType nerdtree highlight devicons_'.color.' guifg='.g:sol.gui[color].' ctermfg='.g:sol.cterm[color]
      endif
      exec 'autocmd FileType nerdtree syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
    endfor
  augroup END
endfunction
let g:devicons_colors = {
      \'normal': ['', '', '', '', ''],
      \'emphasize': ['', '', '', '', '', '', '', '', '', '', ''],
      \'yellow': ['', '', ''],
      \'orange': ['', '', '', 'λ', '', ''],
      \'red': ['', '', '', '', '', '', '', '', ''],
      \'magenta': [''],
      \'violet': ['', '', '', ''],
      \'blue': ['', '', '', '', '', '', '', '', '', '', '', '', ''],
      \'cyan': ['', '', '', ''],
      \'green': ['', '', '', '']
      \}
" call DeviconsColors(g:devicons_colors)
" }}}

" ale settings {{{
let g:ale_sign_column_always = 1 "始终开启标志列
let g:ale_set_highlights = 0
let g:ale_linters = {'javascript': ['eslint']}
" let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_linters = {'jsx': ['eslint']}
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_sign_warning = '⚠' "自定义warning图标
let g:ale_sign_error = '✖' "自定义error图标
" let g:ale_sign_error = '✗'
" hi AleErrorSign   guibg=#31363b guifg=#f67400 gui=NONE
" hi AleWarningSign guibg=#31363b guifg=#fdbc4b gui=NONE
hi clear ALEErrorSign
hi clear ALEWarningSign
hi ALEWarningSign ctermfg=yellow ctermbg=16
hi ALEErrorSign ctermfg=red ctermbg=16
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \}
let g:ale_fix_on_save = 1
" let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚠  %d', '✔ OK'] "在vim自带的状态栏中整合ale
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
" }}}

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))


command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>A :Ag<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" hi Directory guifg=#FF0000 ctermfg=Grey
