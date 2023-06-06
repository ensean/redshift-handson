create external schema myspectrum_schema 
from data catalog 
database 'myspectrum_db' 
iam_role default
create external database if not exists;


CREATE EXTERNAL TABLE myspectrum_schema.nginx_logs (
  dt timestamp,
  remote varchar(255),
  host varchar(255),
  usr varchar(255),
  method varchar(32),
  uri varchar(255),
  code integer,
  size integer,
  referer varchar(255),
  agent varchar(512)
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
with serdeproperties (
'dots.in.keys' = 'true',
'mapping.dt' = 'date', -- 字段名不一致时处理映射关系
'mapping.usr' = 'user',
'mapping.uri' = 'path'
)
LOCATION 's3://mock-logs-3245345435/fluent-bit/';

select count(*) from myspectrum_schema.nginx_logs;