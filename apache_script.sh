#!/bin/bash

DIR='/var/www/html'
DIR1='/home/otus-db1/index.html'
DIR2='/var/www/html'

#Копируем конфиг 
cp $DIR1 $DIR2


systemctl reload apache2
if [ $? -eq 0 ]; then
          echo "Стартовая страница Apache2 изменена"
else
          echo "Возникла ошибка"
fi
