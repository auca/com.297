import random

min, max = [int(part) for part in input("Enter min and max: ").split()]
print(f"Random from {min} to {max}: {random.randint(min, max)}")
