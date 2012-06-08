filetype plugin on

" Bundle Configuration:

  source ~/.vim/vundle.vim
  if filereadable(expand("~/.vim/custom_vimrc"))
    source ~/.vim/custom_vimrc
  endif

" Colors:

  syntax on
  let g:solarized_termcolors=256
  let g:Powerline_symbols = 'fancy'
  set background=dark
  colorscheme solarized

" Options:

  " This must be first, because it changes other options as a side effect.
  set nocompatible

  " Use 256 colors.
  set t_Co=256

  " Move swap files and backups out of work areas.
  set directory=~/.vim/tmp
  set backupdir=~/.vim/tmp

  " Yanks go on clipboard instead.
  set clipboard+=unnamed

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
  set ls=2        "always status bar

  " Indent settings.
  filetype indent on
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set autoindent
  set shiftround

  " Folding capable, but off by default.
  set nofoldenable
  set foldmethod=syntax
  set foldlevel=6
  set foldnestmax=6
  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\'.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '

  set wildmode=list:longest,full   "make cmdline tab completion similar to bash
  set wildmenu                     "enable ctrl-n and ctrl-p to scroll thru matches
  set wildignore=*.o,*.obj,*~      "stuff to ignore when tab completing

  " Display tabs and trailing spaces.
  set list
  set listchars=tab:?·,trail:·,nbsp:·

  set formatoptions-=o "dont continue comments when pushing o/O

  " Vertical/horizontal scroll off settings.
  set scrolloff=3
  set sidescrolloff=7
  set sidescroll=1

  " Some stuff to get the mouse going in term.
  set ttymouse=xterm2

  " Let mouse set cursor position.
  set mouse=a

  " Hide buffers when not displayed.
  set hidden

  " Don't flick cursor.
  set guicursor=a:blinkon0

  " Set to auto read when a file is changed from the outside
  set autoread

  " Nice tab labels.
  set guitablabel=%{GuiTabLabel()}

" Leader Mappings:

  let mapleader = ","

  " New tab.
  map <silent> <leader>t :tabnew<CR>

  " (a)ck (f)or word under cursor.
  map <silent> <leader>af :Ack<cr>

  " (d)irectory explorer.
  map <silent> <leader>d :NERDTreeToggle<cr>
  map <silent> <leader>D :NERDTree %<cr>

  " (b)uffer exporer.
  map <silent> <leader>b :BufExplorer<cr>

  " (f)ile open.
  map <silent> <leader>f :CtrlP<cr>

  " (p)aste mode toggle.
  map <silent> <leader>p :set invpaste paste?<CR>

  " (c)hange (d)irectory to where file is.
  nmap <silent> <Leader>cd :cd %:p:h<CR>

  " Switch to last buffer.
  map <silent> <leader><Tab> :b#<CR>

  " Copy filename.
  map <silent> <leader>. :let @+=expand('%:p').':'.line('.')<CR>

  " Copy path.
  map <silent> <leader>/ :let @+=expand('%:p:h')<CR>

  " vim-fugitive mappings.
  nnoremap <Leader>gd :Gdiff<Enter>
  nnoremap <Leader>gs :Gstatus<Enter>
  nnoremap <Leader>gl :Glog<Enter>
  nnoremap <Leader>gw :Gwrite<Enter>
  nnoremap <Leader>gc :Gcommit<Enter>
  nnoremap <Leader>gb :Gblame<Enter>

  " (w)ord (w)rap lines at word boundaries.
  noremap <silent> <Leader>ww :call ToggleWrap()<CR>

  " (w)hite (s)pace highlighting.
  noremap <silent> <Leader>ws :call ToggleWhitespace()<CR>

  " (w)hitespace (f)ix.
  map <silent> <leader>wf :FixWhitespace<CR>

  " (a)uto (i)indent toggle.
  map <silent> <leader>ai :set autoindent!<cr>

  "(j)ira (o)pen"
  map <silent> <leader>jo viw2e:<C-U>call JiraOpen()<cr><cr>

  " (k)ill buffers without closing window or tab.
  map <silent> <leader>k :call CleanClose(0)<CR>
  map <silent> <leader>K :bd<CR>

  " Run  Ruby (T)est, (A)ll, (L)ast tests in file.
  map <Leader>T <Plug>RubyTestRun
  map <Leader>A <Plug>RubyFileRun
  map <unique> <Leader>L <Plug>RubyTestRunLast

  " (z) shell in ConqueTerm.
  map <silent> <leader>z :ConqueTerm zsh<CR>

  " Taglist (o)utline.
  map <silent> <leader>o :TagbarToggle<CR>

  " Sc(r)atch window.
  map <silent> <leader>r :ScratchToggle<CR>

  " (M)ake(C)offee.
  map <silent> <leader>mc :CoffeeMake<CR>

  " Open files in directory of current file.
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  map <leader>e :edit %%
  map <leader>v :view %%

" Normal And General Mappings:

  " Make Y consistent with C and D.
  nnoremap Y y$

  " Turn off search highlighting with enter key.
  nnoremap <CR> :nohls<CR><CR>

  " Remap F1 from Help to ESC.  No more accidents.
  map! <F1> <Esc>

  " Expand or shrink window.
  if bufwinnr(1)
    map + <C-W>+
    map _ <C-W>-
  endif

" Insert Mode Mappings:

  " Quick, jump out of insert mode while no one is looking.
  imap ii <Esc>

" Visual Mode Mappings:

  " Indent visual block.
  vnoremap > >gv
  vnoremap < <gv

  " Visual search mappings.
  vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
  vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" Commands:

  " Switch to syntax.
  command Ruby set syntax=ruby
  command Erb set syntax=erb
  command Java set syntax=java
  command Term set t_Co=16

" Auto Commands:

  " Jump to last cursor position when opening a file.
  " Dont do it when writing a commit log entry.
  autocmd BufReadPost * call SetCursorPosition()

  " Map .txt extension to syntax definition.
  autocmd BufNewFile,BufRead *.txt setfiletype txt

  " Map .coffee since plugin doesn't seem to get it done.
  autocmd BufNewFile,BufRead *.coffee setfiletype coffee

  " Make scratch buffer a txt file type.
  autocmd BufNewFile __Scratch__ setfiletype txt

" Functions:

  function ToggleWrap()
    if &wrap
      echo "Wrap OFF"
      setlocal nowrap nolinebreak
      setlocal whichwrap=<,>,h,l,[,]
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
      setlocal wrap linebreak
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

  function ToggleWhitespace()
    if &list
      set nolist
      set listchars=
    else
      set list
      set listchars=tab:?·,trail:·,nbsp:·
    endif
  endfunction

  function! CleanClose(tosave)
    if (a:tosave == 1)
        w!
    endif
    let todelbufNr = bufnr("%")
    let newbufNr = bufnr("#")
    if (getbufvar(bufnr('%'), '&modified'))
      echomsg ('No write since last change for buffer ')
      return
    endif
    if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
        exe "b".newbufNr
    else
        bnext
    endif

    if (bufnr("%") == todelbufNr)
        new
    endif
    exe "bd".todelbufNr
    enew
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

  function! s:get_visual_selection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - 1]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
  endfunction

  function! JiraOpen()
    let key = s:get_visual_selection()
    let cmd = ':!open ' . g:jira_browse_url . key
    execute cmd
  endfun
