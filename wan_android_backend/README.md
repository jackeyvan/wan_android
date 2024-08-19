# 玩安卓后端框架

基于Dart团队的后端轻量框架shelf搭建，解决玩安卓的api在Flutter的Web端因跨域问题导致请求失败，并且学习Dart后端服务框架知识。

在开发玩安卓Flutter Web端的时候，遇到两个很难解决的问题：
一个是跨域，玩安卓三方api并不支持跨域，而Dart正好支持后端开发，所以自己塔一个简单的后端服务。
另一个是Cookie，玩安卓用户相关接口都依赖cookie，Flutter Web端因为浏览器的安全问题并不支持Set
Cookie。这个目前没有办法解决，所以只能阉割掉用户相关的功能。

后端服务的逻辑主要有两大块，一个是后台调度，服务启动后会去定时爬取玩安卓的数据并保存到Hive数据库，另一个是请求路由，请求到服务后，会去查一下数据库缓存数据，没有的话再去请求玩安卓API。

## 学习知识点

- shelf后端服务框架
- shelf_router路由分发
- shelf_router注解自动生成代码
- Hive数据库简单使用
- 简单的后台调度
- WanAndroid的大部分API
- Dart服务部署


### 本地启动服务

- 在bin/main.dart文件，运行文件即可。

### shelf_router注解自动生成代码

- 更改路由名称后，需要自动生成代码。

      dart run build_runner build

### Dart服务部署

这里使用三方的Dart服务部署工具Globe，部署十分的简单。

- 将工具加载到本地

        dart pub global activate globe_cli

- 登录到工具后台

        globe login

- 部署

  部署到开发环境：`globe deploy`

  部署到生产环境：`globe deploy --prod`

