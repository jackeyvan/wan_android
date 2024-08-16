# 玩安卓后端框架

基于Dart团队的后端轻量框架shelf搭建，解决玩安卓的api在Flutter的Web端因跨域问题导致请求失败，并且学习Dart后端服务框架知识。

## 学习知识点

- shelf后端服务框架
- shelf_router路由分发
- shelf_router注解自动生成代码
- Hive数据库简单使用
- WanAndroid的大部分API
- Dart服务部署


### Dart服务部署
这里使用三方的Dart服务部署工具Globe，部署十分的简单。

- 将工具加载到本地
    
        dart pub global activate globe_cli

- 登录到工具后台
    
        globe login

- 部署
    
        globe deploy

