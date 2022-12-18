num1 = int(input("Enter the first number: "))
num2 = int(input("Enter the second number: "))
num3 = int(input("Enter the third number: "))

max = 0
if num1 > num2:
    if num1 > num3:
        max = num1
    else:
        max = num3
else:
    if num2 > num3:
        max = num2
    else:
        max = num3

print(f"The maximum value is {max}.")
