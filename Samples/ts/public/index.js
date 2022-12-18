"use strict";
let id = 2929;
let firstName = "Dmitrii";
let isRegistered = true;
console.log(`${id}: ${firstName}, registered: ${isRegistered}`);
let nums = [1, 2, 3, 4, 5];
let stuff = [true, 1, 2, 3, 'text'];
console.log(nums);
console.log(stuff);
let student = [2929, 'Dmitrii'];
student = [4242, 'Joe'];
let pid = 384738;
pid = '348737';
;
let person = {
    id: 4949,
    firstName: "Joe"
};
class Shape {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
}
class Circle extends Shape {
    constructor(x, y, radius) {
        super(x, y);
        this.radius = radius;
    }
}
class Rect extends Shape {
    constructor(x, y, width, height) {
        super(x, y);
        this.width = width;
        this.height = height;
    }
}
//# sourceMappingURL=index.js.map