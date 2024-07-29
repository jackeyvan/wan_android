
# 玩安卓


### 启动服务端
-  Docker 方式启动 postgres、redis

    - `$ cd wan_android/wan_android_server`
    - `$ docker compose up --build --detach`

   
- 启动 Serverpod 服务
    
  - `$ dart bin/main.dart --apply-migrations`




### 更新Endpoint

- `serverpod generate`
