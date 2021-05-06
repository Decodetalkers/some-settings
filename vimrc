set nocompatible  "Turn off compatibility mode with Vi
set number "Show Line Numbers
set nowrap  "No automatic folding
set showmatch "Display matching parentheses
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

set nocompatible
set backspace=indent,eol,start
set encoding=utf-8
set guifont=DroidSansMono_Nerd_Font:h11
set fenc=utf-8
set ts=4
set mouse=a "To enable the mouse
set hlsearch  "Search highlight
set wrap "换行显示
syntax enable  "Syntax highlighting
set tabstop=4 "TAB equivalent space length
set shiftwidth=4
set softtabstop=4 
set expandtab 
set autoindent "Automatic indentation
set nocompatible
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/bundle')

"Plug 'VundleVim/Vundle.vim'
Plug 'davidhalter/jedi-vim'
Plug 'dense-analysis/ale'
Plug 'gaalcaras/ncm-R'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/neocomplete.vim'
Plug 'jalvesaq/Nvim-R'
Plug 'chrisbra/csv.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'sirver/UltiSnips'
Plug 'ncm2/ncm2-ultisnips'
"Plug 'Valloric/YouCompleteMe'
Plug 'godlygeek/tabular'
Plug 'hdima/python-syntax'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'calviken/vim-gdscript3'
Plug 'skywind3000/asyncrun.vim'
Plug 'humiaozuzu/dot-vimrc'
"Plug 'artur-shaik/vim-javacomplete2'
Plug 'preservim/nerdtree'
Plug 'Lokaltog/vim-powerline'
"Plug 'vim-scripts/javacomplete'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'walm/jshint.vim'
"Plug 'pangloss/vim-javascript'
Plug 'jamescarr/snipmate-nodejs'
Plug 'myhere/vim-nodejs-complete'
Plug 'guileen/vim-node'
Plug 'fatih/vim-go'
Plug 'WolfgangMehner/perl-support'
"Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
"Plun 'jmert/julia-vim'
Plug 'rust-lang/rust.vim'
Plug 'nosami/Omnisharp'
"Plug 'natebosch/vim-lsc-dart'
Plug 'othree/html5.vim'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'chen244/mypython'
Plug 'ryanoasis/vim-devicons'
"Plun 'iamcco/markdown-preview.nvim'
"Plun 'walm/jshint.vim'
"Plun 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'mattn/emmet-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'udalov/kotlin-vim'
Plug 'chen244/vim-run'
Plug 'vim-scripts/cpp.vim'
Plug 'honza/vim-snippets'
"Plugin 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'morhetz/gruvbox'
Plug 'peterhoeg/vim-qml'
Plug 'cespare/vim-toml'
Plug 'alaviss/nim.nvim'
Plug 'puremourning/vimspector'
Plug 'maksimr/vim-jsbeautify'
call plug#end()
"exec "source ~/.vim/bundle/vim-mypython/autoload/mypython.vim"
let g:airline#extensions#tabline#enabled = 1
set laststatus=2 "1为关闭底部状态栏 2为开启"
set t_Co=256     "终端开启256色支持"
set encoding=utf-8                                                                                                                
set langmenu=zh_CN.UTF-8
set ambiwidth=double "防止特殊符号无法正常显示
nmap ff :bn<cr> "设置tab键映射"

"let g:airline_theme='base16_bright'  " murmur配色也不错

