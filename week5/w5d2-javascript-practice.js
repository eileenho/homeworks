//part 1

function madLib(verb, adjective, noun) {
  console.log(`We shall ${verb} the ${adjective} ${noun}`);
}

madLib("make", "best", "nachos");

function isSubstring(searchstring, substring) {
  let words = searchstring.split(" ");
  return words.includes(substring);
}

isSubstring("Jump for joy", "joys");

function fizzBuzz(array) {
  fizzed = [];
  array.forEach(function(el) {
    if (el % 3 === 0 && el % 5 === 0) {
      fizzed.concat([]);
    } else if (el % 3 === 0 || el % 5 === 0) {
      fizzed.push(el);
    }
  });

  return fizzed;
}

fizzBuzz([1, 2, 3, 4, 5, 10, 15, 16]);

function isPrime(num) {
  let count = 0;
  for (let i = 0; i < num; i++) {
    if (num % i === 0) {
      count++;
    }
  }
  if (count < 2 && num >= 2) {
    return true;
  } else {
    return false;
  }
}

function sumOfNPrimes(num) {
  primes = [];
  i = 0;
  while (primes.length < num) {
    if (isPrime(i)) {
      primes.push(i);
    }
    i++;
  }
  sum = 0;
  primes.forEach (function(num) {
    sum += num;
  });
  return sum;
}

function allOrNothing(mod, ...numbers) {
  let count = 0;
  numbers.forEach (function(number) {
    if (number % mod === 0) {
      count ++;
    }
  });
  if (count === numbers.length) {
    return true;
  } else {
    return false;
  }
}

//part 2

function titleize(names, callback) {
  let titleizedNames = names.map(function(name) {
    return `Mx. ${name} Jingle Bells`;
  });
  callback(titleizedNames);
}

function printCallback(names) {
  names.forEach(function(name) {
    console.log(name);
  });
}

//titleize(["Mary", "Brian", "Leo"], printCallback);

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!`);
};

Elephant.prototype.grow = function() {
  this.height = this.height + 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  let trickIndex = Math.floor((Math.random() * this.tricks.length));
  let trick = this.tricks[trickIndex];
  console.log(`${this.name} is ${trick}!`);
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.prototype.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

herd.forEach(elephant => {
  elephant.paradeHelper(elephant);
});

//phase IV

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
}
