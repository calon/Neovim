" 通用 "{{{1

source $VIMRUNTIME/mswin.vim
autocmd BufEnter * silent! lcd %:p:h "自动切换工作目录
" call pathogen#infect()
" let g:vimwiki_filetypes = ['markdown']
" let g:vimwiki_list = [{'path': 'c:/Data/OneDrive/Note/Inbox', 'auto_tags': 1, 'syntax': 'markdown', 'ext': '.md', 'diary_rel_path': '/diary'},
"                      \ {'path': 'c:/Data/OneDrive/Note/work', 'auto_tags': 1, 'syntax': 'markdown', 'ext': '.md'},
"                      \ {'path': 'c:/Data/OneDrive/Note/zk/Note', 'auto_tags': 1, 'syntax': 'markdown', 'ext': '.md'},
"                      \ {'path': 'c:/Data/OneDrive/Note/zk/Fooball', 'auto_tags': 1, 'syntax': 'markdown', 'ext': '.md'},
"                      \ {'path': 'c:/Data/OneDrive/Note/zk/Publish', 'auto_tags': 1, 'syntax': 'markdown', 'ext': '.md'}]
"
" let g:vimwiki_auto_chdir = 0
" let g:vimwiki_list_ignore_newline = 0
" let g:vimwiki_conceallevel = 0
" let g:vimwiki_conceal_onechar_markers = 0
" let g:vimwiki_key_mappings =
"     \ {
"     \ 'table_mappings': 0,
"     \ }

" nmap <C-Enter> <Plug>VimwikiFollowLink
" vmap <C-Enter> <Plug>VimwikiFollowLink
" nmap <S-Enter> <Plug>VimwikiVSplitLink
" vmap <S-Enter> <Plug>VimwikiVSplitLink

set termguicolors
" set guifont="更纱黑体 Mono SC Nerd":h14
set guifont=霞鹜文楷等宽:h20
set guifontwide=霞鹜文楷等宽:h20
set backupdir=c:\\Bak\\txt " 备份目录
" set directory=c:\\Bak\\swap " 交换目录
set undodir=c:\\Bak\\undo " 撤销文件目录
let g:Tlist_Ctags_Cmd = "c:/Application/ctags/ctags.exe"
let g:tagbar_ctags_bin = 'c:/Application/ctags/ctags.exe'
let g:autosave_backup = "c:\\Bak\\backup"
let g:autosave_timer = 60*1000*5
let g:netrw_browsex_viewer = "c:\\Application\\candy\\candy.exe"

" 界面 "{{{1

" 提示信息 "{{{2
set showcmd " 在屏幕最后一行显示 (部分的) 命令
set shortmess=aoOtTI " 缩写某些提示信息
set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
set list " 显示特殊字符
set listchars=tab:>-,nbsp:.
" set completeopt+=menuone,preview
set completeopt=menu,menuone,preview
set cc=80 "显示提示一定宽度的竖线
hi NonText guifg=bg
set title
" autocmd BufEnter * let &titlestring = "neovim: " . expand("%:t")

" 光标和标尺 "{{{2

set number " 显示行号
autocmd BufWinLeave * setlocal nocursorline " 非当前缓冲区取消高亮光标所在行
autocmd BufWinEnter * setlocal cursorline " 当前缓冲区高亮光标所在行

set backspace=2 " 退格会删除缩进、换行符和插入的起始位置
set iskeyword+=_,$,@,%,#,- " 定义一个word中可以包含哪些字符。"@"在这里代指所有的字母。

" 打开文件时回到上次光标所在的位置
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif


" 屏幕显示 "{{{2
set scrolloff=7 " 光标上下两侧最少保留的屏幕行数
set sidescrolloff=8 " 光标左右两侧最少保留的屏幕列数
set whichwrap=b,s,<,>,[,] "对某一个或几个按键开启到头后自动折向下一行的功能
" set redrawtime=1500
" set lazyredraw " 执行宏、寄存器和其它不通过输入的命令时屏幕不会重画
" set ttyfast
set nolinebreak
set concealcursor=n
set conceallevel=2
set display+=lastline

" 窗口分割 "{{{2

set nowinfixheight
set nowinfixwidth
set splitright
set splitbelow
set equalalways
set eadirection=both

" 状态栏设置 "{{{2
set laststatus=2 " 总是显示状态行

" 命令行 "{{{2
set wildmenu " 打开命令行补全功能

" 选择 "{{{2
set selection=inclusive " 选择区的最后一个字符包含在操作范围之内
set selectmode="" " 指定什么场合开始选择时启动选择模式而不是可视模式

" 文件、缓冲区和会话 "{{{1

" 备份、临时文件 "{{{2
set backup " 自动生成备份文件
set writebackup " 覆盖文件前建立备份
set noswapfile " 取消交换文件

" 历史和会话信息 "{{{2
set history=500
set sessionoptions=blank,curdir,folds,help,resize,tabpages,winpos,winsize " 保存和恢复会话时，同时保存和恢复的设置类型

" 缓冲区 "{{{2
set hidden " 退出时隐藏而不是卸载缓冲区
set confirm " 某些因为缓冲区有未保存的改变而失败的操作会弹出对话框要求确认
set switchbuf=usetab,usetab
set showtabline=0

" 撤销文件 "{{{2

" 每次在插入模式改变文本就打断撤销序列，确保可以灵活地撤销
autocmd TextChangedI * call RightUndo()

function! RightUndo()
    if bufname("%") != "[unite] - MRU_File"
        call feedkeys("\<C-G>u")
        call pumvisible()
    endif
endfunction

set undofile


" 文档处理设置 "{{{1

" 制表和缩进 "{{{2

if has("autocmd")

  " 开启文件类型侦测
  " 开启基于文件类型的自动缩进
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set smartindent " 智能缩进
set breakindent " 换行也保持缩进
set tabstop=4 " 制表符相当于4个空格
set softtabstop=4 " 插入制表符或者使用退格删除制表符时，把制表符算作4个空格
set shiftwidth=4 " 缩进一步对应的空格数
set expandtab " 插入模式里: 插入制表符时使用合适数量的空格。如果 'autoindent' 打开，'>' 和 '<' 命令使用空格进行缩进。
set shiftround " 缩进取整到 shiftwidth 的倍数。应用于 > 和 < 命令。
" 针对 Web 开发，统一缩进2个空格
autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js set tabstop=2 softtabstop=2 shiftwidth=2

" 语言、字符编码、输入法设置和排版 "{{{2
let &termencoding=&encoding
set encoding=utf-8 " 内部使用的字符编码为UTF-8
set fileencodings=utf-8,chinese,ucs-bom,gb18030,gbk,gb2312,cp936 "编辑已存在文件时，参考此字符编码列表
set helplang=cn " 帮助文件语言为中文
set langmenu=zh_CN.utf-8 " 菜单语言选项
language messages zh_CN.utf-8 " 弹出信息语言选项
set ambiwidth=double " 把所有的“不明宽度”字符——指的是在 Unicode 字符集中某些同时在东西方语言中使用的字符，如省略号、破折号、书名号和全角引号，在西方文字中通常字符宽度等同于普通 ASCII 字符，而在东方文字中通常字符宽度等同于两倍的普通 ASCII 字符，因而其宽度“不明”——的宽度置为双倍字符宽度（中文字符宽度）。此数值只在 encoding 设为 utf-8 或某一 Unicode 编码时才有效。需要额外注意的是，如果你通过终端使用 Vim 的话，需要令终端也将这些字符显示为双宽度。
set imcmdline " 开始编辑命令行时总是打开输入方法
" set iminsert=2 " 插入模式打开输入法
" set imsearch=2 " 搜索时打开输入法
set formatoptions+=1Bjmn

" 搜索 "{{{2

" 保持搜索结果在屏幕正中
nnoremap n nzzzv
nnoremap N Nzzzv
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=1000}

" 开启搜索高亮TrueType Collection
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set incsearch " 即时跳转到搜索目标所在行
set ignorecase " 搜索时忽略大小写
set smartcase " 搜索小写忽略大小写

" 剪贴板、寄存器 "{{{2
set clipboard^=unnamed,unnamedplus "与系统共剪贴板

" 列块编辑选项 "{{{2
set virtualedit+=block

" 其他文档处理脚本 "{{{2

" You can change external program path here
let g:app_path = "c:\\Application\\candy\\candy.exe"

function! Open_md_link()

    " move cursor to markdown link position
    execute "normal! vi(o\<Esc>"

    " get the full path and invoke external program to open it
    execute "!start" g:app_path expand('<cfile>:p', '\')

endfunction

nnoremap <silent> <Space>o :call Open_md_link()<CR>

" 按键映射 "{{{1

" 通用按键映射 "{{{2

" 自动补全
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" 进入命令行
nnoremap ; :
vnoremap ; :
nnoremap ； :
vnoremap ； :
nnoremap ： :
vnoremap ： :

" " backspace in Visual mode deletes selection
" vnoremap <BS> d
" 
" if has("clipboard")
"     " CTRL-X and SHIFT-Del are Cut
"     vnoremap <C-X> "+x
"     vnoremap <S-Del> "+x
" 
"     " CTRL-C and CTRL-Insert are Copy
"     vnoremap <C-C> "+y
"     vnoremap <C-Insert> "+y
" 
"     " CTRL-V and SHIFT-Insert are Paste
"     imap <C-V> <C-R>+
"     imap <S-Insert> <C-R>+
"     cmap <C-V> <C-R>+
"     cmap <S-Insert> <C-R>+
"     vmap <C-V> "+gP
"     vmap <S-Insert> "+gP
" endif
" 
" imap <S-Insert> <C-V>
" vmap <S-Insert> <C-V>
" 
" " Use CTRL-Q to do what CTRL-V used to do
" noremap <C-Q> <C-V>
" vnoremap <C-Q> <C-V>
" 
" " Use CTRL-S for saving, also in Insert mode (<C-O> doesn't work well when
" " using completions).
" noremap <C-S> :update<CR>
" vnoremap <C-S> <C-C>:update<CR>
" inoremap <C-S> <Esc>:update<CR>gi
" 
" " CTRL-Tab is Next window
" noremap <C-Tab> <C-W>w
" inoremap <C-Tab> <C-O><C-W>w
" cnoremap <C-Tab> <C-C><C-W>w
" onoremap <C-Tab> <C-C><C-W>w


" 命令行快捷操作

cnoremap <C-h> <BS>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>

" 复制到行末
nnoremap Y y$

" 快速保存 Quick save
nnoremap <F1> <Esc>zz:call Quick_save()<CR>
inoremap <F1> <Esc>zz:call Quick_save()<CR>a

" 打开另存为对话框
nnoremap <C-F1> <Esc>:browse saveas<CR>
inoremap <C-F1> <Esc>:browse saveas<CR>

" 切换显示绝对或相对行号
nnoremap <F2> <Esc>:call ToggleRelativeNumber()<CR>
inoremap <F2> <Esc>:call ToggleRelativeNumber()<CR>

" 显示/禁止搜索高亮
nnoremap <F3> <Esc>:call ToggleHLSearch()<CR>
inoremap <F3> <Esc>:call ToggleHLSearch()<CR>

" 插入时间戳
nnoremap <F4> a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>

" UndoTree 显示撤销历史
nnoremap <F5> <Esc>:UndotreeToggle<CR>
inoremap <F5> <Esc>:UndotreeToggle<CR>

set pastetoggle=<C-F5>

" Neovim GUI 切换缓冲区
nnoremap <C-6> <C-^>
inoremap <C-6> <Esc><C-^>
nnoremap <Space>b <C-^>
 
" 启用/禁止折行
nnoremap <F6> <Esc>:call ToggleWrap()<CR>
inoremap <F6> <Esc>:call ToggleWrap()<CR>

" 切换语法高亮
nnoremap <F7> <Esc>:call ToggleSyntaxHighlight()<CR>
inoremap <F7> <Esc>:call ToggleSyntaxHighlight()<CR>

function! ToggleSyntaxHighlight()
     if exists("g:syntax_on")
          syntax off
     else
          syntax enable
     endif
endfunction

" 模拟软换行
nnoremap <F8> <ESC>:call SimSoftWrap()<CR>
inoremap <F8> <ESC>:call SimSoftWrap()<CR>

" Vista
nnoremap <C-F8> :Vista!!<CR>
" nnoremap <C-F8> :TagbarToggle<CR>

" F9 for Vim-QuickUI

" 新建缓冲区
nnoremap <F10> <Esc>:enew<CR>
inoremap <F10> <Esc>:enew<CR>

" 关闭缓冲区
nnoremap <C-F10> <Esc>:bdelete<CR>
inoremap <C-F10> <Esc>:bdelete<CR>

" 关闭缓冲区时不更改窗口布局
nnoremap <A-F10> <Esc>:Bdelete<CR>
inoremap <A-F10> <Esc>:Bdelete<CR>

" F11 for Voom

" F12 for LeaderF

" BufferList
" map <silent> <F12> :call BufferList()<CR>

" BufferTabLine
map <silent> <C-F12> :call ToggleBufTabLine()<CR>

function! ToggleBufTabLine()
     if (g:buftabline_show==0)
          let g:buftabline_show=1
     else
          let g:buftabline_show=0
     endif
endfunction

" 切换当前目录
nnoremap <leader>cd :lcd %:p:h<CR>
set autochdir

" 标签页操作
nnoremap <leader>tn :tabnew<CR>
"nnoremap <leader>tc :tabclose<CR>

" 复制当前文件名
nnoremap <C-c> :let @+ = expand('%:t:r')<CR>
inoremap <C-c> <Esc>:let @+ = expand('%:t:r')<CR>

" 编辑和加载配置文件
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <Space>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

function! ToggleWrap()
     if &wrap
          set nowrap
     else
          set wrap
     endif
endfunction

function! ToggleHLSearch()
     if &hls
          set nohls
     else
          set hls
     endif
endfunction

function! ToggleRelativeNumber()
    if &rnu == 1
        set nonu
        set nornu
    elseif &nu == 0
        set nu
        set nornu
    else
        set nu
        set rnu
    endif
endfunction

" 缩进操作
vnoremap < <gv
vnoremap > >gv

" 粘贴文本后跳到最后的位置
vnoremap y y`]
vnoremap p p`]
nnoremap p p`]

vnoremap <Space>w c[]<Esc>Pf]a()<Esc>P

" 移动 "{{{2

" 窗口间跳转
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <S-Up> <C-W><Up>
nnoremap <S-Down> <C-W><Down>
nnoremap <S-Left> <C-W><Left>
nnoremap <S-Right> <C-W><Right>

nnoremap <Space>1 :exe 1 . "wincmd w"<CR>
nnoremap <Space>2 :exe 2 . "wincmd w"<CR>
nnoremap <Space>3 :exe 3 . "wincmd w"<CR>
nnoremap <Space>4 :exe 4 . "wincmd w"<CR>
nnoremap <Space>5 :exe 5 . "wincmd w"<CR>
nnoremap <Space>6 :exe 6 . "wincmd w"<CR>
nnoremap <Space>7 :exe 7 . "wincmd w"<CR>
nnoremap <Space>8 :exe 8 . "wincmd w"<CR>
nnoremap <Space>9 :exe 9 . "wincmd w"<CR>

" 上下移动
nnoremap k gk
nnoremap j gj
inoremap <Up> <Esc>gka
inoremap <Down> <Esc>gja

" 上下翻页
nnoremap <Space><Space> <C-D>
" nnoremap <BackSpace> <C-U>
" nnoremap <Enter><Enter> <C-D>
nnoremap <BackSpace><BackSpace> <C-U>

" 折叠 "{{{2

" nnoremap ss za
nnoremap <Space> za
set foldenable " 开始折叠
set foldmethod=marker " 设置语法折叠
setlocal foldlevel=1 " 设置折叠层数
set foldtext=CustomFoldText()
set foldopen=block,hor,jump,mark,percent,quickfix,search,tag,undo

function! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf

let g:html_dynamic_folds = 1

" 插件管理和配置 "{{{1

" Impatient "{{{2

" lua require('impatient')

" Buftabline "{{{2
let g:buftabline_show = 0
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

" BufferTabLine
map <C-F12> :call ToggleBufTabLine()<CR>

function! ToggleBufTabLine()
     if (g:buftabline_show==0)
          let g:buftabline_show=1
     else
          let g:buftabline_show=0
     endif
endfunction

" Bullet "{{{2

let g:bullets_pad_right = 0
" let g:bullets_outline_levels = ['num', 'abc', 'std-']

" Calendar "{{{2
" let g:calendar_monday = 1 "以星期一为开始 
" let g:calendar_focus_today = 1 " 光标在当天的日期上 
" let g:calendar_mark = 'left-fit' "可以让*和数字可靠近 

" Calendar.vim(itchyny) "{{{2

" Calendar-vim(mattn) "{{{2

" Calendar-vim(hotoo) "{{{2
let g:calendar_monday = 1
let g:calendar_weeknm = 5
let g:calendar_diary = "c:/Data/OneDrive/Note/Inbox/diary"
let g:calendar_filetype = 'markdown'
let g:calendar_focus_type = 'today'
let g:calendar_diary_path_pattern = '{YYYY}-{MM}-{DD}{EXT}'
noremap <Space>c <cmd>CalendarT<cr>
noremap <Space>d <cmd>call calendar#diary( strftime("%d"), strftime("%m"), strftime("%Y"), 0, g:calendar_diary)<cr>

" CoC "{{{2

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" Colorizer "{{{2
let g:colorizer_startup = 0

" Dict "{{{2

let g:vim_dict_config = {'html':'html,javascript,css', 'markdown':'text', 'txt':'text', 'python':'python', 'vim':'vim'}

" EasyAlign "{{{2

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" EasyMotion "{{{2

let g:EasyMotion_use_migemo = 1
noremap <Space>s <Plug>(easymotion-overwin-f2)

" HTML  "{{{2

let g:no_html_tab_mapping = 'yes'

" LazyList "{{{2

" let g:lazylist_maps = [
" 			\ '<Space>l' ,
" 			\ {
" 				\ 'l' : '',
" 				\ '-' : '- ',
" 				\ '+' : '+ ',
" 				\ '*' : '* ',
" 				\ ')' : '%1%) ',
" 			\ }
" 		\]

" IM-Select "{{{2

let g:im_select_default = '2052'

" IndentLine  "{{{2

" let g:indentLine_concealcursor = "n"

" Lightline "{{{2

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'percent' ], [ 'updatetime' ], [ 'size' ], [ 'colorname' ] ],
      \   'right': [ [ 'windownumber' ], [ 'lineinfo' ], [ 'fileformat' ], [ 'fileencoding' ], [ 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'windownumber' ], [ 'filename' ] ],
      \   'right': [ [ 'fileformat' ], [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'windownumber': 'WindowNumber',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'modified': 'MyModified',
      \   'size': 'FileSize',
      \   'updatetime': 'UpdateTime',
      \   'colorname': 'GetColorName'
      \ },
      \ 'subseparator': { 'left': '›', 'right': '‹' },
      \ 'colorscheme': 'custom'
      \ }

function! WindowNumber()
    return winnr()
endfunction

function! UpdateTime()
    return strftime("%Y-%m-%d %H:%M:%S", getftime(expand("%:p")))
endfunction

function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes
  else
    return (bytes / 1024) . "K"
  endif
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : 'No Format'
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'No Type') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! GetColorName()
  return g:colors_name
endfunction


" LeaderF "{{{2

" let g:Lf_HideHelp = 1
" let g:Lf_UseCache = 0
" let g:Lf_UseVersionControlTool = 0
" let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_AutoResize  = 1
" let g:Lf_PopupHeight = 0.7
" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" }
" let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
" let g:Lf_ShowDevIcons = 0

" let g:Lf_ShortcutF = '<leader>ff'
" noremap <leader><leader> :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>b :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <F12> :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <C-P> :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" noremap <C-l> :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
" noremap <C-F> :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
" noremap <leader>l :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" noremap <A-F7> :<C-U><C-R>=printf("Leaderf! rg -e %s", "")<CR>
" search visually selected text literally
" xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
" noremap go :<C-U>Leaderf! rg --recall<CR>

" Mini.visits "{{{2
nnoremap <C-S-P> :lua MiniVisits.select_path()<CR>


" MRU "{{{2
" noremap <C-P> :MRU<CR>

" Organ "{{{2
" if ! exists("g:organ_loaded")
"   " ---- DONT FORGET TO INITIALIZE DICTS BEFORE USING THEM
"   let g:organ_config = {}
"   let g:organ_config.prefixless_plugs = {}
"   let g:organ_config.completion = {}
"   let g:organ_config.list = {}
"   let g:organ_config.list.unordered = {}
"   let g:organ_config.list.ordered = {}
"   let g:organ_config.links = {}
"   let g:organ_config.templates = {}
"   let g:organ_config.expr = {}
"   " ---- enable for every file if > 0
"   " ---- default : 0
"   let g:organ_config.everywhere = 0
"   " ---- enable speed keys on first char of headlines and list items
"   " ---- default : 0
  " let g:organ_config.speedkeys = 1
"   " ---- key to trigger <plug>(organ-previous)
"   " ---- and go where speedkeys are available
"   " ---- examples : <m-p> (default), [z
"   let g:organ_config.previous = '<m-p>'
"   " ---- choose your mappings prefix (default)
"   let g:organ_config.prefix = '<m-n>'
"   " ---- enable prefixless maps
"   let g:organ_config.prefixless = 1
"   " ---- prefixless maps in these modes (default)
"   " ---- possible values : normal, visual, insert
"   let g:organ_config.prefixless_modes = ['normal', 'visual', 'insert']
"   " ---- enable only the prefixless maps you want
"   " ---- leave a list empty to enable all plugs in the mode
"   " ---- see the output of :map <plug>(organ- to see available plugs
"   " let g:organ_config.prefixless_plugs.normal = ['organ-backward', 'organ-forward']
"   " let g:organ_config.prefixless_plugs.visual = []
"   " let g:organ_config.prefixless_plugs.insert = []
"   " ---- whether to enable vowels-fuzzy completion
"   " ---- default : 0
"   let g:organ_config.completion.vocalize = 1
"   " ---- whether to enable word-fuzzy completion
"   " ---- default : 0
"   let g:organ_config.completion.wordize = 1
"   " ---- whether to enable full fuzzy completion
"   " ---- default : 0
"   let g:organ_config.completion.fuzzy = 0
"   " ---- whether to sort completion results by scores (default)
"   let g:organ_config.completion.scores = 0
"     " ---- number of spaces to indent each list level (default)
"   let g:organ_config.list.indent_length = 2
"   " ---- items chars in unordered list
"   let g:organ_config.list.unordered.org = ['-', '+', '*']
"   let g:organ_config.list.unordered.markdown = ['-', '+']
"   let g:organ_config.list.unordered.asciidoc = ['*', '**', '***']
"   " ---- items chars in ordered list
"   let g:organ_config.list.ordered.org = ['.', ')']
"   let g:organ_config.list.ordered.markdown = ['.']
"   let g:organ_config.list.ordered.asciidoc = ['.', '..', '...']
"   " ---- first item counter in an ordered list
"   " ---- must be >= 0, default 1
"   let g:organ_config.list.counter_start = 1
"   " ---- number of stored links to keep in history (default)
"   let g:organ_config.links.keep = 5
"   " ---- todo keywoard cycle
"   " ---- default : todo : TODO - DONE - none
"   " ---- no need to add none to the list
"   let g:organ_config.todo_cycle = ['TODO', 'DOING', 'DONE']
"   " ---- add/overwrite a template trigger & expansion
"   " ---- to see the default ones, run :echo organ#crystal#fetch('templates/expansions')
"   " -- #+begin_mystuff ... #+end_mystuff bloc
"   let g:organ_config.templates['<m'] = 'mystuff'
"   " -- #+mystuff: line
"   let g:organ_config.templates['+m'] = 'mystuff'
"   " ---- timestamp format
"   let g:organ_config.timestamp_format = '<%Y-%m-%d %H:%M:%S>'
"   " ---- number of evaluated expressions to keep in history (default)
"   let g:organ_config.expr.keep = 30
"   " ---- custom maps
" endif

" Simple Bookmarks "{{{2

let g:simple_bookmarks_use_pattern = 1

" SmartColumnColors "{{{2
" let g:smart_display_opts = { 'column' : 84 } 

" SQLite "{{{2

let g:sqlite_clib_path = "c:/Users/Calon/AppData/Local/nvim/sqlite/sqlite3.dll"

" SuperTab "{{{2

" let g:SuperTabNoCompleteAfter = ['^', ',', '\s', '"', "'", "，", "。", "！", "？", "“", "”", "‘", "’", "：", "；", "、"]
" let g:SuperTabDefaultCompletionType = "<c-n>"

" Tagbar "{{{2
let g:tagbar_sort = 0
let g:tagbar_left = 1
let g:tagbar_foldlevel = 0

" Tatgets "{{{2

" autocmd User targets#mappings#user call targets#mappings#extend({
"             \ 'b': {'pair': [{'o':'(', 'c':')'}, {'o':'[', 'c':']'}, {'o':'{', 'c':'}'}, {'o':'（', 'c':'）'}]},
"             \ 'q': {'pair': [{'o':'“', 'c':'”'}, {'o':'‘', 'c':'’'}, {'o':'「', 'c':'」'}, {'o':'『', 'c':'』'}]},
"             \ ',': {'separator': [{'d': ','}, {'d': '，'}]},
"             \ '.': {'separator': [{'d': '.'}, {'d': '。'}]},
"             \ ';': {'separator': [{'d': ';'}, {'d': '；'}]},
"             \ ':': {'separator': [{'d': ':'}, {'d': '：'}]},
"             \ '<': {'pair': [{'o': '<', 'c': '>'}, {'o': '《', 'c': '》'}, {'o': '〈', 'c': '〉'}]},
"             \ '>': {'pair': [{'o': '<', 'c': '>'}, {'o': '《', 'c': '》'}, {'o': '〈', 'c': '〉'}]},
"     \ })

autocmd User targets#mappings#user call targets#mappings#extend({
    \ 's': { 'separator': [{'d':','}, {'d':'.'}, {'d':';'}, {'d':':'}, {'d':'+'}, {'d':'-'},
    \                      {'d':'='}, {'d':'~'}, {'d':'_'}, {'d':'*'}, {'d':'#'}, {'d':'/'},
    \                      {'d':'\'}, {'d':'|'}, {'d':'&'}, {'d':'$'},
    \                      {'d':'“'}, {'d':'”'}, {'d':'‘'}, {'d':'’'},
    \                      {'d':'《'}, {'d':'》'}, {'d':'〈'}, {'d':'〉'},
    \                      {'d':'（'}, {'d':'）'}, {'d':'「'}, {'d':'」'}, {'d':'『'}, {'d':'』'},
    \                      {'d': '，'}, {'d': '。'}, {'d': '；'}, {'d': '：'}, {'d': '！'}, {'d': '？'}] },
    \ '@': {
    \     'separator': [{'d':','}, {'d':'.'}, {'d':';'}, {'d':':'}, {'d':'+'}, {'d':'-'},
    \                   {'d':'='}, {'d':'~'}, {'d':'_'}, {'d':'*'}, {'d':'#'}, {'d':'/'},
    \                   {'d': '，'}, {'d': '。'}, {'d': '；'}, {'d': '：'}, {'d': '！'}, {'d': '？'},
    \                   {'d':'\'}, {'d':'|'}, {'d':'&'}, {'d':'$'},
    \                   {'d':'“'}, {'d':'”'}, {'d':'‘'}, {'d':'’'},
    \                   {'d':'《'}, {'d':'》'}, {'d':'〈'}, {'d':'〉'},
    \                   {'d':'（'}, {'d':'）'}, {'d':'「'}, {'d':'」'}, {'d':'『'}, {'d':'』'},
    \                   {'d': '，'}, {'d': '。'}, {'d': '；'}, {'d': '：'}, {'d': '！'}, {'d': '？'}],
    \     'pair':      [{'o':'(', 'c':')'}, {'o':'[', 'c':']'}, {'o':'{', 'c':'}'}, {'o':'<', 'c':'>'},
    \                   {'o':'“', 'c':'”'}, {'o':'‘', 'c':'’'}, {'o':'（', 'c':'）'}, {'o':'「', 'c':'」'}, {'o':'『', 'c':'』'}, {'o': '<', 'c': '>'}, {'o': '《', 'c': '》'}, {'o': '〈', 'c': '〉'}],
    \     'quote':     [{'d':"'"}, {'d':'"'}, {'d':'`'}],
    \     'tag':       [{}],
    \     },
    \ })

" Telescope "{{{2

nnoremap <C-F> <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <Space>ff <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <A-F7> <cmd>Telescope live_grep<cr>
nnoremap <Space>fg <cmd>Telescope live_grep<cr>
nnoremap <F12> <cmd>Telescope buffers<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <Space>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>h <cmd>Telescope help_tags<cr>
" nnoremap <Space>fh <cmd>Telescope help_tags<cr>
nnoremap <A-P> <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <C-P> :Telescope oldfiles<CR>
" nnoremap <C-P> :Telescope frecency<CR>

" Txtfmt "{{{2
" 打开所有背景颜色
let g:txtfmtBgcolormask = "11111111"
let g:txtfmtColor{1} = '^\\%(k\\|bla\\%[ck]\\)$,c:Black,g:#303030'
let g:txtfmtColor{2} = '^g\\%[reen]$,c:DarkGreen,g:#A1FF0A'
let g:txtfmtColor{3} = '^r\\%[ed]$,c:DarkRed,g:#FF2222'
let g:txtfmtColor{4} = '^y\\%[ellow]$,c:DarkYellow,g:#EEFF22'
let g:txtfmtColor{5} = '^v\\%[iolet]$,g:#BE0AFF'
let g:txtfmtColor{6} = '^b\\%[lue]$,c:DarkBlue,g:#147DF5'
let g:txtfmtColor{7} = '^o\\%[range]$,g:#FF8700'
let g:txtfmtColor{8} = '^c\\%[yan]$,c:DarkCyan,g:#0AEFFF'
" let g:txtfmtColor{4} = '^t\\%[urquoise]$,c:DarkCyan,g:#0AEFFF'
" let g:txtfmtColor{6} = '^p\\%[ink]$,c:DarkMagenta,g:#FFB3FF'
" let g:txtfmtColor{8} = '^w\\%[hite]$,c:White,g:#EEEEEE'

" Vim-Bookmark "{{{2
let g:bookmark_sign = '>>'
let g:bookmark_annotation_sign = '##'

" Vim-Markdown "{{{2

let g:vim_markdown_no_extensions_in_markdown = 1

" Vim-WordMotion "{{{2

let g:wordmotion_spaces = ['。', '，', '！', '？', '：', '；', '”', '“', '‘', '’', '（', '）', '《', '》', '、', '…', '·', '—', '【', '】']

" VimWiki "{{{2

" let g:vimwiki_auto_chdir = 0
" let g:vimwiki_list_ignore_newline = 0
" let g:vimwiki_conceallevel = 0
" let g:vimwiki_conceal_onechar_markers = 0
" let g:vimwiki_key_mappings =
"     \ {
"     \ 'table_mappings': 0,
"     \ }
"
" nmap <C-Enter> <Plug>VimwikiFollowLink
" vmap <C-Enter> <Plug>VimwikiFollowLink
" noremap <Space>d <cmd>VimwikiMakeDiaryNote 1<cr>

" Voom  "{{{2
noremap <F11> <Esc>:VoomToggle markdown<CR>
noremap <S-F11> <Esc>:VoomToggle indents<CR>
noremap <C-F11> <Esc>:VoomToggle<CR>
let g:voom_python_versions = [3,2]
let g:voom_return_key = "<C-Enter>"
" let g:voom_tab_key = "<C-Tab>"

" Wiki.vim "{{{2

let g:wiki_filetypes = ['md', 'todo', 'txt']

let g:wiki_link_creation = {
        \ 'md': {
        \   'link_type': 'md',
        \   'url_extension': '',
        \ },
        \ 'org': {
        \   'link_type': 'org',
        \   'url_extension': '.org',
        \ },
        \ 'adoc': {
        \   'link_type': 'adoc_xref_bracket',
        \   'url_extension': '',
        \ },
        \ '_': {
        \   'link_type': 'md',
        \   'url_extension': '',
        \ },
        \}

" nmap <C-Enter> <plug>(wiki-link-follow)
" vmap <C-Enter> <plug>(wiki-link-follow)
" nmap <Space>d <plug>(wiki-journal)
"
let g:wiki_root = "c:/Data/OneDrive/Note/Inbox"
" let g:wiki_link_extension = '.md'
" let g:wiki_link_target_type = 'md'
" let g:wiki_write_on_nav = 1
"
let g:wiki_journal = {
    \ 'name': 'diary',
    \ 'root': 'c:/Data/OneDrive/Note/Inbox/diary',
    \ 'frequency': 'daily',
    \ 'date_format': {
    \   'daily' : '%Y-%m-%d',
    \ },
    \ 'index_use_journal_scheme': v:true,
    \}

" augroup init_calendar
"     autocmd!
"     autocmd FileType calendar
"             \ nnoremap <silent><buffer> <cr>
"             \ :<c-u>call wiki#journal#open()<cr>
" augroup END

" Comment "{{{2

" lua require('Comment').setup()

" Hop "{{{2

" lua << EOF
" require'hop'.setup( {keys = 'jetovxqpdygfblzhckisuranmw'} )
"     local hop = require('hop')
"     vim.keymap.set('', '<ESC><ESC>', function()
"         hop.hint_anywhere({ multi_windows = true })
"     end, {remap=true})
" EOF


" Marksman "{{{2

" lua require'lspconfig'.marksman.setup{}

" Nvim-Notify "{{{2

" lua vim.notify = require("notify")

lua require('plugins')

" Vim-QuickUI "{{{2

" clear all the menus
call quickui#menu#reset()

call quickui#menu#install('&File', [
            \ [ "查看历史文件\tCtrl+P", '' ],
            \ [ "加入收藏\t:FF", 'FF' ],
            \ [ "打开收藏\t:FE", 'FE' ],
            \ [ "打开缓冲区清单\t<F12>", 'Telescope buffers' ],
            \ [ "转换为网页文件\t:TOhtml", 'TOhtml' ],
            \ [ "切换工作目录到当前文件\t:cd %:h", 'cd %:h' ],
            \ ])

call quickui#menu#install('&Bookmark', [
            \ [ "打开书签\t:Telescope bookmarks", 'Telescope bookmarks' ],
            \ [ "打开书签清单\t:BookmarkQF", 'BookmarkQf' ],
            \ [ "加入书签\t:BookmarkAdd name", 'BookmarkAdd ' ],
            \ [ "打开书签\t:BookmarkGo name", 'BookmarkGo ' ],
            \ [ "删除书签\t:BookmarkDel name", 'BookmarkDel ' ],
            \ ])

call quickui#menu#install('&View', [
            \ [ "随机切换配色方案\t:CSnext", 'CSnext' ],
            \ [ "切换注释\tgcc", 'exe "normal! gcc"' ],
            \ [ "切换颜色代码自动着色\t:ColorToggle", 'ColorToggle' ],
            \ [ "设置为纯文本类型\t:set filetype=txt", 'set filetype=txt' ],
            \ [ "切换行号显示模式\t<F2>", 'call ToggleRelativeNumber()' ],
            \ [ "切换搜索结果高亮显示\t<F3>", 'call ToggleHLSearch()' ],
            \ [ "显示撤销历史\t<F5>", 'UndotreeToggle' ],
            \ [ "切换自动换行\t<F6>", 'call ToggleWrap()' ],
            \ [ "切换语法高亮显示\t<F7>", 'call ToggleSyntaxHighlight()' ],
            \ [ "模拟软换行\t<F8>", 'call SimSoftWrap()' ],
            \ [ "打开 TagList\t<Ctrl-F8>", 'TagbarToggle' ],
            \ [ "切换大纲视图（Markdown）\t<F11>", 'VoomToggle markdown' ],
            \ [ "切换大纲视图\t<Ctrl-F11>", 'VoomToggle' ],
            \ [ "标记当前词\t<Leader>m", 'call mark#MarkCurrentWord()<CR>' ],
            \ ])

call quickui#menu#install('&Edit', [
            \ [ "剔重排序，带 [!] 则反向排序\t:sort[!] u", 'sort u' ],
            \ [ "清除所有不包含指定字符串的行\t:v/xxx/d" ],
            \ [ "删除 HTML 的标签部分\t:%s/<\_.\{-1,\}>//g", '%s/<\_.\{-1,\}>//g' ],
            \ [ "删除 HTML 的标签部分\t:%s#<[^>]\+>##g", '%s#<[^>]\+>##g' ],
            \ [ "生成 Markdown ToC（GFM）\t:GenTocGFM", 'GenTocGFM' ],
            \ [ "创建折叠标记\t<Leader>f", 'echo "<Leader>ff表示子级折叠，<Leader>fc表示在注释中标记折叠"' ],
            \ [ "转换为 GB2312 编码\t:set fileencoding=cp936", 'set fileencoding=cp936' ],
            \ [ "转换为 UTF-8 编码\t:set fileencoding=utf-8", 'set fileencoding=utf-8' ],
            \ [ "跳回最后编辑的位置\t`.", 'exe "normal! `."' ],
            \ [ "切换大小写\t~", 'exe "normal! ~"' ],
            \ [ "显示光标位置，并统计字词\tg<Ctrl-g>", 'exe "normal! g\<c-g>"' ],
            \ [ "对齐\t:Tabularize/{pattern}", 'echo ":Tabularize/{pattern} "' ],
            \ ])

call quickui#menu#install('&Moion or Find', [
            \ [ "全屏定位跳转\ts", 'HopAnywhereMW' ],
            \ [ "汉字定位跳转\t<Space-S>", '' ],
            \ [ "模糊查找当前缓冲区内容\t<Ctrl-F>", 'Telescope current_buffer_fuzzy_find' ],
            \ [ "模糊查找文件内容\t<Alt-F7>", '' ],
            \ ])

call quickui#menu#install('&Display', [
            \ [ "调整字体大小\t<Leader><Leader>+/-" ],
            \ [ "聚焦部分段落高亮", 'Limelight!!' ],
            \ ])

call quickui#menu#install('&Format', [
            \ [ "打开高亮语法\t", 'set ft+=.txtfmt' ],
            \ [ "关闭高亮语法\t", 'set ft-=.txtfmt' ],
            \ [ "加粗\t<Leader>h fb", '' ],
            \ [ "下划线\t<Leader>h fu", '' ],
            \ [ "标记背景色\t<Leader>h k kbgcryov-", '' ],
            \ [ "标记前景色\t<Leader>h c kbgcryov-", '' ],
            \ ])

" call quickui#menu#install('&Packer', [
"             \ [ "安装插件\tPackerInstall", 'PackerInstall' ],
"             \ [ "编译插件\tPackerCompile", 'PackerCompile' ],
"             \ [ "同步插件\tPackerSync", 'PackerSync' ],
"             \ [ "查看插件状态\tPackerStatus", 'PackerStatus' ],
"             \ ])

call quickui#menu#install('&Lazy', [
            \ [ "检查插件更新版本\tLazy check", 'Lazy check' ],
            \ [ "安装缺失的插件\tLazy install", 'Lazy install' ],
            \ [ "同步插件\tLazy sync", 'Lazy sync' ],
            \ [ "查看插件状态\tLazy home", 'Lazy home' ],
            \ ])

call quickui#menu#install('&Session', [
            \ [ "列出会话清单\t:SessionList", 'SessionList' ],
            \ [ "保存会话记录\t:SessionSave [{name}:{description}]", 'SessionSave' ],
            \ [ "读取会话记录\t:SessionLoad", 'SessionLoad' ],
            \ ])

call quickui#menu#install('&Telescope', [
            \ [ "查看历史文件", 'Telescope frecency' ],
            \ [ "查看可用色彩方案", 'Telescope colorscheme' ],
            \ [ "查看标记", 'Telescope marks' ],
            \ [ "查看寄存器内容", 'Telescope registers' ],
            \ [ "查看按键映射", 'Telescope keymaps' ],
            \ [ "查看自动命令", 'Telescope autocommands' ],
            \ [ "查看帮助文档", 'Telescope help_tags' ],
            \ [ "查看跳转记录", 'Telescope jumplist' ],
            \ [ "查看命令记录", 'Telescope command_history' ],
            \ [ "查看 Vim 选项配置", 'Telescope vim_options' ],
            \ ])

" call quickui#menu#install('Wi&ki', [
"             \ [ "选择 Wiki 库\t<Leader>ws 或者 :VimwikiUISelect", 'VimwikiUISelect' ],
"             \ [ "打开 Wiki 索引文件\t<Leader>ww 或者 :VimwikiIndex", 'VimwikiIndex' ],
"             \ [ "打开日志文件索引\t<Leader>wi 或者 :VimwikiDiaryIndex", 'VimwikiDiaryIndex 1' ],
"             \ [ "更新日志文件索引\t<Leader>w<Leader>i 或者 :VimwikiDiaryGenerateLinks", 'VimwikiDiaryGenerateLinks' ],
"             \ [ "打开当天的日志文件\t<Leader>w<Leader>w 或者 :VimwikiMakeDiaryNote", 'VimwikiMakeDiaryNote 1' ],
"             \ [ "查看反向链接来源\t:VWB", 'VWB' ],
"             \ [ "插入表格\t:VimwikiTable", 'VimwikiTable' ],
"             \ [ "更新标签\t:VimwikiRebuildTags", 'VimwikiRebuildTags' ],
"             \ [ "插入或更新内容大纲\t:VimwikiTOC", 'VimwikiTOC' ],
"             \ [ "转换当前文件为网页\t<Leader>wh 或者 :Vimwiki2HTML", 'Vimwiki2HTML' ],
"             \ [ "转换所有文件为网页\t:VimwikiAll2HTML", 'VimwikiAll2HTML' ],
"             \ ])

call quickui#menu#install('&Window', [
            \ [ "垂直分割窗口\t<Ctrl-W> v 或 <Ctrl-W><Ctrl-V> 或 :vs" ],
            \ [ "水平分割窗口\t<Ctrl-W> s 或 <Ctrl-W><Ctrl-S> 或 :sp" ],
            \ [ "调整窗口高度\t<Ctrl-W> + 或 -" ],
            \ [ "调整窗口宽度\t<Ctrl-W> \< 或 \>" ],
            \ [ "统一所有窗口尺寸\t<Ctrl-W> =" ],
            \ [ "关闭当前窗口\t<Ctrl-W> c" ],
            \ ])

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

noremap <F9> :call quickui#menu#open()<cr>

" Modeline "{{{1
" vim:foldmethod=marker:foldlevel=0
