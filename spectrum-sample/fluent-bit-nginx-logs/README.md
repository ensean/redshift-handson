## 说明

本示例演示fluent-bit采集nginx日志存储至S3，然后通过Redshift Spectrum进行查询。


```shell
fluent-bit.conf: fluent-bit 配置文件示例
redshift-spectrum.sql: Redshift Spectrum外表创建示例

```

注意：运行fluent-bit的环境需要有权限写S3，配置方式可选如下两种种的一种

* `推荐` 给EC2配置一个角色https://repost.aws/zh-Hans/knowledge-center/ec2-instance-access-s3-bucket
* 在操作系统配置ak、sk https://docs.aws.amazon.com/zh_cn/cli/latest/userguide/cli-configure-files.html#cli-configure-files-methods


## 参考资料
1. https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_EXTERNAL_TABLE.html#r_CREATE_EXTERNAL_TABLE_examples_link