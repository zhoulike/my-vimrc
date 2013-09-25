"vundle
filetype off
set rtp+=~/.vim/bundle/vundle   "linux下
call vundle#rc()
"set rtp+=$HOME/vimfiles/bundle/vundle  "win下
"call vundle#rc('$HOME/vimfiles/bundle/vundle')
Bundle 'gmarik/vundle'
"vim-script(github)上的直接用名称，空格用-代替
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
"Bundle 'AutoComplPop'
Bundle 'taglist.vim'
Bundle 'javacomplete'
"github上的仓库
Bundle 'fholgado/minibufexpl.vim' 
Bundle 'tomasr/molokai'
Bundle 'fs111/pydoc.vim'
Bundle 'scrooloose/syntastic'
"Bundle 'hdima/python-syntax'
"Bundle "Rip-Rip/clang_complete"
"Bundle "SirVer/ultisnips"
Bundle "zhoulike/ultisnips"
Bundle 'Lokaltog/powerline'
"Bundle 'Lokaltog/vim-powerline'
Bundle "Valloric/YouCompleteMe"
Bundle "ervandew/supertab"
"Bundle "terryma/vim-multiple-cursors"
"Bundle "bling/vim-airline"

"与vi不兼容,好像是编译vim7.4会有这样的问题。退格不能删除换行符
set nocompatible
set backspace=indent,eol,start

"设定tab宽度为4个字符
set ts=4
"设定自动缩进为4个字符 
set sw=4
"用space替代tab的输入, set noexpandtab
"set expandtab
"set smarttab
"开启cindent
set ci

"Python
"et:expandtab,sta:smarttab,sw:shiftwidth,sts:softtabstop：每次退格删除多个空格
autocmd FileType python setlocal et sta sw=4 sts=4
"代码折叠，以缩进为依据，默认展开所有代码,za映射到F3
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99

"突出显示当前行
set cursorline
"开启语法高亮
syntax enable
syntax on
"依文件类型设置自动缩进
filetype plugin indent on
"显示当前的行号列号
set ruler
"在状态栏显示正在输入的命令
set showcmd
"显示行号
set number
"colorcolumn,设置80列高亮
set cc=80
"为方便复制，用<F2>开启/关闭行号显示
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
"启用Modeline（即允许被编辑的文件以注释的形式设置Vim选项)
set modeline
set hlsearch "搜索高亮
"为深色背景调整配色
set background=dark
"set background=light
"molokai需要t_Co
colorscheme molokai
set t_Co=256

"Python自动补全,系统提供的函数/变量
"filetype plugin on
"let g:pydiction_location = '~/.vim/complete-dict'
"系统自带的补全，文件内变量/函数
"set completeopt+=longest
"set completeopt=menu,longest
"let g:acp_completeoptPreview=1
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
autocmd FileType python set omnifunc=pythoncomplete#Complete
au FileType java setlocal omnifunc=javacomplete#Complete 
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"AutoComplPop在补全时显示预览窗口
"SuperTab: 1-记录上次的补全方式，直到用其他补全命令改变它
"let g:SuperTabRetainCompletionType=0
"设置按下<Tab>后的默认补全方式，改为<C-X><C-O>。就是omni completion
"let SuperTabMappingForward="<Tab>"
"let SuperTabMappingBackward="<S-Tab>"
"au FileType python let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"au FileType c let g:SuperTabDefaultCompletionType="<c-n>"
"au FileType c let g:acp_behaviorKeywordLength=-1
"au FileType c let g:acp_completeoptPreview=0
"au FileType c let g:acp_behaviorKeywordIgnores =  ["int"]
"let g:SuperTabDefaultCompletionType="<c-n>"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabNoCompleteAfter = ['^', ',', '\s']
"inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"

"Taglist{
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Auto_Open=1
"}

"NERDTree{
let NERDTreeWinPos="right"
"最后一个窗口是NERDTree的话关闭NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 
"}

"miniBufExpl{
let g:miniBufExplForceSyntaxEnable = 1
"}

"ctags
"set tags+=~/.vim/systags

"syntastic{
let g:syntastic_python_checkers=['flake8']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
"}

"key mappings{
"noremap <C-J>     <C-W>j
"noremap <C-K>     <C-W>k
"noremap <C-H>     <C-W>h
"noremap <C-L>     <C-W>l
map <F3> za
noremap <silent> <F4> :Tlist<CR>
noremap <silent> <F5> :NERDTree<CR>
imap jj <Esc>
"}

"上次打开文件位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"clang-complete{
"let g:clang_auto_select=0
"let g:clang_complete_auto=1
"let g:clang_complete_copen=1
""let g:clang_close_preview=1
"let g:clang_snippets=1
""let g:clang_snippets_engine='clang_complete'
"let g:clang_snippets_engine='ultisnips'
"let g:clang_use_library=1
"let g:clang_library_path='/usr/local/lib/'
""let g:clang_auto_user_options='~/.clang_complete'
"}

"UltiSnips{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
"}

"YouCompleteMe{
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"此时可以使用CTRL-O后退，详细见:h jumplist
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
"}

"SuperTab{
"let g:SuperTabDefaultCompletionType = '<C-Tab>'
"}

"powerline{
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
set noshowmode
"}

"vim-airline{
"let g:airline_theme='powerlineish'
"if !exists('g:airline_symbols')
	"let g:airline_symbols = {}
"endif
"" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"}
