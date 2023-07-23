# Для помощи при выполнении ДЗ
# ```
# FROM: Определяет базовый образ, на основе которого вы создаете свой образ.
# Пример:
FROM ubuntu:latest

# RUN: Запускает команды внутри контейнера во время сборки образа.
# Пример:
RUN apt-get update && apt-get install -y python3

# COPY или ADD: Копирует файлы или директории из исходной системы внутрь контейнера.
# Пример:
COPY app.py /app/

# WORKDIR: Устанавливает рабочую директорию внутри контейнера.
# Пример:
WORKDIR /app

# EXPOSE: Объявляет порт, который контейнер будет слушать во время выполнения.
# Пример:
EXPOSE 8080

# CMD: Определяет команду, которая будет выполняться при запуске контейнера.
# Пример:
CMD ["python3", "app.py"]

# ENTRYPOINT: Определяет точку входа, которая будет выполняться при запуске контейнера. Можно комбинировать с CMD.
# Пример:
ENTRYPOINT ["python3", "app.py"]

# Это только некоторые из команд, которые могут быть использованы в Dockerfile.
# Для полного списка команд и их синтаксиса вы можете ознакомиться с официальной документацией Docker: https://docs.docker.com/engine/reference/builder/



FROM ubuntu:22.10
RUN apt-get update && \
apt-get install -y cowsay && \
ln -s /usr/games/cowsay /usr/bin/cowsay && \
rm -rf /var/lib/apt/lists/*
CMD ["cowsay"]

FROM ubuntu:22.10
# : Указывает базовый образ, на основе которого будет создан новый образ. В данном случае используется образ Ubuntu версии 22.10.
RUN apt-get update &&
# : Обновляет список пакетов в системе.
apt-get install -y cowsay &&
# : Устанавливает пакет "cowsay" в систему. Опция -y указывает на автоматическое подтверждение при установке.
ln -s /usr/games/cowsay /usr/bin/cowsay &&
# : Создает символическую ссылку /usr/bin/cowsay, чтобы можно было запускать команду cowsay из любого места в системе.
rm -rf /var/lib/apt/lists/*
# : Удаляет временные файлы, скачанные во время установки пакетов, чтобы сэкономить место в образе.
CMD "cowsay"
# : Задает команду по умолчанию для запуска при запуске контейнера. В данном случае, при запуске контейнера будет выполнена команда cowsay.


docker run
# Запускает контейнер из образа.
# Пример:
docker run my-image

docker start
# Запускает остановленный контейнер.
# Пример:
docker start my-container

docker stop
# Останавливает запущенный контейнер.
# Пример:
docker stop my-container

docker restart
# Перезапускает контейнер.
# Пример:
docker restart my-container

docker pause
# Приостанавливает выполнение контейнера.
# Пример:
docker pause my-container

docker unpause
# Возобновляет выполнение приостановленного контейнера.
# Пример:
docker unpause my-container

docker exec
# Запускает команду внутри работающего контейнера.
# Пример:
docker exec -it my-container bash

docker attach
# Присоединяется к работающему контейнеру и подключается к его выводу.
# Пример:
docker attach my-container

docker logs
# Выводит логи контейнера.
# Пример:
docker logs my-container



# Останавливаем все запущенные контейнеры
docker kill $(docker ps -q)

# Удаляем все остановленные контейнеры
docker rm $(docker ps -a -q)

# Удаляем все образы
docker rmi $(docker images -q)