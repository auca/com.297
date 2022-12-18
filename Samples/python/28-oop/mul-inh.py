class A:
    def __init__(self):
        self.name = "A"

    def do_something(self):
        print(f"{self.name} is doing something")


class B:
    def __init__(self):
        self.name = "B"

    def do_something(self):
        print(f"{self.name} is doing something")

class C(A, B):
    def __init__(self):
        super().__init__()
        print(self.name) # ?
        self.name = "C"

c = C()
c.do_something()  # Output: "? is doing something"
