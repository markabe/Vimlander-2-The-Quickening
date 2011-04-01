set rtp+=~/.vim/vundle.git/
call vundle#rc()

" My Bundles:
Bundle "git://github.com/markabe/bufexplorer.git"
Bundle "git://github.com/markabe/snipmate.vim.git"
Bundle "git://github.com/markabe/vim-scratch.git"
Bundle "git://github.com/markabe/vim-spacial.git"
Bundle "git://github.com/markabe/vim-txt.git"


" Bundles:
Bundle "git://github.com/mileszs/ack.vim.git"

" Command-T.
Bundle "git://github.com/wincent/Command-T.git"
let g:CommandTMatchWindowAtTop = 1

Bundle "git://github.com/vim-scripts/Conque-Shell.git"
Bundle "git://github.com/tyru/current-func-info.vim.git"

" FuzzyFinder.
Bundle "git://github.com/axold/fuzzyfinder_textmate.git"
let g:fuzzy_ignore = "*.svg;*.ttf;*.psd;*.png;*.jpg;*.gif;*.exe;*.dll;*.vsmdi;*.pdb;*.pdf;*.lnk;*.sln;*.csproj;*.cache"
let g:fuzzy_matching_limit = 50

Bundle "git://github.com/motemen/git-vim.git"
Bundle "git://github.com/vim-scripts/grep.vim.git"
Bundle "git://github.com/scrooloose/nerdcommenter.git"
Bundle "git://github.com/scrooloose/nerdtree.git"
Bundle "git://github.com/scrooloose/syntastic.git"
Bundle "git://github.com/timcharper/textile.vim.git"
Bundle "git://github.com/altercation/vim-colors-solarized.git"
Bundle "git://github.com/tpope/vim-cucumber.git"

" Vim-EasyMotion.
Bundle "git://github.com/Lokaltog/vim-easymotion.git"
let EasyMotion_do_mapping = 0

Bundle "git://github.com/tpope/vim-endwise.git"
Bundle "git://github.com/tpope/vim-fugitive.git"
Bundle "git://github.com/tpope/vim-git.git"
Bundle "git://github.com/henrik/vim-indexed-search.git"
Bundle "git://github.com/tpope/vim-markdown.git"
Bundle "git://github.com/tsaleh/vim-matchit.git"
Bundle "git://github.com/tpope/vim-ragtag.git"
Bundle "git://github.com/tpope/vim-rails.git"
Bundle "git://github.com/vim-ruby/vim-ruby.git"
Bundle "git://github.com/janx/vim-rubytest.git"
Bundle "git://github.com/bdd/vim-scala.git"
Bundle "git://github.com/tsaleh/vim-supertab.git"
Bundle "git://github.com/tpope/vim-surround.git"

" Taglist.
Bundle "git://github.com/mexpolk/vim-taglist.git"
let Tlist_Show_One_File = 1
" Hook in txt type from vim-txt.
let tlist_txt_settings = 'txt;s:section;f:file'

Bundle "git://github.com/bronson/vim-trailing-whitespace.git"
Bundle "git://github.com/tpope/vim-unimpaired.git"

" Zencoding.
Bundle "git://github.com/mattn/zencoding-vim.git"
let g:user_zen_settings = {
\  'indentation' : '  '
\}
