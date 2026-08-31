first_number = input("Введите первое число: ")
second_number = input("Введите второе число число: ")
flag = False
while not flag:
    operator = input("Введите оператор (+, -, *, /): ")
    if operator == "+":
        result = float(first_number) + float(second_number)
        flag = True
    elif operator == "-":
        result = float(first_number) - float(second_number)
        flag = True
    elif operator == "*":
        result = float(first_number) * float(second_number)
        flag = True
    elif operator == "/":
        result = float(first_number) / float(second_number)
        flag = True
    else:
        print("Введите оператор из списка!")
print(f"Результат: {first_number} {operator} {second_number} = {result}")
