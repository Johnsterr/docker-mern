# Пример проекта на Docker-контейнерах

Основные команды:

- `docker ps` - список запущенных контейнеров
- `docker run` - запустить контейнер
  <br/>
  Пример: `docker run -p 27017:27017 -d --rm --name mongodb mongo`
- `docker stop <имя-контейнера>` - остановить контейнер по имени
  <br/>
  Пример: `docker stop mongodb`

Для запуска в detach-mode (для доступности консоли) к некоторым командам лучше добавить флаг **-d**

## Network (сеть)

Команды для работы с сетями:

- `docker network ls` - просмотр списка сетей
- `docker network prune` - очистка сетей
- `docker network create <имя-сети>` - создание сети со своим именем

Для клиентских приложений необязательно при запуске контейнера указывать флаг `--network <имя-сети>`

[Раздел в оф. документации](https://docs.docker.com/network/ "Docker Networking overview")

## Volumes (тома)

После остановки работающих контейнеров теряются данные, которые были созданы в процессе работы приложения.

> Например, в БД внесли записи, но после перезапуска контейнера БД их не осталось.

Для исправления такой ситуации используются *Volumes* или *тома*.

Команды для работы с томами:

- `docker volume ls` - просмотр списка томов
- `docker volume prune` - очистка томов
- `docker volume rm <имя-тома>` - удаление тома по его имени
  <br/>
  Пример: `docker volume rm mongo-data`

[Раздел в оф. документации](https://docs.docker.com/storage/ "Manage data in Docker")

## Docker-compose

Оптимизация запуска окружения, работы с контейнера и т.д.

Команды для работы с Docker-compose:

- `docker-compose up` - команда запускает окружение
- `docker-compose down` - остановка окружения

> По-умолчанию команда ищет файл **docker-compose.yml** в директории откуда вызвана команда

- `docker-compose -f <имя-файла>` - указание на конкретное имя файла конфигурации docker-compose
  <br/>
  Пример: `docker-compose -f docker-compose.yml up -d`

[Раздел в оф. документации](https://docs.docker.com/compose/compose-file/ "Compose file")
