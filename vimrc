set nocompatible
filetype on
filetype off " This is weird but necessary for some reason for some plugin?

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'losingkeys/vim-niji' " Rainbow Parens
let g:niji_matching_filetypes = ['lisp', 'clojure', 'racket', 'scheme']
Plugin 'tpope/vim-repeat' " extend `.` to repeat more things
Plugin 'nacitar/terminalkeys.vim' " extend support for more TERM types
Plugin 'vim-scripts/paredit.vim' " Match parens
Plugin 'sudar/vim-arduino-syntax'
let g:paredit_electric_return = 0
let g:paredit_smartjump = 1
Plugin 'JuliaLang/julia-vim'
Plugin 'trusktr/seti.vim'
call vundle#end()

" Paredit: Leader first, then:
" <>: Slurp, barf
" J : join
" O : split ('open')
" W or w( : wrap (also with other wrappers)
" S : unwrap ('split')

" Recognize Racket files as Scheme
if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

" Colorscheme
colorscheme seti

" Syntax, Indents Etc
filetype plugin indent on
syntax on
set backspace=indent,eol,start
set number
set hlsearch
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set ai
set ruler

" Term Options
if &term =~ '256color'
  set t_ut=
endif
set t_Co=256

" Remaps
" Mathy Symbols
inoremap <buffer> \l λ
inoremap <buffer> \e σ
inoremap <buffer> \E Σ
inoremap <buffer> \b ⊥
inoremap <buffer> \d δ
inoremap <buffer> \G Γ 
inoremap <buffer> \a α 

" Disable Arrows
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
nnoremap  <Up>     <NOP>
nnoremap  <Down>   <NOP>
nnoremap  <Left>   <NOP>
nnoremap  <Right>  <NOP>

" Leader
let mapleader = ","
