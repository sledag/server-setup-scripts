#!/bin/sh
# Version Zsh 5.0.0

cd /usr/local/src/
sudo yum install -y wget
wget "http://sourceforge.jp/frs/g_redir.php?m=jaist&f=%2Fzsh%2Fzsh%2F5.0.2%2Fzsh-5.0.2.tar.gz"
 mv "g_redir.php?m=jaist&f=%2Fzsh%2Fzsh%2F5.0.2%2Fzsh-5.0.2.tar.gz" zsh-5.0.2.tar.gz
tar -zxvf  zsh-5.0.2.tar.gz
cd zsh-5.0.2
./configure --enable-multibyte
make && sudo make install
sudo sed -i '$s/$/\n\/usr\/local\/bin\/zsh\n/' /etc/shells

#chsh /usr/local/bin/zsh
cd
rm -rf zsh-5.0.2.tar.gz zsh-5.0.2
