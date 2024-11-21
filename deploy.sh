#!/bin/sh
echo "...installing dev toolkit..."
sudo apt install -y clangd ripgrep nodejs python3
echo "...updating hosts file avoid github 404..."
sudo sed -i "/# GitHub520 Host Start/Q" /etc/hosts && curl https://raw.hellogithub.com/hosts >> /etc/hosts
echo "...install vim-plug..."
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 定义 .npmrc 文件路径
NPMRC="$HOME/.npmrc"

# 定义要检查的键和值
KEY="coc.nvim:registry"
VALUE="coc.nvim:registry=http://mirrors.cloud.tencent.com/npm/"

# 如果 .npmrc 文件不存在，则创建它
if [ ! -f "$NPMRC" ]; then
  touch "$NPMRC"
  echo "已创建 $NPMRC 文件。"
fi

# 检查 .npmrc 文件中是否已经存在指定的键
if ! grep -q "^$KEY=" "$NPMRC"; then
  # 如果不存在，则追加新的配置
  echo "$VALUE" >> "$NPMRC"
  echo "已将 '$VALUE' 追加到 $NPMRC。"
else
  echo "'$KEY' 已存在于 $NPMRC 中，无需追加。"
fi
echo "...拷贝 vim 和 git 的配置到本地..."
cp ./vim/.vimrc ~/
cp ./git/.gitconfig ~/
