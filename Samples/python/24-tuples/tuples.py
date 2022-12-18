# Declaring a tuple
coordinates = (4, 5)

# Accessing elements in a tuple
print(coordinates[0])
print(coordinates[1])
print(coordinates[-1])

# Tuples are immutable
try:
    coordinates[0] = 10
except TypeError as e:
    print(e)

# Tuple packing and unpacking
x, y = (4, 5)
print(x)
print(y)

# Iterating over a tuple
for coordinate in coordinates:
    print(coordinate)
