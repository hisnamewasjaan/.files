---
name: design-doc
description: Write a detailed design document in Markdown with PlantUML diagrams. Use when asked for a design doc, architecture doc, technical proposal or ADR.
---

# Design document

Write for a reader who was not in the conversation. Be practical and specific, not bloated.

## Process

1. Read the relevant code and existing docs first. Do not describe things you have not checked.
2. If a decision materially changes the design and the answer is not in the code or request, ask.
   Otherwise state the assumption in the document.
3. Put the file where the project keeps docs (`docs/`, `doc/adr/`), otherwise `docs/<topic>.md`.

## Structure

1. **Summary:** what and why, in a few sentences.
2. **Context and goals:** the problem, constraints, non-goals.
3. **Proposed design:** components, responsibilities, interfaces.
4. **Data flow:** how a request or event moves through the system.
5. **Data model:** entities and storage, if relevant.
6. **Dependencies:** services, libraries, infrastructure.
7. **Alternatives considered:** each with the trade-offs and why it was rejected. Recommend one.
8. **Risks and open questions.**
9. **Testing and rollout:** test strategy, migration, monitoring.

## Diagrams

- Use PlantUML in fenced `plantuml` blocks: component, sequence, and class or ER diagrams where they
  clarify. Keep each diagram small enough to read.
- If another format fits better (for example Mermaid because the host renders it natively), say so
  and use that.
- Validate the syntax if `plantuml` is installed (`plantuml -syntax`).

## Decisions

Record important decisions with the reason, so they can be revisited later (an ADR-style
"Decision / Status / Consequences" block works well).
