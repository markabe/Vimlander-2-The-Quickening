" Load plugins from .vim/bundle directory.
call pathogen#runtime_append_all_bundles()

" Select all, cut/copy/paste, undo/redo, save.
source $VIMRUNTIME/mswin.vim

filetype plugin on

syntax on
set t_Co=256
colorscheme krunktastic


" ############################  Options  ############################

" This must be first, because it changes other options as a side effect.
set nocompatible

" Move swap files and backups out of work areas.
set directory=~/.vim_tmp
set backupdir=~/.vim_tmp

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Arrow or motion over line breaks.
set whichwrap=<,>,h,l,[,] 

" Store lots of :cmdline history.
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set ignorecase  "case insensitive search
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

" Assume the /g flag on :s substitutions to replace all matches in a line.
set gdefault

set nowrap      "dont wrap lines
set linebreak   "wrap lines at convenient points
set number      "line numbers

" Indent settings.
filetype indent on
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Folding settings.
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" Display tabs and trailing spaces.
set list
set listchars=tab:?·,trail:·,nbsp:·

set formatoptions-=o "dont continue comments when pushing o/O

" Vertical/horizontal scroll off settings.
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" Some stuff to get the mouse going in term.
set mouse=a
set ttymouse=xterm2

" Hide buffers when not displayed.
set hidden

" Don't flick cursor.
set guicursor=a:blinkon0

" Set to auto read when a file is changed from the outside
set autoread

" Status bar display.
set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" Nice tab labels.
set guitablabel=%{GuiTabLabel()}

" ############################  Leader Mappings  ############################

let mapleader = ","

" (d)irectory explorer.
map <silent> <leader>d :NERDTreeToggle<cr>
map <silent> <leader>D :NERDTree %<cr>

" (b)uffer exporer
map <silent> <leader>b :BufExplorer<cr>

" (f)ile explorer.
map <silent> <leader>f :FuzzyFinderTextMate<CR>

" (c)hange (d)irectory to where file is.
nmap <silent> <Leader>cd :cd %:p:h<CR>

" (w)rap lines at word boundaries.
noremap <silent> <Leader>w :call ToggleWrap()<CR>

" (k)ill buffers without closing window or tab.
map <silent> <leader>k :call CleanClose(0)<CR>:enew<CR>
map <silent> <leader>K :bd<CR>

" (c)lose window.
map <silent> <leader>c :close<CR>

" (z) shell in ConqueTerm.
map <silent> <leader>z :ConqueTerm zsh<CR>


" ############################  Normal/General Mappings  ############################

" New tab.
nnoremap <C-t> :tabnew<CR>

" Make Y consistent with C and D.
nnoremap Y y$

" Remap F1 from Help to ESC.  No more accidents.
nmap <F1> <Esc>
map! <F1> <Esc>

" Scroll rather than the default PageUp and PageDown.
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

" Switch to last buffer.
nnoremap <C-Tab> :b#<CR>
inoremap <C-Tab> <Esc>:b#<CR>

" Expand or shrink window.
if bufwinnr(1)
  map + <C-W>+
  map _ <C-W>-
endif


" ############################  Insert Mode Mappings  ############################

" Quick, jump out of insert mode while no one is looking.
imap ii <Esc>

" Auto close braces.
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Omni-completion.
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>


" ############################  Visual Mode Mappings  ############################


" Indent visual block.
vnoremap > >gv
vnoremap < <gv

" Visual search mappings.
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>


" ############################  Auto Commands  ############################

" Jump to last cursor position when opening a file.
" Dont do it when writing a commit log entry.
autocmd BufReadPost * call SetCursorPosition()


" ############################  Functions  ############################

function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
    set whichwrap=<,>,h,l,[,]
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

function! CleanClose(tosave)
  if (a:tosave == 1)
      w!
  endif
  let todelbufNr = bufnr("%")
  let newbufNr = bufnr("#")
  if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
      exe "b".newbufNr
  else
      bnext
  endif

  if (bufnr("%") == todelbufNr)
      new
  endif
  exe "bd".todelbufNr
endfunction

function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

function! GuiTabLabel()
	" add the tab number
	let label = '['.tabpagenr()
 
	" modified since the last save?
	let buflist = tabpagebuflist(v:lnum)
	for bufnr in buflist
		if getbufvar(bufnr, '&modified')
			let label .= '*'
			break
		endif
	endfor
 
	" count number of open windows in the tab
	let wincount = tabpagewinnr(v:lnum, '$')
	if wincount > 1
		let label .= ', '.wincount
	endif
	let label .= '] '
 
	" add the file name without path information
	let n = bufname(buflist[tabpagewinnr(v:lnum) - 1])
	let label .= fnamemodify(n, ':t')
 
	return label
endfunction

" ############################  Plugin Customization  ############################

" Map .txt extension to syntax definition.
au BufNewFile,BufRead *.txt setfiletype txt

" FuzzyFinder settings.
let g:fuzzy_ignore = "*.svg;*.ttf;*.psd;*.png;*.jpg;*.gif;*.exe;*.dll;*.vsmdi;*.pdb;*.pdf;*.lnk;*.sln;*.csproj;*.cache"
let g:fuzzy_matching_limit = 50

" Taglist (o)utline.
map <silent> <leader>o :TlistToggle<CR>

" Zencoding settings.
let g:user_zen_settings = {
\  'indentation' : '  '
\}

" Sc(r)atch window.
map <silent> <leader>r :Sscratch<CR>

" Switch to syntax.
command Ruby set syntax=ruby
command Erb set syntax=erb
command Java set syntax=java
