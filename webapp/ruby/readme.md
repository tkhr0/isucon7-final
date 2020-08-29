# ローカル起動方法

```
docker-compose up
```

## DB 初期化処理

```
cd ./db
./init.sql
```

## アプリケーション起動

```
docker-compose exec web bundle exec puma
```