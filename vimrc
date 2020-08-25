" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""
"*** VIM MAIN SETTINGS 
"""""""""""""""""""""""""""""""""""""""""""""""""""

"*** Plugin list (use vundle) 

filetype off                " Load plugins according to detected filetype (vim/after/ftplugin).
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)

Plugin 'tpope/vim-surround'           
Plugin 'terryma/vim-multiple-cursors'  

" Commentary everything with:
" - gc[motion] (gcap - comment out a paragraph)
" - gcc (comment out line)
" - :7,17Commentary (comment out 7-17 lines)
" - :g/TODO/Commentary (comment out all TODO)
Plugin 'tpope/vim-commentary'           
Plugin 'ReplaceWithRegister'
Plugin 'argtextobj.vim'
Plugin 'tommcdo/vim-exchange'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
" Useful status tabline in the bottom
Plugin 'vim-airline/vim-airline'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on

" *** Settings

set hidden                  " Don't require save files after their changes by argdo or bufdo (you must be careful, you can forget save files!!!)
runtime macros/matchit.vim  " Documentation ':h matchit'
syntax on                   " Enable syntax highlighting.
colorscheme nord            " Theme
set number                  " Number of lines
set nrformats=              " Interept all numbers as decimal (for using number<C-a> and number<C-x>)
set mouse=a                 " Switch on mouse in vim (it's very useful for change active window or for change windows of vim)
set clipboard=unnamedplus   " Set system copy/paste via y and p (not "+)

set autoindent              " Indent according to previous line.
set expandtab               " Use spaces instead of tabs.
set softtabstop =4          " Tab key indents by 4 spaces.
set shiftwidth  =4          " >> indents by 4 spaces.
set shiftround              " >> indents to next multiple of 'shiftwidth'." add line numbers

" file type settings
autocmd FileType html,xhtml,xml,css,javascript setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType python nnoremap <leader>r :vsplit term://python3 %<cr>

" it's more fast to exit from insert mode by pressing j and k
imap jk <Esc>
" fast key :%%<Tab> show directory of active file (for example, you opened
" file1.txt and later opened /../../file2.txt, %% help you open /../../ and
" choose /../../file3.txt)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" set russian language keyboard 
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" fastkey for enable and disable of highlight of search text
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <C-k> :set hlsearch<CR>

" I use this for studying
"disable arrow keys in command mode
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
no <down> <Nop>

"disable arrow keys in insert mode
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>


" search of current highlight
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" change ranges by command of substitute
nnoremap & :&&<CR>
xnoremap & :&&<CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" copy, cut and paste
" vmap <C-c> "+y
" vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <ESC>"+pa

" enable fast shortcut for creating tags in project
" nnoremap <f5> :!ctags -R<CR>

" settings for syntastic plugin
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" settings for tagbar plugin
" map <leader>t :TagbarToggle<CR>

" setting for NERDtree plugin
" let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" let NERDTreeMinimalUI = 1
" let g:nerdtree_open = 0
" function NERDTreeToggle()
"     NERDTreeToggle
"     if g:nerdtree_open == 1
"         let g:nerdtree_open = 0
"     else
"         let g:nerdtree_open = 1
"         wincmd p
"     endif
" endfunction
" map <leader>n :call NERDTreeToggle()<CR>


