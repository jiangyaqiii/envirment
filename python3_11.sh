sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y

# 安装 Python 和系统依赖
sudo apt install -y python3.11 python3.11-venv python3.11-dev python3-pip libopencv-dev python3-opencv build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev libjpeg-dev libpng-dev libtiff-dev libcurl4-openssl-dev libgl1-mesa-glx libglib2.0-0 libsm6 libxext6 libxrender-dev libcairo2-dev pkg-config gcc g++ make git tmux

# 升级 pip
python3.11 -m pip install --upgrade pip
echo "Python 3.11 和系统依赖安装完成。"
