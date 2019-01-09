set nocompatible
filetype on
filetype off " This is weird but necessary for some reason for some plugin?

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle
Plugin 'gmarik/Vundle.vim'
" Style
Plugin 'airblade/vim-gitgutter' " Git marks on the side
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 " RAINBOW ALWAYS
" Keys and Functionality
Plugin 'tpope/vim-repeat' " extend `.` to repeat more things
Plugin 'GEverding/vim-hocon'
Plugin 'nacitar/terminalkeys.vim' " extend support for more TERM types
Plugin 'ctrlpvim/ctrlp.vim' " File searcher
Plugin 'tranchis/paredit.vim' " Match parens for lispy langs
Plugin 'ensime/ensime-vim' " Scala sbt integ
Plugin 'tpope/vim-surround' " Better bracket placement and nav
let g:paredit_electric_return = 0
let g:paredit_smartjump = 1
let g:paredit_full_balancing = 1
" Langs
Plugin 'sudar/vim-arduino-syntax'
Plugin 'JuliaLang/julia-vim'
Plugin 'derekwyatt/vim-scala'
" Colorschemes
Plugin 'trusktr/seti.vim'
Plugin 'sjl/badwolf'
Plugin 'koirand/tokyo-metro.vim'
call vundle#end()

" Paredit: Leader first, then:
" <>: Slurp, barf
" J : join
" O : split ('open')
" W or w( : wrap (also with other wrappers)
" S : unwrap ('split')

" Recognize Racket files as Scheme
if has(  "autocmd"  )
    au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

au FileType json call PareditInitBuffer()

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
set updatetime=100

" Term Options
if &term =~ '256color'
  set t_ut=
endif
set t_Co=256

" Leader
let mapleader = ","

" Remaps
" Clear search markup
map <leader><space> :nohl<CR>

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
