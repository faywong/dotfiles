#!/bin/sh
echo "...installing dev toolkit..."

# step 1: 安装基础包
PACKAGES="clangd ripgrep nodejs python3 cmake"

# 检测发行版并使用相应的包管理器
if [ -f /etc/debian_version ]; then
    # Debian/Ubuntu 系列
    sudo apt update
    sudo apt install -y $PACKAGES
elif [ -f /etc/redhat-release ]; then
    # RHEL 和其衍生版（如 AlmaLinux、CentOS）
    sudo dnf install -y $PACKAGES
else
    echo "Unsupported Linux distribution."
    exit 1
fi
echo "Development toolkit installed successfully."

# step 2: update hosts from GitHub520 repo
echo "...updating hosts file avoid github 404..."
sudo sed -i "/# GitHub520 Host Start/Q" /etc/hosts && sudo curl https://raw.hellogithub.com/hosts >> /etc/hosts

# step 3: 安装 vim-plug 插件管理器
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

# step 4: 拷贝 vim git 配置到本地
echo "...拷贝 vim 和 git 的配置到本地..."
cp ./vim/.vimrc ~/
cp ./git/.gitconfig ~/
