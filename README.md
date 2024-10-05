# traccar server

Start https://www.traccar.org server with a MariaDB backend. 

New tracker GPS devices can connect on port 5000-5150 and see https://www.traccar.org/devices which port the device should use and see https://www.traccar.org/protocols for the supported protocols traccar supports. 

## Start MariaDB

Start MySQL which will automatically create a database named 'traccar' with user 'traccar' and password 'traccar'

```
docker-compose up -d --build
docker-compose up -d mariadb
docker-compose logs -f mariadb
```

And watch the logs and wait for this line, this tells us that the database is up and running:

```
mysql_1    | Version: '5.4.49'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)`
```

## Start traccar

```
docker-compose up [-d] traccar
```
