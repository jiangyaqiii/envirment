##安装python3.8
sudo apt-get install -y software-properties-common
echo -e "\n" |sudo add-apt-repository ppa:deadsnakes/ppa
###########
##安装python3.10
sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
wget https://www.python.org/ftp/python/3.9.8/Python-3.9.8.tgz 
tar -xf Python-3.9.8.tgz
cd Python-3.9.8
./configure --enable-optimizations
make -j `nproc`
sudo make altinstall
###########
################################
##安装pip
sudo apt install -y python3-pip
