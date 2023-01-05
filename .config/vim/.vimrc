" Basics:
set runtimepath+=$HOME/.config/vim/ " I use it as a fix to load theme properly without error as I'm not using a plugin manager yet
source $HOME/.config/vim/colors/seoul256.vim
set packpath+=$HOME/.config/vim/
syntax on
set re=0
filetype on
filetype plugin on
filetype indent on
set nocompatible
set number " at the beginning of lines
set shiftwidth=2
set tabstop=2
set expandtab " space char instead of tabs
set nobackup
set incsearch " incremently hl search result while typing
set ignorecase " can search for capital while searching small"
set smartcase "Allow to specifically search capital letters if searching for it
set showmatch
set hlsearch " use hilight during search
set showcmd
set showmode
set history=1000
set path+=** " :find name, extension or anything
set wildmenu " autocomplection menu by pressing tab
set wildmode=list:longest " similar to bash
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.img,*/node_modules/* " will never need to open through vim
set autoindent
set smartindent
set scrolloff=1
set clipboard=unnamed
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"

" Build:
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter
" :make to run rspec
" :cl to list errs
" :cc# to jump to err nb#
" :cn / :cp to nav forward / backward 

" HIDDEN PARAM YOU PREFER NOT TO SEE ---------------------------------------------------------------------- {{{
set mouse=a " Mh ? I swear there is nothing to see on this line :D
" }}}
" Highlights -------------------------------------- {{{
set cursorline
set termguicolors
set wildoptions=pum
" }}}
" PLUGINS ------------------------------- {{{
" Netrw:
let g:netrw_banner=0 " still can use I to display it from the explorer
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.S\+' "hide dotfiles on load
let g:netrw_keepdir=0 " fix some error when moving files
let g:netrw_winsize=15
let g:netrw_home="$HOME/.config/vim/"

" VimJsxPretty:
let g:vim_jsx_pretty_disable_tsx=1
let g:vim_jsx_pretty_disable_js=1
let g:vim_jsx_pretty_colorful_config=1

" Coc:
let g:coc_node_path="$HOME/.local/share/nvm/v16.18.1/bin/node"
let g:coc_config_home="$HOME/.config/vim/coc/"
let g:coc_data_home="$HOME/.config/vim/coc/"
let g:coc_global_extensions = ["coc-json", "coc-tsserver", "coc-html", "coc-elixir", "coc-eslint", "coc-prettier"]
" }}}
" MAPPINGS --------------------------------------------------------------- {{{

let mapleader='!'

" Basic: Remap normal keys for better usage
nnoremap o o<esc>
nnoremap O O<esc>
nnoremap Y ^y$

" Custom: Custom mappings that suits my needs
nnoremap <leader>è <C-w>h
nnoremap <leader>ç <C-w>l

" Tabs:
nnoremap <leader>te :tabedit<CR>
nnoremap <leader>tr :tabp<CR>
nnoremap <leader>ty :tabn<CR>
nnoremap <leader>t& 1gt
nnoremap <leader>té 2gt
nnoremap <leader>t" 3gt
nnoremap <leader>t' 4gt
nnoremap <leader>t( 5gt
nnoremap <leader>t§ 6gt
nnoremap <leader>tè 7gt
nnoremap <leader>t! 8gt
nnoremap <leader>tç 9gt

" Netrw:
nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <leader>da :Lexplore<CR>
" <leader>dd open netrw in the dir of the curr file
" <leader>da will open it in the working dir

" Coc:
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <leader>d :CocList diagnostics<CR>
nnoremap <leader>do <Plug>(coc-codeaction)
nnoremap <leader>rn <Plug>(coc-rename)

nnoremap <leader>f :CocCommand prettier.formatFile<CR>
" }}}
" SNIPPETS ------------------------------------------------------------ {{{
noremap <leader>html :-1read $HOME/.config/vim/snippets/.html.html<CR>6jwf>a
"}}}
" VIMSCRIPT -------------------------------------------------------------- {{{

" Allow group folding like VIMSCRIPT --- etc etc
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab

" Allow undo changes even after saving
if version >= 703
    set undodir=~/.config/vim/backup
    set undofile
    set undoreload=10000
endif

" Ctags needed, will allow to jump from tags
command! MakeTags !ctags -R .
" use ^] to jump forward
" use g^] for ambiguous
" use ^t to jump back up the tag stack

" Netrw: Allow to add keymaps in the navigation (directly in netrw)
function! NetrwMapping()
  " NAVIGATION:
    nmap <buffer> h -
    nmap <buffer> l <CR>
    nmap <buffer> ,
    nmap <buffer> L <CR>:Lexplore<CR>
    nmap <buffer> <leader>dd :Lexplore<CR>
    nmap <buffer> <leader>da :Lexplore<CR>

  " MARKS:
    nmap <buffer> <TAB> mf
    nmap <buffer> <S-TAB> mF
    nmap <buffer> <leader><TAB> mu

  " FILE MANAGEMENT:
    nmap <buffer> ff %:w<CR>:buffer #<CR>
    nmap <buffer> fe R
    nmap <buffer> fc mc
    nmap <buffer> fC mtmc
    nmap <buffer> fx mm
    nmap <buffer> fX mtmm
    nmap <buffer> f; mx
    nmap <buffer> FF :call NetrwRemoveRecursively()<CR>
endfunction

" h: go up in history
" l: open directory / file
" ,: toggle .dotfiles
" L: open file and close Netrw
" <leader> dd: Close Netrw

" <TAB>: toggle mark on a file or dir
" <S-TAB>: unmark all the files in the curr buffer
" <leader><TAB>: remove all marks on all files

" ff: create a real empty file
" fe: rename a file
" fc: copy marked file
" fC: same as fc but in in one step
" fx: will move marked files
" fX: same as fC but for moving
" f;: to run external commands on the file

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

" Netrw: Remove files recursively through Netrw
function! NetrwRemoveRecursively()
    if &filetype==#'netrw'
        cnoremap <buffer> <CR> rm -r<CR>
        normal mu
        normal mf

        try 
            normal mx
        catch
            echo 'Canceled'
        endtry

        cunmap <buffer> <CR>
    endif
endfunction

" Coc: 
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }}}
" STATUS LINE ------------------------------------------------------------ {{{"
set statusline= " clear the line when vim reload
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2
" Looks like this : 
" fullpath curr file, modif flag if file updated, type of file in buffer,
" read-only flag
"
" shows the ascii / unicode under cursor, shows hexa code under cursor,
" display row nb, display col number, % from the top of the file
" }}}
