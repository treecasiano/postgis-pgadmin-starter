# README

## Docker Configuration and Test Data

The starter dump file uses some data from the SQL for Data Analytics book (authors Jun Shan, Matt Goldwasser, Upom Malik, Benjamin Johnston) I've been studying. I created a `docker-compose.yml` file that includes the configuration for PostGIS and PgAdmin along with a few bash scripts for convenience. The book authors provided a link to a file called `data.dump`, which I renamed to `dump.sql` to follow conventions I use elsewhere.

### Starting and Stopping the Container

To start:  ```docker-compose up```

To shut down: ```docker-compose down```

## pgAdmin

Once Docker works its magic and all the services are spun up correctly, PgAdmin can be found by going to `http://localhost:5050/browser/`. Login with credentials specific to PGAdmin in the `docker-compose.yml` file.

To retrieve the IP address that you need to use in PgAdmin's server configuration, run `bin/get-ip.sh`. You will need to have `jq` installed as a global node package (see below).

Because this just a playground with fake data, the password is `admin` for the `pgadmin4@pgadmin.org` login and `pass` for the `postgres` user login. (`postgres` is the default database user.) Obviously, do not use this user or password in production environments.

### jq

If you are on a Mac, you can use Homebrew to install `jq` globally, which you will need if you want to use the convenience `get-ip` script found in this repo's `bin/` folder.

``` bash
brew install jq
```

### Connecting to the Docker container

You can run bash and psql commands directly in the Docker container.

``` bash
docker exec -it sqlda-container bash
```

``` bash
su postgres
```

Use just the `psql` command to enter the psql shell.

``` bash
psql
```

From there you will be able to see the database(s) using the `\l` command. The list should look like this:

``` bash
                                                List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    | ICU Locale | Locale Provider |   Access privileges
-----------+----------+----------+------------+------------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            |
 sqlda     | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
           |          |          |            |            |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
           |          |          |            |            |            |                 | postgres=CTc/postgres
(4 rows)

```

**TODO:**

- Add a sample spatial dataset
