"====== Keymap ======"
"set clipboard=unnamed
"set leader key
nnoremap <SPACE> <Nop>
let mapleader=" "
"nnoremap j gj
"nnoremap k gk

nnoremap <leader>r :Vex<CR>:e ~/.vimrc<CR>
"inoremap jk <esc>
" nnoremap H ^
" nnoremap L $

nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

"====== vimplug ======"
call plug#begin()
Plug 'prettier/vim-prettier'
Plug 'leoua7/my-snippets'
" Plug 'SirVer/ultisnips'
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf'
nnoremap <C-p> :<C-u>FZF<CR>
Plug 'tpope/vim-surround'

Plug 'Yggdroot/indentLine'
let g:indentLine_setConceal = 0
let g:indentLine_enabled = 1
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" latex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:vimtex_syntax_conceal_disable=1
set conceallevel=0
set concealcursor=nic
"let g:tex_conceal='abdmg'
"Plug 'xuhdev/vim-latex-live-preview'
"vim-latex-live-preview
"    autocmd Filetype tex setl updatetime=1
"    let g:livepreview_previewer = 'open -a Preview'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] }
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
let g:NERDTreeHidden = 0
let NERDTreeMinimalUI = 1
nnoremap <silent> <leader>o :NERDTreeToggle<CR>

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
let g:airline_theme='gruvbox'
"let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr=' '
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.colnr='|'
let g:airline#extensions#whitespace#enabled = 0
set background=dark    " Setting dark mode"

call plug#end()

"====== cocvim plugin ======"
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-java',
    \ 'coc-clangd',
    \ 'coc-htmldjango',
    \ 'coc-html',
    \ 'coc-marketplace',
    \ 'coc-snippets',
    \ ]

"====== cocvim config ======"
"set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"====== Start ======"
"让配置变更立刻生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"取消注释换行
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching


set number
"set rnu

"启用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"set tab as 4 space
set ts=2
set expandtab

"按C语言格式缩进
set cindent
set autoindent
set smartindent
set shiftwidth=2

"====== Colorscheme ======"
colorscheme gruvbox
"colorscheme monokai
"colorscheme wombat256mod
"colorscheme gardener
"colorscheme elflord
"colorscheme desert
"colorscheme evening
"colorscheme darkblue
"colorscheme torte
"colorscheme default

"语法高亮
syntax enable
" 高亮*.ejs文件，以html方式
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.styl set filetype=css
syntax on

set hlsearch
set incsearch
set ignorecase

"Ture Color
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif

"====== UI ======"
" gui settings start
"set guifont=FiraCode\ Nerd\ Font\ Freeze:h12
" 滚动条隐藏
set guioptions-=r 
set guioptions-=L
set guioptions-=b
" gui settings end

"设置分割线
"hi VertSplit cterm=none ctermbg=none gui=none guibg=Grey10 guifg=White

"增加鼠标行高亮
set cursorline
"hi CursorLine cterm=none ctermbg=red ctermfg=white
"hi CursorLineNr cterm=none ctermbg=red ctermfg=white


"显示Tab符，使用高亮竖线代替
set list
"set listchars=tab"\|\ ,
set listchars=tab:>-,trail:-

"Cursor shape
"1 -> blinking block  闪烁的方块
"2 -> solid block  不闪烁的方块
"3 -> blinking underscore  闪烁的下划线
"4 -> solid underscore  不闪烁的下划线
"5 -> blinking vertical bar  闪烁的竖线
"6 -> solid vertical bar  不闪烁的竖线
if &term =~ "xterm"
    "set cursor when vim enter
    " Insert mode
    let &t_SI = "\<Esc>[6 q"
    " Replace mode
    let &t_SR = "\<Esc>[3 q"
    " Exit Insert mode
    let &t_EI = "\<Esc>[2 q"
    "reset cursor shape when vim exits
    autocmd VimLeave * let &t_me="\<Esc>[6 q"
    "    you can also use this config blow
    "    autocmd VimLeave * silent !echo -ne "\e[2 q"
    "reset cursor color when vim exits"\033]12;white\007"
endif
" https://cloud.tencent.com/developer/article/1115043
if exists('$ITERM_PROFILE')
    if exists('$TMUX')
        let &t_SI = "\<Esc>[6 q"
        let &t_SR = "\<Esc>[4 q"
        let &t_EI = "\<Esc>[2 q"
        autocmd VimLeave * let &t_me="\<Esc>[6 q"
    endif
end


"====== FileType ======"
"侦测文件类型
filetype on
"载入文件类型插件
filetype plugin on
"为特定文件类型载入相关缩进文件
filetype indent on
" 启用自动补全
filetype plugin indent on

"设置编码自动识别, 中文引号显示
filetype on "打开文件类型检测
"set fileencodings=euc-cn,ucs-bom,utf-8,cp936,gb2312,gb18030,gbk,big5,euc-jp,euc-kr,latin1
set fileencodings=utf-8,gb2312,gbk,gb18030
"这个用能很给劲，不管encoding是什么编码，都能将文本显示汉字
"set termencoding=gb2312
set termencoding=utf-8
"新建文件使用的编码
set fileencoding=utf-8
"set fileencoding=gb2312
"用于显示的编码，仅仅是显示
set encoding=utf-8
"set encoding=utf-8
"set encoding=euc-cn
"set encoding=gbk
"set encoding=gb2312
"set ambiwidth=double
set fileformat=unix

"======= Quick run ======"
"map <F5> :call CompileRunGcc()<CR>
"
"func! CompileRunGcc()
"    silent exec "w"
"    if !isdirectory('build')
"        silent exec '!mkdir build'
"    endif
"    if &filetype == 'c'
"        silent exec '!g++ % -o build/%<'
"        exec '!./build/%<'
"    elseif &filetype == 'cpp'
"        silent exec '!g++ % -o build/%<'
"        exec '!./build/%<'
"    elseif &filetype == 'python'
"        exec '!python build/%'
"    elseif &filetype == 'java'
"        exec '!java %'
"    endif
"endfunc
"

" c++11
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
