// Pyramide de Mario

var max = prompt("Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?");
for (level = 1; level <= max; level++) {
    console.log(` `.repeat(max-level) + `#`.repeat(level));
}
