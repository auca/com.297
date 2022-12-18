num = abs(int(input("Enter a number: ")))

sum = 0
while num != 0:
    sum += num % 10
    num //= 10

print(f"The sum of all digits is {sum}")