class Shape:
    def __init__(self, x, y):
        self.x = x
        self.y = y

class Rectangle(Shape):
    width = 0
    height = 0

    def __init__(self, x, y, width, height):
        super().__init__(x, y)

        self.width = width
        self.height = height

    def __str__(self):
        return f"Rectangle(x={self.x}, y={self.y}, width={self.width}, height={self.height})"

class Circle(Shape):
    def __init__(self, x, y, radius):
        super().__init__(x, y)

        self.radius = radius

    def __str__(self):
        return f"Circle(x={self.x}, y={self.y}, radius={self.radius})"

circle = Circle(10, 20, 30)
print(circle)

rect = Rectangle(10, 20, 30, 40)
print(rect)
