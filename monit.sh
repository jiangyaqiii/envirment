echo "\$nrconf{kernelhints} = 0;" >> /etc/needrestart/needrestart.conf
echo "\$nrconf{restart} = 'l';" >> /etc/needrestart/needrestart.conf
source ~/.bashrc



ls /etc/systemd/system/monitpy.service /lib/systemd/system/monitpy.service 2>/dev/null
if [ $? -eq 0 ]; then
    echo "monitpy.service 文件存在"
else
    ##检查是否存在python3
    apt install -y python3-pip
    pip3 install requests
    ##下载监控脚本
    wget -O monit.py https://raw.githubusercontent.com/jiangyaqiii/envirment/monit.py && chmod +x monit.py

    echo "monitpy.service 文件不存在"
    echo '[Unit]
      Description=Monit Python Script
      After=network.target
      
      [Service]
      ExecStart=/usr/bin/python3 /root/monit.py
      Restart=always
      User=root  # 替换为你的用户名
      
      [Install]
      WantedBy=multi-user.target'>/etc/systemd/system/monitpy.service
      
    sudo systemctl daemon-reload
    sudo systemctl start monitpy.service
    sudo systemctl enable monitpy.service
fi


