### Hexlet tests and linter status:
[![Actions Status](https://github.com/daniscoder/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/daniscoder/devops-for-developers-project-77/actions)

# Devops For Developers Project 77

Развёртывание инфраструктуры через Terraform и деплой приложения через Ansible.

## Приложение

https://daniscoder.online

## Требования

* Terraform >= 1.0
* Ansible >= 2.10
* Make

## Подготовка

Создай файл с паролем для Ansible Vault:
```bash
echo "your_vault_password" > .vault_password
```

Скопируй пример переменных окружения:
```bash
cp .env.example .env
```

## Инициализация Terraform

```bash
make init SPACES_ACCESS_KEY=<key> SPACES_SECRET_KEY=<secret>
```

## Создание инфраструктуры

```bash
make apply DO_TOKEN=<token> DATADOG_API_KEY=<key> DATADOG_APP_KEY=<key>
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

## Мониторинг

```bash
make monitoring
```

## Удаление инфраструктуры

```bash
make destroy DO_TOKEN=<token>
```
