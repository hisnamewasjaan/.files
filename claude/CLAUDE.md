# Claude Code Instructions

## General principles
* Prefer modern, stable versions unless I specify otherwise.
* When in doubt, ask.
* Prefer more than less: better to include useful tooling, validation, and documentation than to keep things minimal.
* Optimize for maintainability, clarity, and long-term quality over shortcuts.
* If there are multiple reasonable approaches, briefly explain the tradeoffs and recommend one.

## Frontend defaults
* Preferred frontend stack: Vue 3
* Node 26
* Use Composition API style by default
* Use TypeScript by default
* Use Playwright for end-to-end testing
* Prefer modern frontend tooling and patterns
* Write clear, componentized, and maintainable code

## Backend defaults
* Preferred backend stack: Spring Boot 4.1+
* Preferred Java version: 26+
* Use modern Java and Spring conventions
* Prefer strong typing, explicit contracts, and clean architecture where appropriate
* Use modern, stable backend tooling and libraries
* See "Code quality and linting" for tooling expectations

## Commit and git conventions
* Use Conventional Commits by default
* Use Husky for git hooks when appropriate
* Use commitlint to validate commit messages
* Prefer automated validation in the development workflow where it adds value

## Code quality and linting
* Use modern code quality and linting tools in both frontend and backend
* Include formatting, linting, static analysis, and dependency checks where appropriate
* SonarQube CLI (Recommended)
* Frontend (Vue/TypeScript): ESLint + Prettier by default
* Vue Mess Detector  https://github.com/rrd108/vue-mess-detector
* Snyk?
* CodeClimate?
* Backend (Java): Spotless for formatting, plus Checkstyle or PMD/SpotBugs for static analysis
* Consider code coverage as part of test strategy
* Prefer tools and configurations that improve consistency and reduce manual review burden
* Use JSpecify or similar nullness/typing improvements where appropriate

## Testing philosophy
* Test everything that is reasonably testable
* Prefer test-first development when it is possible and valuable
* Add unit tests, integration tests, and end-to-end tests where they provide real value
* Frontend unit tests: Vitest
* Backend unit/integration tests: JUnit 5, with Testcontainers for integration tests against real infrastructure (e.g. Postgres)
* Do not over-test trivial implementation details
* Focus tests on behavior, contracts, edge cases, and regressions
* If test strategy is unclear, propose a sensible default

## Documentation and design
* Make fairly detailed design docs in Markdown
* Use PlantUML for diagrams when useful
* If PlantUML is not the best fit, propose a better alternative
* Document architecture, data flow, dependencies, and important decisions
* Keep documentation practical and maintainable, not bloated

## Working style
* Prefer making reasonable assumptions and moving forward rather than blocking on minor uncertainties
* Ask clarifying questions when a decision materially affects the implementation
* Prefer editing existing code and conventions over introducing unnecessary new patterns
* Keep code readable and idiomatic for the chosen stack
* Be proactive about suggesting improvements when they materially help quality or maintainability
* If a local toolchain or runtime version is outdated or incompatible (e.g. Node, JDK), flag it and propose an upgrade — don't silently work around it, and don't change system-level tooling without asking first
