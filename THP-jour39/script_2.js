// Factorielle

var n = prompt("De quel nombre veux-tu calculer la factorielle ?");
console.log(n);

// function fact(n){
//     return n>1 ? n*fact(n-1) : 1;
// }

function fact(n) {
    let result = n;
    for (n-= 1; n>0; n--) {
        result *= n;
    }
    return result;
}

console.log(`Le résultat est : ${fact(n)}`);