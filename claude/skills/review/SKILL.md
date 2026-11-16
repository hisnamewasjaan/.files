---
name: review
description: Read-only code review of the current changes or a given branch, file or PR. Use when asked to review code, a diff or a pull request.
---

# Code Review

Review only. Do not edit files, commit or push unless asked afterwards.

## Process

1. Find what to review: the argument if given, else `git diff` and `git diff --staged`, else the
   branch against the default branch (`git diff <default>...HEAD`).
2. Read the changed files in full, not just the hunks, and the code they call or are called from.
3. Run the project's tests, linter and type-check when they are cheap, and include the result.

## What to look for, in priority order

1. **Correctness:** logic errors, off-by-one, null handling, race conditions, error paths, wrong
   assumptions about data.
2. **Security:** injection, missing authorization, secrets in code, unsafe deserialization, leaking
   data in logs or errors.
3. **Tests:** is the new behaviour covered, including edge cases and regressions? Are tests asserting
   behaviour rather than implementation?
4. **Design:** fits existing conventions, no needless new patterns, clear contracts, maintainable.
5. **Quality tooling:** formatting, linting, static analysis, dependency additions.
6. **Docs:** changed behaviour reflected in README or design docs.

## Output

Group findings as **Must fix**, **Should fix** and **Nit**. For each: `path:line`, the problem, why it
matters, and a concrete suggestion. Finish with a short overall verdict.
Only report issues you have verified in the code. Say when something is uncertain instead of guessing.
