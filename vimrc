syntax on
filetype plugin on

" {{{ Options
set nocompatible
set encoding=utf-8
set noswapfile
set nobackup
set nowritebackup
set history=1000
set undolevels=1000
set updatetime=300
set laststatus=2
set colorcolumn=80
set relativenumber
set splitright
set splitbelow
set shiftround
set hidden
set autoread
set cmdheight=1
set shortmess+=c
set path+=**
set nowrap
set backspace=indent,eol,start
set number
set ruler
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set cursorline
set background=dark
set termguicolors
set foldmethod=marker
set showmatch
set hlsearch
set incsearch
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set spelllang=en_gb
set spellfile=local.utf-8.add
set completeopt=longest,menuone
set signcolumn=yes
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_list_hide='.*\.git/$'
let g:netrw_winsize=30
" }}}

" {{{ Plugins
call plug#begin()
  " Useful stuff
  Plug 'airblade/vim-gitgutter'
  Plug 'pacha/vem-tabline'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-commentary'
  Plug 'benjifisher/matchit.zip'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
call plug#end()
" }}}

colorscheme desert
nnoremap <Space> <Nop>
let mapleader = ' '

" Copy and Paste from system clipboard in visual mode
vnoremap <c-y> "+y
vnoremap <c-p> "+p

" Remove search HL on return
nnoremap <CR> :noh<CR><CR>

" Ghetto NERDTree
nnoremap <leader>f :Lexplore <CR>

" Buffers
noremap <leader>q :bdelete <CR>
noremap <leader><tab> :bn <CR>

" Delete whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Oooops
command! W noautocmd w

" File associations
autocmd BufRead,BufNewFile *.v set filetype=verilog
autocmd BufRead,BufNewFile *.sv set filetype=systemverilog
autocmd BufRead,BufNewFile *.yml set filetype=yaml
autocmd BufRead,BufNewFile *.r set filetype=xml

" Allow tab in makefiles
autocmd FileType make setlocal noexpandtab
autocmd FileType make setlocal tabstop=8 softtabstop=8 shiftwidth=8


autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType c setlocal tabstop=8 softtabstop=8 shiftwidth=8
autocmd FileType cpp setlocal tabstop=8 softtabstop=8 shiftwidth=8

" {{{ Statusline
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{FugitiveStatusline()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ λ
" }}}

" {{{ QuickFixCmdPost - vimgrep quickfix etc
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END
" }}}

" {{{ LSP Settings
if executable('svls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'svls',
        \ 'cmd': {server_info->['svls']},
        \ 'allowlist': ['systemverilog'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <leader>d <plug>(lsp-document-diagnostics)
    nmap <buffer> <leader>gd <plug>(lsp-definition)
    nmap <buffer> <leader>gs <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>gr <plug>(lsp-references)
    nmap <buffer> <leader>gi <plug>(lsp-implementation)
    nmap <buffer> <leader>gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> <leader>K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)


    let g:lsp_diagnostics_virtual_text_enabled = 1
    let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 1
    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" }}}

" {{ Completion
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" }}

" {{{ Snippets
imap <expr> <tab>   vsnip#jumpable(1)   ? '<plug>(vsnip-jump-next)'      : '<tab>'
smap <expr> <tab>   vsnip#jumpable(1)   ? '<plug>(vsnip-jump-next)'      : '<tab>'
imap <expr> <s-tab> vsnip#jumpable(-1)  ? '<plug>(vsnip-jump-prev)'      : '<s-tab>'
smap <expr> <s-tab> vsnip#jumpable(-1)  ? '<plug>(vsnip-jump-prev)'      : '<s-tab>'

imap <expr> <c-e>   vsnip#expandable()  ? '<plug>(vsnip-expand)'         : '<c-e>'
smap <expr> <c-e>   vsnip#expandable()  ? '<plug>(vsnip-expand)'         : '<c-e>'
" }}}

