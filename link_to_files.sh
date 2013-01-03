# /bin/zsh
# FIXME: There are surely better ways to do this. As I get time I should investigate what other people are doing.
# For now this file assumes that you are standing in your home directory and that your dotfiles directory is located at ~/Projects/dotfiles
export DOT_FILES=~/Projects/dotfiles

mv .vimrc .vimrc_pre_dotfiles
ln -s $DOT_FILES/vimrc .vimrc

mv .vim .vim_pre_dotfiles
ln -s $DOT_FILES/vim .vim

mv .zshrc .zshrc_pre_dotfiles
ln -s $DOT_FILES/zshrc .zshrc

mv .tmux.conf .tmux.conf_pre_dotfiles
ln -s $DOT_FILES/tmux.conf .tmux.conf 

mv .gvimrc .gvimrc_pre_dotfiles
ln -s $DOT_FILES/gvimrc .gvimrc

mv .gitconfig .gitconfig_pre_dotfiles
ln -s $DOT_FILES/gitconfig .gitconfig

cd bin
mv diffconflicts diffconflicts_pre_dotfiles
ln -s $DOT_FILES/diffconflicts

cd $DOT_FILES
git submodule init
git submodule update
cd -

# Make sure we have patched fonts to make it look pretty. 
# FIXME: For some reason it didn't work with symbolic links on the mac so I use cp -f instead.
# FIXME: Not convinced this is working. On the few machines I have used this on I have manually installed fonts. On paper this should work
if [ "$OSTYPE" = "linux-gnu" ];
then
   echo "Copying Patched Powerlne Source Code Pro fonts to ~/.fonts"
   export font_dir=~/.fonts/.
else
   echo "Copying Patched Powerlne Source Code Pro fonts to ~/Librarys/Fonts"
   export font_dir=~/Library/Fonts/.
fi
cp -f Projects/dotfiles/patched_powerline_fonts/vimstuff/powerline-fonts/SourceCodePro-*.otf $font_dir

