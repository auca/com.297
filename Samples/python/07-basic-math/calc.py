num1 = float(input("Enter the first number: "))
num2 = float(input("Enter the second number: "))

res = num1 + num2
print(num1, "+", num2, "=", res)
print("{0} + {1} = {2}".format(num1, num2, res))
print(f"{num1} + {num2} = {res:.3f}") # round sum to three digits after .