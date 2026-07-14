function parsePositiveInteger(value, fallback, name) {
  if (value === undefined || value === "") {
    return fallback;
  }

  const parsed = Number.parseInt(value, 10);
  if (!Number.isInteger(parsed) || parsed < 1) {
    throw new Error(`${name} must be a positive integer.`);
  }

  return parsed;
}

function buildPattern(character, maxCount, rounds) {
  if (!character || !character.trim()) {
    throw new Error("character must be a non-empty value.");
  }

  const lines = [];

  for (let round = 0; round < rounds; round += 1) {
    for (let count = 1; count <= maxCount; count += 1) {
      lines.push(character.repeat(count));
    }

    for (let count = maxCount - 1; count >= 1; count -= 1) {
      lines.push(character.repeat(count));
    }
  }

  return lines;
}

if (typeof module !== "undefined") {
  module.exports = { buildPattern, parsePositiveInteger };
}
