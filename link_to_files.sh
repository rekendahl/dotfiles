# /bin/zsh
#
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

cd $DOT_FILES
git submoudle init
git submoudle update
cd -
