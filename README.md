# Test Guru

It is awesome application to create your own tests

## Technical Requirements
* Ruby version: 2.6.1p33 (2019-01-30 revision 66950)
* Rails version: Rails 5.2.3

## список сущностей (объектов реального мира) для проекта
* User
* Test
* Question
* Answer
* Result


# Deployment instructions
```
heroku login
```
```
heroku apps:destroy tn-test-guru
heroku create tn-test-guru
```

#### Настраиваем удаленный репозиторий на хероку
```
git config --list | grep remote
git remote remove heroku
git remote add heroku https://git.heroku.com/tn-test-guru.git
```

#### Заливаем код на репозиторий хероку
если деплоим НЕ мастер ветку
```
git push heroku part_17_deploy_FINAL:master
```
если деплоим мастер ветку
```
git push heroku master
```
#### Выполняем миграцию
```
heroku run rake db:migrate
```

#### Устанавливаем переменные окружения (среды). В коде берем значения так `ENV['SMTP_USERNAME']`.
```
heroku config:set SMTP_USERNAME=thinknetica.test@gmail.com
heroku config:set SMTP_PASSWORD=abcd%123
```

---
#### Open application
```
heroku open
```

#### Register a new first user which will be admin after database seed
```
thinknetica.test@gmail.com 
123456
```
----

#### Заполняем базу данных
```
heroku run rake db:seed
```

# Topics will be covered during development 
Things you may want to cover:

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* ...
