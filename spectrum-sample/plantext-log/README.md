0. EC2配置S3写权限，可以给EC2[配置角色](https://repost.aws/zh-Hans/knowledge-center/ec2-instance-access-s3-bucket) 也可以[配置aws ak/sk](https://docs.aws.amazon.com/zh_cn/cli/latest/userguide/cli-configure-files.html)

1. EC2下载cloudfront log模拟脚本，并安装依赖

```shell
sudo yum install python3-devel  -y
sudo yum group install "Development Tools" -y
wget https://d3gpeimdfrgv8u.cloudfront.net/clo-workshop-smb/alb-cf-log-faker.zip
unzip alb-cf-log-faker.zip
cd alb
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

2.更改cloudfront.py文件中日志文件存放位置配置

```
log_bucket_name = 'xxxxx'
```

3.运行如下命令模拟生成CloudFront日志供后续分析

```shell
python cloudfront.py
Finish generate 100 lines log in 0.067295 secs
```