var character = args.Length > 0 ? args[0] : "1";
var maxCount = ParsePositiveInt(args, 1, 4, "maxCount");
var rounds = ParsePositiveInt(args, 2, 3, "rounds");

foreach (var line in BuildPattern(character, maxCount, rounds))
{
    Console.WriteLine(line);
}

static int ParsePositiveInt(string[] args, int index, int defaultValue, string name)
{
    if (args.Length <= index)
    {
        return defaultValue;
    }

    if (!int.TryParse(args[index], out var value) || value < 1)
    {
        throw new ArgumentException($"{name} must be a positive integer.");
    }

    return value;
}

static IEnumerable<string> BuildPattern(string character, int maxCount, int rounds)
{
    if (string.IsNullOrWhiteSpace(character))
    {
        throw new ArgumentException("character must be a non-empty value.");
    }

    for (var round = 0; round < rounds; round += 1)
    {
        for (var count = 1; count <= maxCount; count += 1)
        {
            yield return string.Concat(Enumerable.Repeat(character, count));
        }

        for (var count = maxCount - 1; count >= 1; count -= 1)
        {
            yield return string.Concat(Enumerable.Repeat(character, count));
        }
    }
}