autocmd BufNewFile,BufWritePre,BufRead *.js exec ":call JsBeautify()"
autocmd BufNewFile,BufWritePre,BufRead *.html exec "call HtmlBeautify()"
autocmd BufNewFile,BufWritePre,BufRead *.css exec ":call CSSBeautify()"
filetype plugin indent on
"-- omnicppcomplete setting --
" 按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
"nmap <F3> :MarkdownPreview<CR>
" 按下F2根据头文件内关键字补全
"imap <F2> <C-X><C-I>
"set completeopt=menu,menuone " 关掉智能补全时的预览窗口
"let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
"let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
"let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
"let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
"let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
"let OmniCpp_ShowAccess=1
"let g:jslint_command = 'jsl'
" 指定 jsLint 的启动参数，可以指定相应的配置文件
"let g:jslint_command_options = '-nofilelisting -nocontext -nosummary -nologo -process'
"" 插件的主要调用方式
""autocmd BufWritePost,FileWritePost *.js call JsonLint()
""map <C-f><C-g> :call JSHint()<cr>
"let g:OmniSharp_server_use_mono = 1
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"let g:ale_sign_column_always = 1
"let g:ale_set_hightlights = 1
"let g:ale_sign_error = 'x'
"let g:ale_sign_warning = '!'
"let g:ale_linters = { 'python':['pylint']}
""let g:ale_linters = { 'python':['pyflakes']}
"let g:syntastic_python_checkers=['python3.8.5']
""let g:syntastic_python_checkers=['pyflakes']
"let g:ncm_r_column_layout = 0
""let g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
"let g:tex_flavor='latex'
"let g:vimtex_view_method='skim'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'
"let g:asyncrun_open = 6
"let g:asyncrun_bell = 1
"let g:tagbar_width=30
"let g:OmniSharp_selector_ui = 'fzf'    " Use fzf
"let g:OmniSharp_selector_ui = 'clap'   " Use vim-clap
"let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
"let g:OmniSharp_selector_ui = 'unite'  " Use unite.vim
"let g:OmniSharp_selector_ui = ''       " Use vim - command line, quickfix etc.
"" 让omnisharp使用roslyn
"let g:OmniSharp_server_type = 'v1'
"let g:OmniSharp_server_type = 'roslyn'
"let g:OmniSharp_prefer_global_sln = 1
"
"" 设置omnisharp
"let g:OmniSharp_timeout = 1
set noshowmatch
set completeopt=longest,menuone,preview
let g:syntastic_cs_checkers = ['code_checker']
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2

"let g:syntastic_python_checkers = ['pyflakes']
let python_highlight_all=1
syntax on

