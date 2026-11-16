---
name: vue-component
description: Create or extend a Vue 3 component with Composition API, TypeScript and a Vitest test. Use when asked to add, scaffold or refactor a Vue component or composable.
---

# Vue component

## Before writing

1. Read `package.json`, the nearest `tsconfig`, the ESLint/Prettier config and two or three existing
   components. Match their folder layout, naming and import style over these defaults.
2. Check whether a component or composable for this already exists. Prefer extending it.

## Conventions

- `<script setup lang="ts">`, Composition API only. No Options API, no `any`.
- Type props with `defineProps<{ ... }>()`, emits with `defineEmits<{ ... }>()`, defaults with
  `withDefaults`. Use `defineModel` for `v-model`.
- Keep components small and presentational. Move logic that is reused or testable on its own into
  a composable (`useThing.ts`) with explicit input and return types.
- Accessible markup first: semantic elements, labels, keyboard handling, `aria-*` where needed.
- Scoped styles or the project's existing styling approach. Do not add a new styling library.
- PascalCase file names, multi-word component names.

## Tests

- Vitest with `@vue/test-utils` next to the component (`Thing.spec.ts` or the project's pattern).
- Test behaviour and the public contract: rendered output, emitted events, slot content, edge cases.
  Do not test implementation details.
- Add a Playwright test only when the component is part of a user flow that is not covered yet.

## Finish

Run the project's lint, type-check (`vue-tsc`) and test scripts, and report the result. Do not
claim success without running them.
