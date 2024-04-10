# otus-db1. Инструкция по восстановлению
1. Установить git.
   ```bash
   sudo apt istall git
   ```
2. Загрузить скрипты для восстановления системы.
    ```bash
   git clone https://github.com/RinatZar/otus-app1.git
   ```  
3. Запустить скрипт настройки сетевого интерфейса.
    ```bash
   bash network_static.sh
   ``` 
4. Установить Apache2, MySQL 
   ```bash
   bash apt_install.sh
   ```
5. Запустить скрипт настройки Apache2.
   ```bash
    bash apache_script.sh
   ```
   6. Запустить скрипт настройки MySQL.
   ```bash
    bash mysql_script_source.sh
   ```