"here is added
set updatetime=500
"//augroup omnisharp_commands
"//    autocmd!
"//    autocmd FileType cs call s:SetCSharpOptions()
"//    setlocal omnifunc=OmniSharp#Complete
"//    fun! s:SetCSharpOptions()
"//        autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
"//        "autocmd BufWritePost *.cs call OmniSharp#AddToProject()
"//        autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
"//        " 设置快捷键
"//        " F12转到定义
"//        nnoremap <F12> :OmniSharpGotoDefinition<cr>
"//        nnoremap gd :OmniSharpGotoDefinition<cr>
"//        " Ctrl+F12转到实现
"//        nnoremap <C-F12> :OmniSharpFindImplementations<cr>
"//        nnoremap fi :OmniSharpFindImplementations<cr>
"//        " F11查找使用
"//        nnoremap <F11> :OmniSharpFindUsages<cr>
"//        nnoremap fu :OmniSharpFindUsages<cr>
"//        nnoremap ft :OmniSharpFindType<cr>
"//        nnoremap fs :OmniSharpFindSymbol<cr>
"//        nnoremap fm :OmniSharpFindMembers<cr>
"//        nnoremap fx  :OmniSharpFixIssue<cr>
"//        nnoremap fxu :OmniSharpFixUsings<cr>
"//        nnoremap tt :OmniSharpTypeLookup<cr>
"//        nnoremap dc :OmniSharpDocumentation<cr>
"//        nnoremap <C-Up> :OmniSharpNavigateUp<cr>
"//        nnoremap <C-Down> :OmniSharpNavigateDown<cr>
"//        nnoremap gc :OmniSharpGetCodeActions<cr>
"//        vnoremap gcv :call OmniSharp#GetCodeActions('visual')<cr>
"//        " F2重命名
"//        nnoremap <F2> :OmniSharpRename<cr>
"//        nnoremap rl :OmniSharpReloadSolution<cr>
"//        nnoremap cf :OmniSharpCodeFormat<cr>
"//        nnoremap tp :OmniSharpAddToProject<cr>
"//        nnoremap ss :OmniSharpStartServer<cr>
"//        nnoremap sp :OmniSharpStopServer<cr>
"//        nnoremap th :OmniSharpHighlightTypes<cr>
"//        " F1切换buffer
"//        nnoremap <F1> :buffers<CR>:buffer
"//        " F5编译+运行
"//        nnoremap <F6> :make<CR>
"//        " Enter选择提示内容+显示文档
"//        inoremap <expr><Enter> pumvisible() ? "\<C-Y>\<Esc>:OmniSharpDocumentation<CR>a" : "\<Enter>"
"//        " Tab切换提示内容
"//        inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"//        " (选择提示内容+显示文档
"//        inoremap <expr>( pumvisible() ? "\<Esc>:OmniSharpDocumentation<CR>a(" : "("
"//        " 添加多行注释
"//        inoremap /// ///<Space><summary><CR><CR></summary><Esc>kA<Space>
"//        " 设置即时提示
"//        set completeopt+=menu
"//        set completeopt+=menuone
"//        set completeopt+=noinsert
"//        autocmd InsertCharPre * call s:TypeComplete()
"//        fun! s:TypeComplete()
"//            if pumvisible() && v:char !~ '\.'
"//                return ''
"//            endif
"//            if v:char =~ '\(\K\|\.\)'
"//                call feedkeys("\<C-x>\<C-o>", 'n')
"//            endif
"//        endfun
"//    endfun
"//augroup END
"////let g:ycm_language_server = 
"//  \ [ 
"//  "\   {
"//  "\     'name': 'godot',
"//  "\     'filetypes': [ 'gdscript' ],
"//  "\     'port': 6008,
"//  "\     'project_root_files': [ 'project.godot' ]
"//  "\    },
"//  \    {
"//  \      'name': 'ruby',
"//  \      'filetypes': ['ruby'],
"//  \      'cmdline': ['solargraph','stdio']
"//  \    }
"//  \ ]
"let g:LanguageClient_serverCommands = {
"    \ 'ruby': ['solargraph', 'stdio'],
"    \ }
"autocmd Filetype java set omnifunc=javacomplete#Complete 
"autocmd BufWritePre *.dart* DartFmt
"autocmd BufReadPost *.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()　
"map <F10> :call asyncrun#quickfix_toggle(6)<cr>
"nmap <F8> :TagbarToggle<CR>

"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"map <F5> :call CompileRunGcc()<CR>
"map <F6> :call Lncurses()<CR>
"map <F7> :call DebugGO()<CR>
"
"func! DebugGO()
"    exec "w"
"    if &filetype == 'go'
"        exec "vsplit"
"        exec "terminal go run %"
"        exec "set nonumber"
"    elseif &filetype == 'html'
"        exec "vs"
"        "exec "terminal w3m 127.0.0.1/%"
"        exec "terminal elinks 127.0.0.1/%"
"        exec "set nonumber"
"    elseif &filetype == 'xhtml'
"        exec "vs"
"        "exec "terminal w3m 127.0.0.1/%"
"        exec "terminal elinks 127.0.0.1/%"
"        exec "set nonumber"
"
"    elseif &filetype == 'php'
"        exec "vs"
"        "exec "terminal w3m 127.0.0.1/%"
"        exec "terminal elinks 127.0.0.1/%"
"        exec "set nonumber"
"    endif
"endfunc

"func! Lncurses()
"    exec 'w'
"    if &filetype == 'cpp'
"        "exec "w"
"        exec "!g++ % -o %< -lncurses"
"        exec "terminal ./%<"
"        exec "set nonumber"
"    elseif (&filetype == 'html' || &filetype == 'xhtml')
"        exec "!google-chrome-stable % &"
"    elseif (&filetype == 'java')
"        exec "vs"
"        exec "terminal javac --module-path /usr/share/openjfx/lib/ --add-modules javafx.controls % && java --module-path /usr/share/openjfx/lib/ --add-modules javafx.controls %<"
"    endif
"endfunc

"map <F9> :sv<CR><C-w>w:call Database()<CR>
"func! Database()
"    exec "set nonumber"
"    exec "terminal mysql -u CHT -p"
"endfunc

"func Creategz(filename)
"    exec "!touch"+filename+".gz"
"    exec "gzip "+filename+".gz"
"endfunc
"func! CompileRunGcc()
"
"        exec "w"
"
"    if &filetype == 'c'
"    
"        exec "!g++ % -o %<"
"        exec "vsplit"
"        exec "terminal ./%<"
"        exec "set nonumber"
"        "exec "!time ./%<"
"    
"    elseif &filetype == 'cpp'
"        "exec "!g++ % -o %<" 
"        "exec "!g++ % -o %< `pkg-config --cflags --libs opencv`"
"        "exec "!g++ % -o %< -lncurses"
"        exec "vsplit"
"        exec "terminal g++ % -o %< && ./%<"
"        exec "set nonumber"
"    elseif &filetype == 'cs'
"        
"        "exec "!mcs %"
"        exec "vsplit"
"        exec "terminal mcs % && mono ./%<.exe"
"        exec "set nonumber"
"
"        "exec "!mono ./%<.exe"
"    elseif &filetype == 'java'
"    
"        "exec "!javac %"
"        exec "vsplit"
"        exec "terminal javac % && java %<"
"        exec "set nonumber"
"
"        "exec "!time java %<"
"    
"    elseif &filetype == 'sh'
"    
"        exec ":!time bash %"
"    
"    elseif &filetype == 'python'
"    
"        exec "vs %"
"        exec "terminal python %"
"        exec "set nonumber"
"        "exec "vs %"
"    
"    elseif &filetype == 'javascript'
"        exec "vs"
"        exec "terminal node  %"
"        exec "set nonumber"
"    
"    elseif (&filetype == 'html' || &filetype == 'xhtml')
"        exec "vs"
"        exec "terminal elinks %"
"        exec "set nonumber"
"        "exec "!google-chrome-stable % &"
"    
"    elseif &filetype == 'go'
"    
"        "exec "!go build %"
"        exec "vsplit"
"        exec "terminal go build % && ./%<"
"        "exec "terminal go run %"
"        exec "set nonumber"
"
"        "exec "!time /usr/local/go/bin/go run %"
"    
"    elseif &filetype == 'markdown'
"    
"        exec "!google-chrome-stable %"
"    
"    elseif &filetype == 'tex'
"            exec "!xelatex %"
"            "exec "!pdflatex -synctex=1 -interaction=nonstopmode %"
"            exec "!pkill evince"
"            exec "!evince %:r.pdf &"
"    elseif &filetype == 'lua'
"    
"            exec "!time lua %"
"    
"    elseif &filetype == 'perl'
"   
"            exec "!time perl %"
"    elseif &filetype == 'dart'
"    
"            exec "!time dart %"
"    elseif &filetype == 'rust'
"        exec "vs"    
"        exec "terminal cargo build && cargo run"
"        "exec "terminal cargo run"
"    elseif &filetype == 'julia'
"            exec "!julia %"
"    elseif &filetype == 'vim'
"            exec "source %"
"    elseif &filetype == 'nroff'
"        exec "vs"
"        exec "terminal man ./%"
"        exec "set nonumber"
"    elseif &filetype == 'php'
"        exec "vs"
"        exec "set nonumber"
"        exec "terminal php %"
"    elseif &filetype == 'ruby'
"        exec "vs"
"        exec "set nonumber"
"        exec "terminal ruby %"
"    elseif &filetype == 'kotlin'
"        exec "vs"
"        exec "set nonumber"
"        exec "terminal kotlinc % -include-runtime -d %<.jar && java -jar %<.jar"
"    endif
"endfunc 
"hi Pmenu term=bold ctermbg=81 guibg=#555555
hi Pmenu ctermfg=223 ctermbg=239 guifg=#ebdbb2 guibg=#504945
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
"colorscheme gruvbox
"set background=dark
set foldmethod=syntax
"set foldmethod=manual
autocmd!   BufNewFile,BufRead *    setlocal nofoldenable
let g:vimspector_enable_mappings = 'HUMAN'
set showcmd
