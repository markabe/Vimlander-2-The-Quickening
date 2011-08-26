# Once upon a time in the projects, yo.

VIM was reborn like unto the noble phoenix.  And so it was as it always should be since the dawn of the end of times.

## Finalize Install

Command-T

    cd ~/.vim/bundle/Command-T/ruby/command-t
    rvm use system
    ruby extconf.rb
    make
    
vim-taglist

    brew install ctags
    sudo mv /usr/bin/ctags /usr/bin/ctags.old