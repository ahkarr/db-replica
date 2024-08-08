-- mariadb shell
MariaDB [(none)]> create user 'repl'@'192.168.101.41' identified by '*******';
Query OK, 0 rows affected (0.008 sec)

MariaDB [(none)]> grant replication slave on *.* to 'repl'@'192.168.101.41';
Query OK, 0 rows affected (0.003 sec)

MariaDB [(none)]> flush privileges;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> FLUSH TABLES WITH READ LOCK;
Query OK, 0 rows affected (0.034 sec)

MariaDB [(none)]> SHOW MASTER STATUS;
+------------------+----------+--------------+------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |
+------------------+----------+--------------+------------------+
| mysql-bin.000001 |      791 |              |                  |
+------------------+----------+--------------+------------------+
1 row in set (0.001 sec)

MariaDB [(none)]> UNLOCK TABLES;
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> SHOW MASTER STATUS\G
*************************** 1. row ***************************
            File: mysql-bin.000001
        Position: 791
    Binlog_Do_DB:
Binlog_Ignore_DB:
1 row in set (0.000 sec)