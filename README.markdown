# Once upon a time in the projects, yo.

VIM was reborn like unto the noble phoenix.  And so it was as it always should be since the dawn of the end of times.

# Cheat sheet for maintaning submodules

### Add submodule.

    cd ~/.vim
    git submodule add git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
    git add .
    git ci -m "Added an awesome module."
    git push

### Update submodule.

    cd ~/.vim/bundle/vim-fugitive
    git remote update
    git merge origin/master
    cd ~/.vim
    git add .
    git ci -m "Updated an awsome module."
    git push

### Removing submodule.

    open .gitmodules and remove the reference to the to submodule
    open .git/config and remove the reference to the to submodule
    git rm --cached modules/auth

# Reminder to myself.
It seems that a lot of people are dropping submodules but I've decided to hold onto them for now because I like to see what version I am at easier than having to drill down into the source of each bundle. Although the submoldules can be bit of a hassle, I think this cheat sheet should resolve much of it.

One remaining problem is that you need git installed to use this which can be a problem sometime, but oh well.
