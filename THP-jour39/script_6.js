function arn (value) {
    let name = value;
    switch (name) {
      case ('UCU') || ('UCC') || ('UCA') || ('UCG') || ('AGU') || ('AGC'):
        name = 'Sérine';
        break;
      case 'CCU':
      case 'CCC':
      case 'CCA':
      case 'CCG':
        name = 'Proline';
        break;
      case 'UUA':
      case 'UUG':
        name = 'Leucine';
        break;
      case 'UUU':
      case 'UUC':
        name = 'Phénylalanine'
        break;
      case 'CGU':
      case 'CGC':
      case 'CGG':
      case 'AGA':
      case 'AGG':
        name = 'Arginine'
        break;
      case 'UAU':
      case 'UAC':
        name = 'Tyrosine'
        break;
      default:
        name = "Error ?"
        break;
    }
  }

function test (value) {
    var answer;
    switch (value) {
        case 'x':
            answer = 'yes';
            break;
        case 'o':
            answer = 'no';
            break;
        default:
            answer = 'whatever'
    }
}

console.log(test('no'));



function myFunction(value) {
    console.log(value);
    
    var day;
    switch (value) {
      case 0:
        day = "Sunday";
        break;
      case 1:
        day = "Monday";
        break;
      case 2:
        day = "Tuesday";
        break;
      case 3:
        day = "Wednesday";
        break;
      case 4:
        day = "Thursday";
        break;
      case 5:
        day = "Friday";
        break;
      case  6:
        day = "Saturday";
        break;
      default:
        day = "Unknown Day";
    }
  }

  console.log(myFunction(4));
  



// ###############################################




// str = "CCGUCGUUGCGCUACAGC"
// str = "CCUCGCCGGUACUUCUCG"

str = ['UCU']
// console.log(str.match(/.{1,3}/g));
// list_arn = str.match(/.{1,3}/g)
str.forEach(value => {
    console.log(value);
    
    console.log(arn(value));
});

x = arn('CCU');
console.log(x);
