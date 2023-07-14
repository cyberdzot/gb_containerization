# C Семинара

# https://losst.pro/gruppy-polzovatelej-linux

unshare --fork --pid --mount-proc bash
ps -ax
free -m (Достуаня ОП)

# Помимо того что я ограничел процесс, мы хотим ограничить ресурсы.
# Все это надо делать в системе
exit

# Создаем простую группу
cgcreate -a $USER -g memory:mytestgroup -g cpu:mytestgroup

# С помощью - cgcreate — создаем контрольную группу
# Текущий пользователь - $USER
# указываем параметры котоыре будем ограничивать
# Ограничим memory - memory:mytestgroup
# Ограничим CPU - cpu:mytestgroup

# Посмотрим что она создалась
ls /sys/fs/cgroup/mytestgroup
# У Нас создалось все необходимое + по CPU и memory (Так как мы указали что хотим менять)

# Чтобы постоянно не прописывать , добавляем -
cd /sys/fs/cgroup/mytestgroup
ls

# пробуем
cat memory.max
# когда мы создаем контрольную группу, значение ее по умолчанию МАКС

# Войдем в нее
cgexec -g memory:mytestgroup bash
ls
free -m
# Смотрим что ограничений нет, все как было, то есть значение по умолчанию.

# Подводка для того, чтобы работать с контейнером.
# То есть сейчас создаем группу с исходным конфигом

sudo apt update
sudo apt install lxc-utils

# Далее ЛКС
# Смотрим
lxs storage list 
lxc network list
ip a


# Создаем
lxc-create -n test123 -t ubuntu --создаем контейнер
lxc-start -n test123 -- запускаем
lxc-attach -n teat123 -- войдем в него
free -m —проверяем пямаять
exit   -- выходим
lxc-stop -n test123 - -закрываем


vi /var/lib/lxc/test123/config-открываем
lxc.rootfs.path = dir:/var/lib/lxc/test1234/rootfs — путь
lxc.uts.name = test1234 -- имя

# Network configuration — Конфегурация сети
.
.
.
lxc.cgroup2.memory.max = 256M -- ограничиваем(В режиме Вставка делаем запись)

# :wq --  сохраняем и выходим(в режиме Записи) 

lxc-start -n test123 -- запускаем
lxc-attach -n teat123 -- войдем в него
free -m -- проверяем пямаять
# !!!Видим что наше ограничение работает!!!