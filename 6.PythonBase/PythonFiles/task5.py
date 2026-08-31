import random

random_number = random.randint(5, 21)
attempts = 5
print("Я загадал число от 5 до 20. У тебя 5 попыток!")
while attempts > 0:
    user_number = input(f"Попытка {attempts}. Введите число:")
    if int(user_number) == random_number:
        print("Ты угадал! Отличная работа")
        break
    elif int(user_number) > random_number:
        print(f"Слишком много! Осталось попыток: {attempts-1}")
    elif int(user_number) < random_number:
        print(f"Слишком мало! Осталось попыток: {attempts-1}")
    attempts -= 1
print(f"Ты не угадал! Загаданное число: {random_number}")