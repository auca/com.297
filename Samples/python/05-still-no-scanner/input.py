print('Enter the radius and length of a cylinder: ', end='')

# parts  = input().split()
# radius = float(parts[0])
# length = float(parts[1])

radius, length = [float(part) for part in input().split()] # "5.5 12" -> ["5.5", "12"]
area = radius * radius * 3.14159
volume = area * length
print(
    f"Area: {area}\n"
    f"Volume: {volume}"
)
