# ChartE

## Deploy

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://dashboard.heroku.com/new?template=https://github.com/zpcc/ChartE)

目前部署后需要手动初始化数据库（参见 init.sql）

## Run

```bash
mvn package

java -jar target/dependency/webapp-runner.jar --port 8080 target/*.war
```

## See Also

[GitHub - heroku/devcenter-webapp-runner](https://github.com/heroku/devcenter-webapp-runner)
