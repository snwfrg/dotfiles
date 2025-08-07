# Git Command

You are tasked with staging changes, creating a conventional commit, and pushing to origin main. Follow these steps automatically without asking for permission:

## Commit Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that don't affect code meaning (white-space, formatting, etc)
- **refactor**: Code change that neither fixes a bug nor adds a feature
- **perf**: Performance improvements
- **test**: Adding or correcting tests
- **build**: Changes to build system or dependencies
- **ci**: Changes to CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit

## Process

1. **Check Status**: Run `git status` to see what changes exist
2. **Stage Changes**: Run `git add .` to stage all changes
3. **Analyze Changes**: Run `git diff --staged` to understand what's being committed
4. **Determine Commit Type**: Based on the staged changes, determine the appropriate commit type from the list above
5. **Create Commit Message**: Format the message following conventional commit format
6. **Commit**: Run `git commit -m` with the formatted message
7. **Push**: Run `git push origin main`

## Commit Message Format

The commit message should follow this format:
```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

- **type**: One of the commit types listed above
- **scope**: Optional, indicates what part of codebase (e.g., auth, ui, api)
- **description**: Brief description of the change in present tense
- **body**: Optional, more detailed explanation if needed
- **footer**: Optional, for breaking changes or issue references

## Analysis Guidelines

When determining commit type:
- Look at file paths and extensions to understand scope
- Examine the nature of changes (new files, modifications, deletions)
- Consider the impact: new functionality, bug fixes, refactoring, etc.
- Use most specific type that applies
- Include scope when it helps clarify the change area

## Examples

- `feat(auth): add Google OAuth integration`
- `fix(recipe): resolve ingredient parsing error`
- `docs: update API documentation`
- `refactor(components): extract common button styles`
- `test(recipes): add unit tests for recipe service`

---

**Input**: {{ARGS}}

Analyze the input (if provided) along with the current git changes, then execute the complete git workflow automatically: stage → commit with conventional message → push to origin main.