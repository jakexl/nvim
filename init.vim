" Plugin {
set runtimepath+=~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/bundles')
  call dein#begin('~/.config/nvim/bundles')

  " Let dein manage dein
  call dein#add('~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  " call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('editorconfig/editorconfig-vim')
  " deoplete + omnisharp {
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neopairs.vim')
    call dein#add('Shougo/echodoc.vim')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    call dein#add('omnisharp/omnisharp-vim', { 'build': 'sh -c "cd server/ && xbuild"' })
    call dein#add('https://gitlab.com/mixedCase/deoplete-omnisharp.git')
    call dein#add('scrooloose/syntastic')
    call dein#add('oranget/vim-csharp')
  " }
  " YouCompleteMe {
    " call dein#add('valloric/youcompleteme', { 'build': './install.py --omnisharp-completer' })
  " }
  " Elixir {
    call dein#add('elixir-lang/vim-elixir')
    call dein#add('slashmili/alchemist.vim')
    call dein#add('thinca/vim-ref')
    " call dein#add('awetzel/elixir.nvim', { 'build': './install.sh' })
  " }

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
set noshowmode

set expandtab
set tabstop=8
set softtabstop=2
set shiftwidth=2

set hidden
set autowriteall

set ignorecase
set smartcase

set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«
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

" noremap d h
" noremap h j
" noremap t k
" noremap n l

" noremap j t
" noremap k d
" noremap l n

nnoremap <leader>fed :e ~/.config/nvim/init.vim<cr>

" nnoremap <leader>d :wincmd h<cr>
" nnoremap <leader>h :wincmd j<cr>
" nnoremap <leader>t :wincmd k<cr>
" nnoremap <leader>n :wincmd l<cr>
" }
" Dein {
" plugin clean
nnoremap <leader>pc :call map(dein#check_clean(), "delete(v:val, 'rf')")<cr>
" plugin update
nnoremap <leader>pu :call dein#update()<cr>
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
let g:airline#extensions#whitespace#enabled = 0
" }
" Tmux {
" }
" Fugitive {
nnoremap <leader>gs :Gstatus<cr>
" }
" Deoplete {
set completeopt+=noinsert
set completeopt-=preview
" }
" EchoDoc {
let g:echodoc_enable_at_startup = 1
" }
" C# {
function! cs#get_net_compiler(compiler)
  return "xbuild"
endfunction

function! cs#find_net_solution_file()
  return "~/work/q5/program/Unity/Unity.sln"
endfunction

let g:deoplete#enable_at_startup = 1
augroup csharp
  autocmd!
  autocmd FileType cs setlocal noexpandtab
  autocmd FileType cs setlocal tabstop=4
  autocmd FileType cs setlocal softtabstop=4
  autocmd FileType cs setlocal shiftwidth=4
  autocmd FileType cs setlocal makeprg=xbuild\ ~/work/q5/program/Unity/Unity.sln
  autocmd FileType cs nnoremap <F9> :make<bar>copen<cr>
  autocmd FileType cs nnoremap <F12> :OmniSharpGotoDefinition<cr>
  autocmd FileType cs nnoremap <F24> :OmniSharpFindUsages<cr>
  autocmd FileType cs nnoremap <leader><F12> :OmniSharpFindUsages<cr>
  " autocmd FileType cs nnoremap <F12> :YcmCompleter GoToDefinition<cr>
augroup END
" }
" Elixir {
augroup Elixir
  autocmd!
  autocmd FileType elixir setlocal makeprg=mix\ test
  autocmd FileType elixir setlocal errorformat=
    \\ %\\+(%\\w%\\+)\ %f:%l:\ %m,
    \%+G%m
  autocmd FileType elixir nnoremap <F4> :cnext<cr>
  autocmd FileType elixir nnoremap <F16> :cprevious<cr>
  autocmd FileType elixir nnoremap <F9> :lcd\ ~/work/q5/program/server/apps/world_server<bar>make<bar>copen<cr>
  autocmd FileType elixir nmap <F12> <c-]>
augroup END
" }
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
