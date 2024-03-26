#!/bin/bash

DIR='/etc/netplan/'
DIR1='/home/otus-db1/01db-static.yaml'
DIR2='/etc/netplan/'

#Копируем конфиг 
cp $DIR1 $DIR2
echo "файл конфига 01db-static.yml скопирован в $DIR"

netplan generate
netplan apply
if [ $? -eq 0 ]; then
          echo "Статический IP включен"
else
          echo "Возникла ошибка"
fi
read -p "Для просмотра сетевых интерфейсов нажмите Enter"
ip -4 a
#read -p "Нажмите enter для инсталляции nginx"
#apt install nginx


#Перезапускаем сервис networkd
#systemctl restart systemd-networkd
#if [ $? -eq 0 ]; then
#          echo "Статический IP включен"
#else
#          echo "Возникла ошибка"
#fi
