num1 = int(input("Enter the first number: "))
num2 = int(input("Enter the second number: "))

if num1 > num2:
    print(f"The first number {num1} is greater than the second number {num2}.")
elif num2 > num1:
    print(f"The second number {num2} is greater than the first number {num1}.")
else:
    print(f"The numbers are equal.")
