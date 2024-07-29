
# 玩安卓


### 启动服务端
-  Docker 方式启动 postgres、redis

    - `$ cd wan_android/wan_android_server`
    - `$ docker compose up --build --detach`

   
- 启动 Serverpod 服务
    
  - `$ dart bin/main.dart --apply-migrations`




### 更新Endpoint

- 生成代码

  - `serverpod generate`

- 创建数据库表

  - `serverpod create-migration`

- 更新数据库后重启服务

  - `dart bin/main.dart --apply-migrations --role=maintenance`