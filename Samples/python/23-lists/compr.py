# Using a list comprehension to create a list of squares
squares = [i**2 for i in range(5)]
print(squares)

# Using a list comprehension with an if clause
even_squares = [i**2 for i in range(10) if i % 2 == 0]
print(even_squares)

# Using a list comprehension with an if-else clause
signs = ["Positive" if i > 0 else "Negative" for i in [-1, 2, 0, -3, 4]]
print(signs)

# Using a list comprehension to flatten a list of lists
matrix = [[1, 2], [3, 4], [5, 6]]
flat = [x for row in matrix for x in row]
print(flat)

# Using a list comprehension to create a list of tuples
pairs = [(x, y) for x in range(3) for y in range(3)]
print(pairs)
