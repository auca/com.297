class Employee:
    pass

john = Employee()
john.name = 'John Doe'
john.dept = 'SFW'
john.salary = 1000000
print(john)

from dataclasses import dataclass

@dataclass
class Student:
    name: str
    dept: str
    tuition: int

jane = Student('Jane Doe', 'SFW', 1000000)
print(jane)
