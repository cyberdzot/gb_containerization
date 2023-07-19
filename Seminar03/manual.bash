# Для установки Доскер
# https://docs.docker.com/engine/install/ubuntu/



docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:8.0.31
docker run --name myphp -d --link some-mysql:db -p 8081:80 phpmyadmin/phpmyadmin

# В первой команде docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:8.0.31, происходит следующее:

docker run - запускает новый контейнер на основе указанного образа.
# --name some-mysql - задает имя контейнера как "some-mysql".
# -e MYSQL_ROOT_PASSWORD=my-secret-pw - устанавливает переменную среды в контейнере, где MYSQL_ROOT_PASSWORD устанавливается в значение "my-secret-pw". Это используется для установки пароля для учетной записи root в MySQL.
# -d - запускает контейнер в фоновом режиме (detached mode).
# mysql:8.0.31 - указывает на использование образа MySQL версии 8.0.31.
# Таким образом, эта команда запускает контейнер MySQL с именем "some-mysql" и устанавливает пароль для учетной записи root в MySQL.

# Во второй команде docker run --name myphp -d --link some-mysql:db -p 8081:80 phpmyadmin/phpmyadmin, происходит следующее:

docker run - запускает новый контейнер на основе указанного образа.
# --name myphp - задает имя контейнера как "myphp".
# -d - запускает контейнер в фоновом режиме (detached mode).
# --link some-mysql:db - устанавливает связь (link) между контейнерами "some-mysql" и "myphp", где "some-mysql" будет доступен внутри контейнера "myphp" под именем "db".
# -p 8081:80 - пробрасывает порт 8081 на хостовой машине на порт 80 внутри контейнера. Таким образом, при обращении к порту 8081 на хостовой машине, будет установлено соединение с контейнером по порту 80.
# phpmyadmin/phpmyadmin - указывает на использование образа phpMyAdmin.
# Эта команда запускает контейнер phpMyAdmin с именем "myphp", связывает его с контейнером MySQL "some-mysql" и пробрасывает порт 8081 для доступа к phpMyAdmin через веб-браузер на хостовой машине.


nano /test/folder/test.txt
nano /root/test.txt
docker run -it -h GB --name gb-test -v /test/folder:/otherway -v /root/test.txt:/otherway/test.txt ubuntu:22.10
root@GB:/# cat /otherway/test.txt
