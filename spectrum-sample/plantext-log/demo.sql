
create external schema myspectrum_schema 
from data catalog 
database 'myspectrum_db' 
iam_role default
create external database if not exists;

CREATE EXTERNAL TABLE myspectrum_schema.cloudfront_logs (
  day DATE,
  day_time varchar(255),
  location varchar(255),
  bytes integer,
  request_ip varchar(255),
  method varchar(255),
  host varchar(255),
  uri varchar(255),
  status integer,
  referrer varchar(255),
  user_agent varchar(255),
  query_string varchar(255),
  cookie varchar(255),
  result_type varchar(255),
  request_id varchar(255),
  host_header varchar(255),
  request_protocol varchar(255),
  request_bytes integer,
  time_taken decimal(8,2),
  xforwarded_for varchar(255),
  ssl_protocol varchar(255),
  ssl_cipher varchar(255),
  response_result_type varchar(255),
  http_version varchar(255),
  fle_status varchar(255),
  fle_encrypted_fields integer,
  c_port integer,
  time_to_first_byte decimal(8,2),
  x_edge_detailed_result_type varchar(255),
  sc_content_type varchar(255),
  sc_content_len integer,
  sc_range_start integer,
  sc_range_end integer
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t'
LOCATION 's3://mock-logs-3245345435/AWSLogs/CloudFrontLogs/'

select * from myspectrum_schema.cloudfront_logs