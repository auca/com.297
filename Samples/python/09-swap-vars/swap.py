a, b = [int(part) for part in input("Enter two numbers: ").split()]
print(f"Before swap: {a=}, {b=}")
a, b = b, a
print(f"After swap: {a=}, {b=}")
