from typing import Any, Optional, Tuple


DEFAULT_RETURN_INDEX_BASE = 10.0


def calculate_overdue_fine(days_overdue: Any, fine_rate: float) -> Optional[Tuple[float, float]]:
    """
    Безопасно рассчитывает штраф и индекс оборачиваемости.

    Args:
        days_overdue: Количество дней просрочки
        fine_rate: Штраф за день

    Returns:
        Кортеж (штраф, индекс) или None при ошибке
    """
    try:
        days = float(days_overdue)
        total_fine = days * fine_rate
        return_index = DEFAULT_RETURN_INDEX_BASE / days

    except TypeError as e:
        print(f"[ОШИБКА ТИПА] Невозможно преобразовать дни в число для '{days_overdue}': {e}")
        return None

    except ValueError as e:
        print(f"[ОШИБКА ЗНАЧЕНИЯ] Невозможно преобразовать дни в число для '{days_overdue}': {e}")
        return None

    except ZeroDivisionError as e:
        print(f"[ОШИБКА ДЕЛЕНИЯ НА НОЛЬ] Возврат без просрочки для '{days_overdue}': {e}")
        return None

    finally:
        print("--- Проверка транзакции возврата завершена ---")

    return total_fine, return_index

test_cases = [
    ("Matrix", 5, 1.5),
    ("Inception", "пять", 2.0),
    ("Avatar", 0, 2.5),
    ("Interstellar", [3], 3.0),
]

print("=== ПРОВЕРКА ВОЗВРАТОВ ===")

for title, days, rate in test_cases:
    print(f"\nФильм: '{title}'")
    result = calculate_overdue_fine(days, rate)
    if result:
        fine, index = result
        print(f"Итоговый штраф: {fine}$ | Индекс: {index}")