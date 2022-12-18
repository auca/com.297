# Declaring a set
s = {1, 2, 3, 4, 5}

# Accessing elements in a set
print(2 in s)
print(6 in s)

# Modifying a set
s.add(6)
print(6 in s)

s.remove(4)
print(4 in s)

# Set operations
a = {1, 2, 3}
b = {3, 4, 5}

print(a - b)
print(a | b)
print(a & b)
print(a ^ b)

# Iterating over a set
for element in s:
    print(element)
