set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My Bundles:
Bundle "git@github.com:markabe/bufexplorer.git"
Bundle "git@github.com:markabe/snipmate.vim.git"
Bundle "git@github.com:markabe/vim-scratch.git"
Bundle "git@github.com:markabe/vim-spacial.git"
Bundle "git@github.com:markabe/vim-txt.git"

" Bundles:
Bundle "mileszs/ack.vim"
Bundle "wincent/Command-T"
  let g:CommandTMatchWindowAtTop = 1
Bundle "vim-scripts/Conque-Shell"
Bundle "tyru/current-func-info.vim"
Bundle "vim-scripts/dbext.vim"
Bundle "vim-scripts/FuzzyFinder"
  let g:fuf_buffertag_ctagsPath='/usr/local/bin/ctags'
Bundle "axold/fuzzyfinder_textmate"
  let g:fuzzy_ignore = "*.svg;*.ttf;*.psd;*.png;*.jpg;*.gif;*.exe;*.dll;*.vsmdi;*.pdb;*.pdf;*.lnk;*.sln;*.csproj;*.cache"
  let g:fuzzy_matching_limit = 50
Bundle "motemen/git-vim"
Bundle "vim-scripts/grep.vim"
Bundle "vim-scripts/L9"
Bundle "scrooloose/nerdcommenter"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "timcharper/textile.vim"
Bundle "kchmck/vim-coffee-script"
Bundle "altercation/vim-colors-solarized"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"
Bundle "henrik/vim-indexed-search"
Bundle "tpope/vim-markdown"
Bundle "tsaleh/vim-matchit"
Bundle "gregsexton/MatchTag"
Bundle "tpope/vim-ragtag"
Bundle "tpope/vim-rails"
Bundle "vim-ruby/vim-ruby"
Bundle "janx/vim-rubytest"
Bundle "bdd/vim-scala"
Bundle "tsaleh/vim-supertab"
Bundle "tpope/vim-surround"
Bundle "markabe/vim-taglist"
  let Tlist_Show_One_File = 1
  " Hook in txt type from vim-txt.
  let tlist_txt_settings = 'txt;s:section;f:file'
  let tlist_coffee_settings = 'coffee;f:function;v:variable'
Bundle "nelstrom/vim-textobj-rubyblock.git"
Bundle "kana/vim-textobj-user"
Bundle "SjB/vim-trailing-whitespace.git"
Bundle "tpope/vim-unimpaired"
Bundle "mikewest/vimroom.git"
Bundle "mattn/zencoding-vim"
  let g:user_zen_settings = {
  \  'indentation' : '  '
  \}
Bundle "blueyed/ZoomWin"
