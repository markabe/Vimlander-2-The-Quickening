filetype plugin on

" Bundle Configuration:
  source ~/.vim/vundle.vim
  source ~/.vim/statusbar.vim

  syntax on
  let g:solarized_termcolors=256
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

  " Folding settings.
  "set foldenable
  "set foldmethod=syntax
  "set foldlevel=1
  "set foldnestmax=2
  "set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\'.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '

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
  set ttymouse=xterm2

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

  " (d)irectory explorer.
  map <silent> <leader>d :NERDTreeToggle<cr>
  map <silent> <leader>D :NERDTree %<cr>

  " (b)uffer exporer
  map <silent> <leader>b :BufExplorer<cr>

  " (f)ile explorer.
  map <silent> <leader>f :FuzzyFinderTextMate<CR>

  " (gr)ep for word under curser in pwd.
  map <silent> <leader>gr :Grep -r<CR><CR><CR>

  " (c)hange (d)irectory to where file is.
  nmap <silent> <Leader>cd :cd %:p:h<CR>

  " vim-fugitive mappings.
  nnoremap <Leader>gd :Gdiff<Enter>
  nnoremap <Leader>gs :Gstatus<Enter>
  nnoremap <Leader>gl :Glog<Enter>
  nnoremap <Leader>gw :Gwrite<Enter>
  nnoremap <Leader>gc :Gcommit<Enter>
  nnoremap <Leader>gb :Gblame<Enter>

  " vim-git (legacy) mappings.
  let g:git_no_map_default = 1
  nnoremap <Leader>gD :GitDiff --cached<Enter>
  nnoremap <Leader>gS :GitStatus<Enter>
  nnoremap <Leader>gL :GitLog<Enter>
  nnoremap <Leader>gA :GitAdd<Enter>
  nnoremap <Leader>gC :GitCommit<Enter>
  nnoremap <Leader>gP :GitPullRebase<Enter>

  " (g)it (c)ommit.
  nmap <silent> <Leader>gc :Gcommit<CR>

  " (w)ord (w)rap lines at word boundaries.
  noremap <silent> <Leader>ww :call ToggleWrap()<CR>

  " (w)hite (s)pace highlighting.
  noremap <silent> <Leader>ws :call ToggleWhitespace()<CR>

  " (a)uto (i)indent toggle.
  map <silent> <leader>ai :set autoindent!<cr>

  " (k)ill buffers without closing window or tab.
  map <silent> <leader>k :call CleanClose(0)<CR>
  map <silent> <leader>K :bd<CR>

  " Run  Ruby (T)est, (A)ll, (L)ast tests in file.
  map <Leader>T <Plug>RubyTestRun
  map <Leader>A <Plug>RubyFileRun
  map <unique> <Leader>L <Plug>RubyTestRunLast

  " (c)lose window.
  map <silent> <leader>c :close<CR>

  " (z) shell in ConqueTerm.
  map <silent> <leader>z :ConqueTerm zsh<CR>

  " Taglist (o)utline.
  map <silent> <leader>o :TlistToggle<CR>

  " Sc(r)atch window.
  map <silent> <leader>r :ScratchToggle<CR>

  " (C)offee(M)ake.
  map <silent> <leader>cm :CoffeeMake<CR>

  " (C)ommand to (F)ix (W)hitespace.
  map <silent> <leader>cfw :FixWhitespace<CR>

  " Easy(m*)otion.
  nnoremap <silent> <Leader>mf       :call EasyMotionF(0, 0)<CR>
  vnoremap <silent> <Leader>mf  :<C-U>call EasyMotionF(1, 0)<CR>

  nnoremap <silent> <Leader>mF       :call EasyMotionF(0, 1)<CR>
  vnoremap <silent> <Leader>mF  :<C-U>call EasyMotionF(1, 1)<CR>

  nnoremap <silent> <Leader>mt       :call EasyMotionT(0, 0)<CR>
  vnoremap <silent> <Leader>mt  :<C-U>call EasyMotionT(1, 0)<CR>

  nnoremap <silent> <Leader>mT       :call EasyMotionT(0, 1)<CR>
  vnoremap <silent> <Leader>mT  :<C-U>call EasyMotionT(1, 1)<CR>

  nnoremap <silent> <Leader>l       :call EasyMotionWB(0, 0)<CR>
  vnoremap <silent> <Leader>l  :<C-U>call EasyMotionWB(1, 0)<CR>

  nnoremap <silent> <Leader>h       :call EasyMotionWB(0, 1)<CR>
  vnoremap <silent> <Leader>h  :<C-U>call EasyMotionWB(1, 1)<CR>

  nnoremap <silent> <Leader>me       :call EasyMotionE(0, 0)<CR>
  vnoremap <silent> <Leader>me  :<C-U>call EasyMotionE(1, 0)<CR>

  nnoremap <silent> <Leader>mge      :call EasyMotionE(0, 1)<CR>
  vnoremap <silent> <Leader>mge :<C-U>call EasyMotionE(1, 1)<CR>

  nnoremap <silent> <Leader>mj       :call EasyMotionJK(0, 0)<CR>
  vnoremap <silent> <Leader>mj  :<C-U>call EasyMotionJK(1, 0)<CR>

  nnoremap <silent> <Leader>mk       :call EasyMotionJK(0, 1)<CR>
  vnoremap <silent> <Leader>mk  :<C-U>call EasyMotionJK(1, 1)<CR>

" Normal And General Mappings:

  " New tab.
  nnoremap <C-t> :tabnew<CR>

  " Copy to clipboard.
  vnoremap <C-C> "+y

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

  " Following mapping is a replacement for <C-]>:
  noremap <silent> <C-]> :FufTagWithCursorWord!<CR>
  " Following mapping is a replacement for <C-]>:
  nnoremap <silent> <C-]> :FufBufferTagWithCursorWord!<CR>
  vnoremap <silent> <C-]> :FufBufferTagAllWithSelectedText!<CR>
  nnoremap <silent> <C-]> :FufBufferTagAllWithCursorWord!<CR>
  vnoremap <silent> <C-]> :FufBufferTagAllWithSelectedText!<CR>

  " Switch to last buffer.
  map <silent> <leader><Tab> :b#<CR>

  " Expand or shrink window.
  if bufwinnr(1)
    map + <C-W>+
    map _ <C-W>-
  endif

  " Toggle to fix indenting while pasting.
  nnoremap <F2> :set invpaste paste?<CR>
  set pastetoggle=<F2>
  set showmode

" Insert Mode Mappings:

  " Quick, jump out of insert mode while no one is looking.
  imap ii <Esc>

  " Omni-completion.
  inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  \ "\<lt>C-n>" :
  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
  imap <C-@> <C-Space>

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

  " Downgrade from 256 colors.
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
