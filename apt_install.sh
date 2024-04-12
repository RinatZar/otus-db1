#!/bin/bash

# Установка Apache2
sudo apt update
sudo apt install Apache2 -y
systemctl daemon-reload
systemctl restart Apache2
if [ $? -eq 0 ]; then
          echo "Apache2 запущен, готов к работе"
else
          echo "Возникла ошибка, Apache2"
fi

# Установка mysql
apt install mysql-server-8.0 -y
systemctl daemon-reload
systemctl restart mysql
if [ $? -eq 0 ]; then
          echo "mysql запущен, готов к работе"
else
          echo "Возникла ошибка, mysql"
fi
