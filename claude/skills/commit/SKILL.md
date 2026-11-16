---
name: commit
description: Create a git commit that follows Conventional Commits. Use when the user asks to commit, "lav en commit", or to write a commit message for the current changes.
---

# Commit

Create a commit for the current changes using [Conventional Commits](https://www.conventionalcommits.org/).

## Steps

1. Inspect the state: `git status`, `git diff` (staged and unstaged), and `git log --oneline -15`.
2. Match the repository's existing style: scopes, language, casing. Reuse a scope from the log
   instead of inventing a new one.
3. Check the diff for secrets, tokens, private keys and machine-specific data. Stop and warn if found.
4. If the changes cover more than one logical change, propose splitting them into separate commits
   and stage each with explicit paths (`git add <file>`), one commit per logical change.
5. Write the message, commit, then show `git log -1 --stat`.

## Message format

```
<type>(<scope>): <summary>

<optional body: why, not what>

<optional footers>
```

- **Types:** `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.
- **Scope:** optional, lowercase, the area touched (`zsh`, `git`, `readme`, `api`, ...).
- **Summary:** imperative mood, lowercase, no trailing period, at most about 72 characters.
- **Body:** wrap at about 72 characters. Explain the reason for the change and anything non-obvious.
- **Breaking change:** add `!` after the type or scope and a `BREAKING CHANGE:` footer.
- Use the project's own `commit-msg` hook or commitlint config as the source of truth if it differs
  from the list above.

## Rules

- Never commit or push unless the user asked for it. Never push as part of this skill.
- Stage explicit paths. Avoid `git add -A` and `git add .` unless every change belongs in the commit.
- Never use `--no-verify` or skip signing. If a hook fails, fix the cause and create a new commit.
- Never amend or rewrite commits that are already pushed.
- End the message with any attribution lines the harness instructs.
