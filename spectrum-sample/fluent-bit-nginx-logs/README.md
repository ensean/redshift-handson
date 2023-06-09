## 说明

本示例演示fluent-bit采集nginx日志存储至S3，然后通过Redshift Spectrum进行查询。


```shell
fluent-bit.conf: fluent-bit 配置文件示例
redshift-spectrum.sql: Redshift Spectrum外表创建示例

```

注意：运行fluent-bit的环境需要有权限写S3，配置方式可选如下方式中的一种，权限配置优先级可以参考[这里](https://github.com/fluent/fluent-bit-docs/blob/master/administration/aws-credentials.md)

* `推荐` 给EC2配置一个角色https://repost.aws/zh-Hans/knowledge-center/ec2-instance-access-s3-bucket
* 在操作系统配置ak、sk https://docs.aws.amazon.com/zh_cn/cli/latest/userguide/cli-configure-files.html#cli-configure-files-methods
* `适用于跨账号、采集IDC服务器` 在fluent-bit service配置文件写入ak、sk环境变量。修改完之后需要运行命令`sudo systemctl daemon-reload`重新加载配置。
```shell
[Unit]
Description=Fluent Bit
Requires=network.target
After=network.target
[Service]
Environment="AWS_ACCESS_KEY_ID=AKIAQ7QDT7YF7ZTLxxx"
Environment="AWS_SECRET_ACCESS_KEY=yn8DHnfBmUvMOETn+VkYs5bPxGOVNDungKUxxxx"
Type=simple
ExecStart=/opt/fluent-bit/bin/fluent-bit -c /opt/fluent-bit/etc/fluent-bit.conf
Type=simple
Restart=always

[Install]
WantedBy=multi-user.target

```

## 参考资料
1. https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_EXTERNAL_TABLE.html#r_CREATE_EXTERNAL_TABLE_examples_link