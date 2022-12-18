sum = 0
i = 0

grade = int(input())
# no do/while loop
while grade != 0:
    sum += grade
    i += 1
    grade = int(input())

if i > 0:
    avg = sum / i
    print(f"Среднее арифметическое {avg:.1f}")
else:
    print("Нет данных для расчёта")
