set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My Bundles:
Bundle "git@github.com:markabe/snipmate.vim.git"
Bundle "git@github.com:markabe/vim-scratch.git"
Bundle "git@github.com:markabe/vim-spacial.git"
Bundle "git@github.com:markabe/vim-txt.git"

" Bundles:
Bundle "mileszs/ack.vim"
Bundle "kien/ctrlp.vim"
Bundle "tyru/current-func-info.vim"
Bundle "vim-scripts/dbext.vim"
Bundle "gregsexton/MatchTag"
Bundle "scrooloose/nerdtree"
Bundle "vim-scripts/session.vim--Odding"
  let g:session_autosave = 'no'
Bundle "scrooloose/syntastic"
Bundle "kchmck/vim-coffee-script"
Bundle "altercation/vim-colors-solarized"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
Bundle "henrik/vim-indexed-search"
Bundle "tpope/vim-markdown"
Bundle "tsaleh/vim-matchit"
Bundle "Lokaltog/vim-powerline"
Bundle "tpope/vim-ragtag"
Bundle "vim-ruby/vim-ruby"
Bundle "janx/vim-rubytest"
Bundle "tsaleh/vim-supertab"
Bundle "tpope/vim-surround"
Bundle "majutsushi/tagbar"
Bundle "markabe/vim-taglist"
  let Tlist_Show_One_File = 1
  " Hook in txt type from vim-txt.
  let tlist_txt_settings = 'txt;s:section;f:file'
  let tlist_coffee_settings = 'coffee;f:function;v:variable'
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "kana/vim-textobj-user"
Bundle "SjB/vim-trailing-whitespace"
Bundle "chriskempson/vim-tomorrow-theme"
Bundle "tpope/vim-unimpaired"
Bundle "mattn/zencoding-vim"
  let g:user_zen_settings = {
  \  'indentation' : '  '
  \}
Bundle "blueyed/ZoomWin"
