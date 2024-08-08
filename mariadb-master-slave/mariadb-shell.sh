-- event_scheduler global variable
MariaDB [(none)]> SHOW GLOBAL VARIABLES LIKE '%event_scheduler%' \G;
*************************** 1. row ***************************
Variable_name: event_scheduler
        Value: OFF
1 row in set (0.001 sec)

ERROR: No query specified

MariaDB [(none)]> SET GLOBAL event_scheduler = ON;
Query OK, 0 rows affected (0.003 sec)

MariaDB [(none)]> SHOW GLOBAL VARIABLES LIKE '%event_scheduler%' \G;
*************************** 1. row ***************************
Variable_name: event_scheduler
        Value: ON
1 row in set (0.001 sec)

ERROR: No query specified

-- create database job to generate sample data

CREATE EVENT B_BatchLog
ON SCHEDULE EVERY 1 SECOND 
DO
INSERT INTO batch.BatchLog 
(BatchInstance,BatchBody,TransactionBody,CreatedOnUTC,UpdatedOnUTC,Channel)
VALUES 
(uuid(),JSON_OBJECT('api-instance',uuid(),'created-at',NOW()),
JSON_OBJECT(
'rand',rand(),
'acos',acos(rand()),
'asin',asin(rand()),
'atan',atan(rand()),
'cos',cos(rand()),
'exp',EXP(rand()),
'ln',LN(rand()),
'log',log(rand()),
'log10',log10(rand()),
'log2',log2(rand()),
'pi',pi(),
'sin',sin(rand()),
'sqrt',sqrt(rand()),
'tan',tan(rand()),
'radians',radians(rand()),
'pow',pow(rand(),2),
'created-at',NOW()),
NOW(),NOW(),char(round(rand()*25)+97));

MariaDB [batch]> SHOW EVENTS \G;
*************************** 1. row ***************************
                  Db: batch
                Name: B_BatchLog
             Definer: root@localhost
           Time zone: SYSTEM
                Type: RECURRING
          Execute at: NULL
      Interval value: 1
      Interval field: SECOND
              Starts: 2024-08-04 04:42:12
                Ends: NULL
              Status: ENABLED
          Originator: 1
character_set_client: utf8mb3
collation_connection: utf8mb3_general_ci
  Database Collation: utf8mb4_general_ci
1 row in set (0.001 sec)

ERROR: No query specified