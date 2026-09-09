MAX_RENTAL_BATCH_LIMIT = 150.0


def calculate_rental_batch(quantity: int, rental_rate: float, discount: float = 0.0) -> tuple[float, bool]:
    """
    Рассчитывает стоимость партии фильмов.

    Args:
        quantity: Количество дисков
        rental_rate: Цена за диск
        discount: Скидка (по умолчанию 0)

    Returns:
        Кортеж (сумма, превышен_ли_лимит)
    """
    final_sum = round(quantity * rental_rate * (1 - discount), 2)
    is_limit_exceeded = final_sum > MAX_RENTAL_BATCH_LIMIT
    return final_sum, is_limit_exceeded


films = [
    ("Academy Dinosaur", 30, 2.99, 0.0),
    ("Affair Prejudice", 40, 4.99, 0.10),
    ("Agent Truman", 10, 1.99, 0.0),
    ("African Egg", 50, 3.50, 0.20),
]
print("=== ОТЧЕТ ПО ПАРТИЯМ АРЕНДЫ ===")

for i, (name, qty, rate, disc) in enumerate(films, 1):
    if i <= 2:
        total, exceeded = calculate_rental_batch(qty, rate, disc)
    else:
        total, exceeded = calculate_rental_batch(quantity=qty, rental_rate=rate, discount=disc)

    print(f"Партия {i} ({name}): Сумма {total}$. Превышение лимита: {exceeded}")