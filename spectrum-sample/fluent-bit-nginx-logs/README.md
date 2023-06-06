## 说明

本示例演示fluent-bit采集nginx日志存储至S3，然后通过Redshift Spectrum进行查询。

```shell
fluent-bit.conf: fluent-bit 配置文件示例
redshift-spectrum.sql: Redshift Spectrum外表创建示例

```

## 参考资料
1. https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_EXTERNAL_TABLE.html#r_CREATE_EXTERNAL_TABLE_examples_link