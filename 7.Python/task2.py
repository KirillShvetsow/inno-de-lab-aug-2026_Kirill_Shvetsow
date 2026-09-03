# Список транзакций, полученных от платежного шлюза
raw_transactions = ["SUCCESS:100", "FAILED:50", "SUCCESS:-10", "SUCCESS:0", "SUCCESS:250", "ERROR:200"]

filtered_transactions = [
    int(transaction.split(':')[1])  # Извлекаем числовое значение суммы
    for transaction in raw_transactions
    if transaction.startswith('SUCCESS')  # Отсеиваем транзакции, не имеющие статус SUCCESS
    and int(transaction.split(':')[1]) > 0  # Исключаем транзакции с неположительной суммой
]

print(f"Очищенные транзакции: {filtered_transactions}")