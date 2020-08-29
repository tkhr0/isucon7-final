#!/bin/bash
mysql -h 127.0.0.1 -u local_user -ppassword --default-character-set=utf8mb4 < ./drop.sql
mysql -h 127.0.0.1 -u local_user -ppassword --default-character-set=utf8mb4 isudb < ./isudb.sql
mysql -h 127.0.0.1 -u local_user -ppassword --default-character-set=utf8mb4 isudb < ./m_item.sql
