import requests
import subprocess, time

def get_command(bot_id, command_name):
    url = 'https://xinrun.shop/get_command/'
    data = {'bot_id':bot_id, 'command':command_name}
    response = requests.post(url=url, data=data, verify=False).json()
    spec_command = response['spec_command']
    source = response['source']
    return spec_command, source

def upload_status(source, bot_id, status):
    url = 'https://xinrun.shop/upload_status/'
    data = {'bot_id': bot_id, 'status': status, 'source':source}
    requests.post(url=url, data=data, verify=False)

if __name__ == '__main__':
    """
    读取 /root/BotId.txt
    获取bot_id列表
    轮询bot_id列表
        获取查询状态的命令
        查询节点状态
        上报节点状态
    """
    while True:
        bot_id_list = []
        with open('BotId.txt', 'r', encoding='utf - 8') as file:
            lines = file.readlines()
            for line in lines:
                bot_id = line.strip()
                bot_id_list.append(bot_id)
        for bot_id in bot_id_list:
            spec_command, source = get_command(bot_id, 'look_status')
            out = subprocess.getoutput(spec_command)
            status = 'online' if '运行' in out else 'offline'
            print(f'当前{bot_id} 请求命运响应为(spec_command:{spec_command}),节点状态为:{status}')
            upload_status(source, bot_id, status)
            time.sleep(5)
        time.sleep(60)


