# Devops For Developers Project 77

Развёртывание инфраструктуры через Terraform и деплой приложения через Ansible.

## Приложение

https://daniscoder.online

## Требования

* Terraform
* Ansible
* Make

## Инициализация Terraform

```bash
make init SPACES_ACCESS_KEY=<key> SPACES_SECRET_KEY=<secret>
```

## Создание инфраструктуры

```bash
make apply DO_TOKEN=<token>
```

## Установка зависимостей Ansible

```bash
make install
```

## Подготовка серверов

```bash
make setup
```

## Деплой приложения

```bash
make deploy
```

## Удаление инфраструктуры

```bash
make destroy DO_TOKEN=<token>
```
