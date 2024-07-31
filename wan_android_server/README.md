# wan_android_server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker compose up --build --detach

Then you can start the Serverpod server.

    dart bin/main.dart

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker compose stop


### 启动服务端

Docker 方式启动 postgres、redis

    cd wan_android/wan_android_server
    docker compose up --build --detach


启动 Serverpod 服务

    dart bin/main.dart --apply-migrations




### 更新Endpoint

生成代码

    serverpod generate

创建数据库表

    serverpod create-migration
    serverpod create-migration  --force


更新数据库后重启服务

    dart bin/main.dart --apply-migrations --role=maintenance