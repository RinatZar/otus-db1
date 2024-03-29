#!/bin/bach
#Пользователь для реплики
user="repl"
pass="123456"

cre_mysqld_cnf="/etc/mysql/mysql.conf.d/mysqld.cnf"
bind_address_new="bind-address = 0.0.0.0"

#Добавляем параметры в mysqld.cnf

if [ -f "$cre_mysqld_cnf" ]; then
  sed -i "s/^bind-address\s*=\s*127.0.0.1/$bind_address_new/" $cre_mysqld_cnf
  echo "server-id = 1" >> $cre_mysqld_cnf
  echo "binlog_format = row" >> $cre_mysqld_cnf
  echo "gtid-mode=ON" >> $cre_mysqld_cnf
  echo "enforce-gtid-consistency" >> $cre_mysqld_cnf
  echo "log-replica-updates" >> $cre_mysqld_cnf
else
  echo "файл $cre_mysqld_cnf не найден"
fi
service mysql restart
echo "Конфиг MySQL-source настроен"

#Создаем пользователя для реплики
mysql -e "CREATE USER $user@'%' IDENTIFIED WITH 'caching_sha2_password' BY '$pass';"
mysql -e "GRANT REPLICATION SLAVE ON *.* TO $user@'%';"
echo "Пользователь $user создан и получил права на репликацию"
mysql -e "create database otus;"
echo "MySQL готов к работе"
