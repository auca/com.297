# Declaring an array
numbers = [1, 2, 3, 4, 5]

# Accessing elements in an array
print(numbers[0])
print(numbers[1])
print(numbers[-1])
print(numbers[-2])

# Modifying elements in an array
numbers[0] = 10
print(numbers[0])
numbers[0] = [1, 2]
print(numbers[0])

# Array slicing
print(numbers[1:3])
print(numbers[:3])
print(numbers[3:])
print(numbers[:])

# Deleting ranges
del numbers[0:1]

# Array length
print(len(numbers))

# Appending to an array
numbers.append(6)
print(numbers)

# Removing from an array
numbers.remove(4)
print(numbers)

# Removing the last element from an array
numbers.pop()
print(numbers)

# Iterating over an array
for number in numbers:
    print(number)

# Iterating through an array with index
for index, number in enumerate(numbers):
    print(f"Index: {index}, Value: {number}")
