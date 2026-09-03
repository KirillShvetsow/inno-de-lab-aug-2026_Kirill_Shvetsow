# Конфигурационный словарь, полученный от сервиса инициализации
db_config = {
    "connection": {
        "host": "production-db.internal",
        "port": 5432,
        "user": "postgres"
    }
}

# 1. Извлечь значения host и port из вложенного словаря connection
host = db_config["connection"].get("host")
port = db_config["connection"].get("port")

# 2. Безопасно проверить наличие ключа ssl_settings. Если этот ключ или вложенный в него
# параметр ssl_mode отсутствуют, переменная должна принять дефолтное значение verify-full
ssl_mode = db_config.get("connection", {}).get("ssl_settings", {}).get("ssl_mode", "verify-full")

# 3. Изменить значение пользователя (user) во вложенном словаре на admin
db_config["connection"]["user"] = "admin"

# 4. Добавить новый параметр max_connections со значением 100 непосредственно во вложенный словарь connection
db_config["connection"]["max_connections"] = 100

# 5. Вывести обновленное содержимое конфигурации connection, используя итерацию по парам ключ-значение
print(f"SSL Mode: {ssl_mode}")
print("Параметры соединения:")
for key, value in db_config["connection"].items():
    print(f"* {key}: {value}")