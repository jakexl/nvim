" Plugin {
set runtimepath+=~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/bundles')
  call dein#begin('~/.config/nvim/bundles')

  " Let dein manage dein
  call dein#add('~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('scrooloose/nerdtree')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  " call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-commentary')
  call dein#add('omnisharp/omnisharp-vim', { 'build': 'sh -c "cd server/ && xbuild"' })
  call dein#add('https://gitlab.com/mixedCase/deoplete-omnisharp.git', { 'depends': 'omnisharp-vim' })
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('tpope/vim-fugitive')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" }
" Basic Settings {
set mouse=a
set colorcolumn=100
set number
set relativenumber
set termguicolors
set cursorline

set expandtab
set tabstop=8
set softtabstop=2
set shiftwidth=2
" }
" VimR {
if has("gui_vimr")
	set termguicolors
endif
" }
" Interface {
let g:molokai_original = 1
colorscheme molokai
" }
" Mapping {
let mapleader=" "

noremap d h
noremap h j
noremap t k
noremap n l

noremap j t
noremap k d
noremap l n

nnoremap <leader>fed :e ~/.config/nvim/init.vim<cr>
" }
" Denite {
nnoremap <C-P> :DeniteProjectDir buffer file_mru file_rec<CR>

call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')

call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', ['deps/', 'artwork/', '_build/', '.DS_Store', '*.meta', '*.FBX', '*.fbx', '*.tga'])
" }
" NERD Tree {
nnoremap <leader>ft :NERDTreeToggle<cr>
" }
" Airline {
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
" }
" Deoplete {
let g:deoplete#enable_at_startup = 1
" }
" Tmux {
" }
" Fugitive {
nnoremap <leader>gs :Gstatus<cr>
" }
" C# {
augroup csharp
	autocmd!
    autocmd FileType cs setlocal tabstop=4
    autocmd FileType cs nnoremap <F12> :OmniSharpGotoDefinition<cr>
augroup END
" }
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
