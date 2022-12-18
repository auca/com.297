class Shape:
    def __init__(self, x, y):
        self._x = x
        self._y = y

    @property
    def x(self):
        return self._x

    @property
    def y(self):
        return self._y

class Rectangle(Shape):
    def __init__(self, x, y, width, height):
        super().__init__(x, y)

        self.width = width
        self.height = height

class Circle(Shape):
    def __init__(self, x, y, radius):
        super().__init__(x, y)

        self._radius = radius if radius > 0 else 0

    @property
    def radius(self):
        return self._radius

    @radius.setter
    def radius(self, radius):
        if radius > 0:
            self._radius = radius

circle = Circle(10, 20, 30)
print(circle.x)
print(circle.y)
print(circle.radius)

circle.radius = -10
print(circle.radius)
