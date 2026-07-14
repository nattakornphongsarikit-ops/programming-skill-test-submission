# .NET Programming Skill Test Submission

This folder contains the .NET version of the programming skill test submission.

## Projects

- `src/RegisterForm/RegisterForm.csproj`: ASP.NET Core Razor Pages responsive register form
- `src/PatternTool/PatternTool.csproj`: C# console app for the logical pattern question

## Requirements

- .NET 8 SDK or newer

## Run the register form

```bash
dotnet run --project src/RegisterForm/RegisterForm.csproj
```

Then open the URL shown by `dotnet run`, usually:

```text
https://localhost:5001/Register
```

## Run the pattern answer

```bash
dotnet run --project src/PatternTool/PatternTool.csproj -- 1 4 3
```

## SQL answers

The SQL files are in the root-level `answers/` folder:

- `answers/database_design.sql`
- `answers/cursor_loop.sql`
