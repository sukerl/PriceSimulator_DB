CREATE DATABASE pricesim default character set utf8 default collate utf8_bin;
GRANT ALL PRIVILEGES ON pricesim.* TO 'pricesim_rwx'@'%' IDENTIFIED BY '1Pricesim!';
GRANT SELECT, INSERT, UPDATE, DELETE ON  pricesim.* TO 'pricesim_rw'@'%' IDENTIFIED BY '1Pricesim!';
GRANT SELECT ON pricesim.* TO 'pricesim_r'@'%' IDENTIFIED BY '1Pricesim!';