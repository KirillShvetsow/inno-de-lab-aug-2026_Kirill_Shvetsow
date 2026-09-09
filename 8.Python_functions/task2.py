import time
from typing import Callable, Any

PERFORMANCE_LOG_PREFIX = "[PERF_LOG]"
TIME_DECIMALS = 8


def performance_logger(func: Callable) -> Callable:
    """Декоратор для замера времени выполнения функции."""
    def wrapper(*args: Any, **kwargs: Any) -> Any:
        start = time.perf_counter()
        result = func(*args, **kwargs)
        elapsed = round(time.perf_counter() - start, TIME_DECIMALS)
        print(f"{PERFORMANCE_LOG_PREFIX} Функция '{func.__name__}' выполнена за {elapsed} сек.")
        return result
    return wrapper

@performance_logger
def get_sorted_report(data: list[dict[str, str | float]]) -> list[dict[str, str | float]]:
    """
    Сортирует список фильмов по выручке.

    Args:
        data: Список словарей с ключами category и total_sales

    Returns:
        Отсортированный список
    """
    return sorted(data, key=lambda x: x["total_sales"], reverse=True)

test_data = [
    [
        {"category": "Action", "total_sales": 4311.85},
        {"category": "Animation", "total_sales": 4656.30},
        {"category": "Children", "total_sales": 3655.55}
    ],
    [
        {"category": "Classics", "total_sales": 1200.10},
        {"category": "Comedy", "total_sales": 4000.00},
        {"category": "Documentary", "total_sales": 4000.00}
    ],
    [
        {"category": "Drama", "total_sales": 500.00}
    ]
]
print("=== ТЕСТИРОВАНИЕ ПРОИЗВОДИТЕЛЬНОСТИ ===")

for i, data in enumerate(test_data, 1):
    print(f"\n--- ТЕСТ {i} ---")
    sorted_data = get_sorted_report(data)
    print("Топ категорий по выручке:")
    for j, item in enumerate(sorted_data, 1):
        print(f"{j}. {item['category']}: {item['total_sales']}")