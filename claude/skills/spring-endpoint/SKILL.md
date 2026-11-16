---
name: spring-endpoint
description: Add or change a Spring Boot REST endpoint with typed contracts, validation, JUnit 5 tests and Testcontainers. Use when asked to add an API endpoint, controller, service or repository in a Spring Boot project.
---

# Spring Boot endpoint

## Before writing

1. Read `pom.xml` or `build.gradle*`, the application config, and one existing controller, service and
   test. Match package structure, naming and error handling. Check the Spring Boot and Java versions.
2. Do not change the build tool or upgrade dependencies without asking.

## Conventions

- Layers: controller (HTTP only) -> service (logic, transactions) -> repository.
- Request and response types are Java `record`s. Never expose JPA entities in the API.
- Validate input with Jakarta Bean Validation (`@Valid`, `@NotBlank`, ...). Return errors as RFC 9457
  `ProblemDetail` via a `@RestControllerAdvice`, consistent with what the project already does.
- Use constructor injection, no field injection. Prefer immutability.
- Mark nullability explicitly (JSpecify `@Nullable`, `@NullMarked`) when the project uses it.
- Correct status codes: `201` with `Location` for creation, `204` for empty responses, `404`/`409`/`422`
  where they fit.
- Database changes go through migrations (Flyway or Liquibase, whichever the project uses).

## Tests

- Unit tests (JUnit 5, Mockito or fakes) for service logic.
- `@WebMvcTest` or `MockMvc` for the controller contract: status, body, validation errors.
- Integration tests against real infrastructure with Testcontainers (for example PostgreSQL) instead
  of H2. Reuse the project's container setup (`@ServiceConnection`) if it exists.
- Cover edge cases and regressions, not getters and trivial mapping.

## Finish

Run formatting (Spotless) and the tests (`./mvnw verify` or `./gradlew check`) and report the result.
