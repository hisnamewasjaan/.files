---
name: adr
description: Write an Architecture Decision Record in MADR format. Use when asked to record, document or propose an architectural or technical decision, or to create or supersede an ADR.
---

# ADR (MADR)

Write one Architecture Decision Record per decision, using [MADR](https://adr.github.io/madr/) (Markdown Architectural Decision Records).

## Process

1. **Find the ADR folder.** Look for `docs/decisions/`, `docs/adr/`, `doc/adr/` or `adr/`. Use the
   existing one and its numbering and template. If none exists, create `docs/decisions/`.
2. **Read existing ADRs** (titles and statuses) so the new one is consistent and does not repeat or
   contradict an accepted decision. If it replaces one, plan to supersede it.
3. **Gather the facts from the code and the request.** If the problem, the options or the decision
   itself is unclear and matters, ask. Never invent options, drivers or consequences.
4. **Pick the next number:** highest existing number + 1, zero-padded to four digits.
5. **File name:** `NNNN-title-with-dashes.md`, lowercase, the title in the present tense and
   imperative ("use-postgresql-for-persistence").
6. Write the ADR, then show the path and a short summary.

## Template (MADR 4)

```markdown
---
status: "proposed"
date: YYYY-MM-DD
decision-makers: <names or roles>
consulted: <optional>
informed: <optional>
---

# <Short title that states the problem and chosen solution>

## Context and Problem Statement

<2-3 sentences or a question: what must be decided and why now.>

## Decision Drivers

* <driver, for example a requirement, constraint or quality attribute>

## Considered Options

* <option 1>
* <option 2>
* <option 3>

## Decision Outcome

Chosen option: "<option>", because <justification: which drivers it satisfies and how it compares>.

### Consequences

* Good, because <positive consequence>
* Bad, because <negative consequence, cost or risk>

### Confirmation

<How compliance is verified: review, test, ArchUnit rule, lint rule, fitness function. Optional.>

## Pros and Cons of the Options

### <option 1>

* Good, because <argument>
* Neutral, because <argument>
* Bad, because <argument>

### <option 2>

* Good, because <argument>
* Bad, because <argument>

## More Information

<Links to design docs, issues, benchmarks, related ADRs. When the decision should be revisited.>
```

## Rules

- **Status** is one of `proposed`, `accepted`, `rejected`, `deprecated` or `superseded by ADR-NNNN`.
  New ADRs start as `proposed`, unless the user says the decision is already made.
- ADRs are an immutable log. Do not rewrite an accepted ADR to change the decision. Write a new ADR
  and set the old one's status to `superseded by ADR-NNNN` (only that line changes, plus a link).
- Include at least two real options, one of which may be "do nothing" or the status quo.
- Keep it short. One decision per ADR, written so that someone new can understand it in a few minutes.
- Use today's date from the environment for `date`. Do not guess it.
- For a larger design with many parts, use the `design-doc` skill and link the ADRs from it.
- If the folder has an index or README listing ADRs, add the new one to it.
