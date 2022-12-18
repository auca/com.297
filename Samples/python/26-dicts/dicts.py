# Declaring a dictionary
student = {
    "name": "John Smith",
    "age": 30,
    "courses": ["Math", "Physics", "Computer Science"],
}

# Accessing elements in a dictionary
print(student["name"])
print(student["age"])

# Modifying elements in a dictionary
student["age"] = 25
print(student["age"])

# Adding to a dictionary
student["phone"] = "555-555-5555"

# Removing from a dictionary
del student["phone"]

# Iterating over a dictionary
for key in student:
    print(f"{key}: {student[key]}")
for key, val in student.items():
    print(f"{key}: {val}")
