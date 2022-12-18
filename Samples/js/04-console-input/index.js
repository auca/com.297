// Run this file with Node.js on a Unix system (auca.space)

const input = require('fs').readFileSync('/dev/stdin', 'utf8'); // type, then press CTRL+D to feed input to the program
const lines = input.split('\n');

const a = parseInt(lines[0]); // '42.5' -> 42.0
const b = parseInt(lines[1]);
const sum = a + b;

console.log(`${a} + ${b} = ${sum}`);