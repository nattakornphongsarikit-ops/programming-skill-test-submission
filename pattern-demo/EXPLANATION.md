# Question 3: Pattern Logic

## Logic

Input:

- `character`: the text to repeat
- `maxCount`: the maximum number of repeated characters
- `rounds`: how many times to repeat the full pattern

One round has two parts:

1. Increasing loop: print from `1` to `maxCount`
2. Decreasing loop: print from `maxCount - 1` back to `1`

The decreasing loop starts at `maxCount - 1` so the largest line is not duplicated.

## Interview explanation

I use an outer loop for the number of rounds.

Inside each round, I use one loop to increase the character count and one loop to decrease it.

The core idea is:

```js
for (let count = 1; count <= maxCount; count += 1) {
  lines.push(character.repeat(count));
}

for (let count = maxCount - 1; count >= 1; count -= 1) {
  lines.push(character.repeat(count));
}
```

For input `1, 4, 3`, each round is:

```text
1
11
111
1111
111
11
1
```

Then the program repeats that round 3 times.
