let id: number = 2929;
let firstName: string = "Dmitrii";
let isRegistered: boolean = true;
console.log(`${id}: ${firstName}, registered: ${isRegistered}`);

let nums: number[] = [1, 2, 3, 4, 5];
let stuff: any[] = [true, 1, 2, 3, 'text'];
console.log(nums);
console.log(stuff);

let student: [number, string] = [2929, 'Dmitrii'];
student = [4242, 'Joe'];

type PidType = number | string

let pid: PidType = 384738;
pid = '348737';

// type PersonType = {
//     id: number
//     firstName: string
// }

interface PersonInterface {
    id: number
    firstName: string
};

let person: PersonInterface = {
    id: 4949,
    firstName: "Joe"
};

class Shape {
    x: number;
    y: number;
    constructor(x: number, y: number) {
        this.x = x;
        this.y = y;
    }
}

class Circle extends Shape {
    radius: number;
    constructor(x: number, y: number, radius: number) {
        super(x, y);
        this.radius = radius;
    }
}

class Rect extends Shape {
    width: number;
    height: number;

    constructor(x: number, y: number, width: number, height: number) {
        super(x, y)
        this.width = width;
        this.height = height;
    }
}

