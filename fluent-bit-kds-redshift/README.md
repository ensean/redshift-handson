
### 说明

本示例展示通过fluent-bit将日志信息传输至Amazon Kinesis Data streams, 然后使用Redshift的Stream ingestion实现实时入仓的功能，相关说明如下：

```
fluent-bit.conf: fluent-bit配置示例
stream_ingestion.sql: Redshift示例sql
```

### 配置说明

#### 权限配置

* fluent-bit AK、SK权限：`AmazonKinesisFullAccess`策略
* Redshift 集群角色：额外附加`AmazonKinesisFullAccess`策略

#### 配置步骤

1.创建Kinesis Data streams，根据需要录入stream名称（如fluent-bit-kds)其余保持默认，点击创建

![](imgs/2023-06-09-23-40-32.png)

![](imgs/2023-06-09-23-41-40.png)

2.修改fluent-bit配置文件，并重启fluent-bit
```shell
参考fluent-bit.conf配置文件
```


3.Redshift中创建物化视图接收数据
```shell
参考stream_ingestion.sql内容
```

### 参考资料
* Redshift stream ingestion https://aws.amazon.com/cn/redshift/redshift-streaming-ingestion/
* Kinesis data streams https://aws.amazon.com/cn/kinesis/data-streams/?nc1=h_ls