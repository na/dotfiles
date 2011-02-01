"enter spaces when tab is pressed
set expandtab
"use 4 spaces to represent a tab
set tabstop=4
set softtabstop=4
"number of space to use for auto indent
set shiftwidth=4
set autoindent
"make backspace key more powerful
set backspace=indent,eol,start
"show the search match while typing
set incsearch
"case insensitive search
set ignorecase
"show autocomplete option in status bar
set wildmenu
"use indent fold method
"TODO set with for only py files at file open
" set foldmethod=indent

" Removes trailing spaces
function TrimWhiteSpace()
	%s/\s*$//
	''
:endfunction
" Call TrimWhiteSpace for py files
set list listchars=trail:.,extends:>
autocmd FileWritePre *.py :call TrimWhiteSpace()
autocmd FileAppendPre *.py :call TrimWhiteSpace()
autocmd FilterWritePre *.py :call TrimWhiteSpace()
autocmd BufWritePre *.py :call TrimWhiteSpace()

set vb

syntax on

map <F3> :NERDTreeToggle <CR>

" Enable JavaScript code folding
function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=99
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl foldlevel=99
