const { buildPattern, parsePositiveInteger } = require("./pattern");

const [character = "1", maxCountArg, roundsArg] = process.argv.slice(2);
const maxCount = parsePositiveInteger(maxCountArg, 4, "maxCount");
const rounds = parsePositiveInteger(roundsArg, 3, "rounds");

console.log(buildPattern(character, maxCount, rounds).join("\n"));
