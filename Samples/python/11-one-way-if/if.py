num = float(input("Enter a real number: "))

res = num
if num < 0:
    res *= -1

print(f"|{num}| = {res}")