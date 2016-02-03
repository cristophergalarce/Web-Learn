alert("funciona");

var nombre = "cristoph";
var apellido = "galarchenko";
var edad = 27;

// "\n" salto de línea
alert(nombre + " " + apellido + "\n" + edad + " " + "años.");

alert( 1 + 2 + "3");
// = 33
alert("3" + 2 + 1 );
// = 321
alert("3" + 2 * 1 );
// = 32
// principios basicos de matematica
/*
0.- ()
1.- *
2.- /
3.- +
4.- -
*/

var peso;

peso = prompt("¿Cuál es tu peso?");
peso = parseInt(peso);

// parseInt convierte strings en numbers
// sino, puede considerar el input como string y no hace operación matemática y concatena strings.

alert( peso + " " + "Kg." );

