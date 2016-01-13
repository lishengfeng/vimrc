# vimrc
vimrc

1.Install vim

    sudo apt-get install vim

2.Config vimrc

    cp vimrc .vimrc

3.Install vim-scripts

    sudo apt-get install vim-scripts

#after install vim-scripts upsideyou can use vim-addons
#to show addons status
    vim-addons

5 install taglist

    vim-addons install taglist

6.install Exuberant Ctags
#Download the source from below
#http://ctags.sourceforge.net/
#go to the fold path
    cd <ctags folder>/
#run configure
    ./configure
#make 
    make
#make install
    sudo make install
#check which ctags has been used.
    which ctags
#if not /usr/local/bin/ctags 
#add it to PATH(recommanded)
    vim ~/.bashrc
#add to the bottom
    export PAHT="/usr/local/bin:/usr/local/sbin:$PATH"
#or add the line into ~/.vimrc
    let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
#use <leader>tt or :TlistToggle<cr> to start Tlist

7.install A
#detail http://edyfox.codecarver.org/html/vimplugins.html

8.install winmanager
#details http://www.vim.org/scripts/script.php?script_id=1440
#or vim-addons install winmanager
#this .vimrc already nmap <F8> to start winmanager

9.install bufexplorer
#vim-addons install bufexplorer
