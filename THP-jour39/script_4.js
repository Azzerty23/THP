const entrepreneurs = [
    { first: 'Steve', last: 'Jobs', year: 1955 },
    { first: 'Oprah', last: 'Winfrey', year: 1954 },
    { first: 'Bill', last: 'Gates', year: 1955 },
    { first: 'Sheryl', last: 'Sandberg', year: 1969 },
    { first: 'Mark', last: 'Zuckerberg', year: 1984 },
    { first: 'Beyonce', last: 'Knowles', year: 1981 },
    { first: 'Jeff', last: 'Bezos', year: 1964 },
    { first: 'Diane', last: 'Hendricks', year: 1947 },
    { first: 'Elon', last: 'Musk', year: 1971 },
    { first: 'Marissa', last: 'Mayer', year: 1975 },
    { first: 'Walt', last: 'Disney', year: 1901 },
    { first: 'Larry', last: 'Page', year: 1973 },
    { first: 'Jack', last: 'Dorsey', year: 1976 },
    { first: 'Evan', last: 'Spiegel', year: 1990 },
    { first: 'Brian', last: 'Chesky', year: 1981 },
    { first: 'Travis', last: 'Kalanick', year: 1976 },
    { first: 'Marc', last: 'Andreessen', year: 1971 },
    { first: 'Peter', last: 'Thiel', year: 1967 }
  ];

console.log("Filtre dans cette liste les entrepreneurs qui sont nés dans les années 70 : ");
var seventies = entrepreneurs.forEach(line => {
    (line.year >= 1970) & (line.year <1980) ? console.log(line) : false
});

console.log("Sors une array qui contient le prénom et le nom des entrepreneurs : " );
// var names = Array.new(entrepreneurs.forEach(line => {
//     (line.first)
// }));

const object = [
    { first: 'Steve', last: 'Jobs', year: 1955 },
    { first: 'Oprah', last: 'Winfrey', year: 1954 }
]

array = [`${object.first} ${object.last}`] 
console.log(array);


var array = []
entrepreneurs.forEach(line => {
    array.push(`${line.first} ${line.last}`)
    // array.push(line.first + ' ' + line.last)
});
console.log(array);

console.log("Quel âge aurait chaque inventeur aujourd'hui ? : ");
age = entrepreneurs
age.forEach(line => {
    line.age = 2019 - line.year
});
console.log(age);

console.log("Trie les entrepreneurs par ordre alphabétique du nom de famille. : ");
array = [1, 3 , 2 , 4]
// console.log(array.map(x => x*2));

// console.log(entrepreneurs.sort(entrepreneurs.map(x => x.last)));
console.log(entrepreneurs.map(x => x.last));

console.log(entrepreneurs.map(x => x.last).sort(function (a,b) {
    return a.localeCompare(b);
}));
