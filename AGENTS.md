# AGENTS.md

## Purpose

This directory contains the source for `folio-theme`.

## Working Rules

- Maintain the specification and design documents.
- When implementation changes affect behavior, palette roles, face mappings, or operating assumptions, update `README.org` and `DESIGN.org` as needed.
- Do not use magic numbers or magic strings.
- Extract repeated or meaningful values into well-named variables or constants.

## Theme-specific Guidance

- Keep the theme centered on an off-white paper background, deep blue structural accents, and restrained red warning accents.
- Prefer role-based names such as `bg`, `fg`, `blue`, and `red-soft` over raw literal values in face definitions.
- When adding new face groups, preserve the current design principle:
  background carries warmth, blue carries structure, red carries exception.
