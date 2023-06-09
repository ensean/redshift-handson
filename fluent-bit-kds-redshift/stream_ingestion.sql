-- 创建schema绑定到kinesis data stream
CREATE EXTERNAL SCHEMA kds
FROM KINESIS
IAM_ROLE  default ;

-- 创建物化视图接收数据，数据以SUPER数据类型存储kinesis中的json数据，可以通过json方式直接查询，适用于字段不固定的场景
CREATE MATERIALIZED VIEW mv_nginx_log AUTO REFRESH YES AS
SELECT approximate_arrival_timestamp,
JSON_PARSE(kinesis_data) as data
FROM kds."fluent-bit-kds"   -- fluent-bit-kds 为kinesis data stream的名称
WHERE CAN_JSON_PARSE(kinesis_data);

select data.remote, data.host, data.method from mv_nginx_log;

-- 将json数据展开后存储，适用于字段固定的场景
CREATE MATERIALIZED VIEW mv_nginx_logs_extract AUTO REFRESH YES AS
    SELECT refresh_time,
    approximate_arrival_timestamp,
    json_extract_path_text(from_varbyte(kinesis_data,'utf-8'),'remote',true)::varchar(32) as remote_ip,
    json_extract_path_text(from_varbyte(kinesis_data,'utf-8'),'host', true)::varchar(30) as host,
    json_extract_path_text(from_varbyte(kinesis_data,'utf-8'),'user', true)::varchar(30) as user,
    json_extract_path_text(from_varbyte(kinesis_data,'utf-8'),'method', true)::varchar(30) as method,
    json_extract_path_text(from_varbyte(kinesis_data,'utf-8'),'path', true)::varchar(30) as uri,
    json_extract_path_text(from_varbyte(kinesis_data,'utf-8'),'code', true)::integer as code,
    json_extract_path_text(from_varbyte(kinesis_data,'utf-8'),'size', true)::integer as size,
    json_extract_path_text(from_varbyte(kinesis_data,'utf-8'),'referer', true)::varchar(255) as referer,
    json_extract_path_text(from_varbyte(kinesis_data,'utf-8'),'agent', true)::varchar(255) as agent
    FROM kds."fluent-bit-kds"

-- 刷新物化视图（可选）
REFRESH MATERIALIZED VIEW  mv_nginx_logs_extract;
select count(*) from mv_nginx_logs_extract;