# Mental model: how to read a PRD (Stage I)

Build the mental model in one pass. Write the result into sections 1 to 3 of the output.

## Working outline (build while you read)

Keep these lists in your working context. Do not re-read the source to build them.

| Item | Capture |
|---|---|
| Sections | Title, order, original ID |
| Requirements | Original ID, strength (must, should, may), actor, condition, number |
| Terms | Each term the PRD uses. Note if it is defined or not |
| Actors | Each person, role, or system that acts |
| Non-requirements | Background, metrics, timeline, dependencies, rollout, enablement |
| Conflicts | Two places that disagree |

## Questions the model must answer

1. What problem does the PRD solve, and for whom?
2. What is in scope? What is out of scope?
3. How is success measured?
4. Who acts, and what do they hand to each other?
5. Which terms need a definition?
6. Which statements are vague, open, or in conflict?

## Classify each statement

| Type | Where it goes |
|---|---|
| Functional requirement | Section 4, as FR |
| Quality, limit, or constraint | Section 4, as NFR |
| Configuration or release as a requirement ("an admin can set X") | Section 4, as FR or NFR |
| Rollout, enablement, phases, migration | Section 5, heading "Rollout and enablement" |
| Background, metrics, timeline, dependencies | Section 5 |
| Question, conflict, or inference | Section 6 |

## Rules

- Do not add a requirement the PRD does not state.
- Keep the source order unless the user asks for a new order.
- If you must infer, write it in section 6 as `[Inferred]`.
- Rate your own understanding, not the quality of the requirement.
- Do not fix ambiguity. Keep it, lower the confidence, and say why.

## Confidence checks

| Signal | Level |
|---|---|
| Specific, measurable, no open term | High |
| Missing limit, undefined term, unclear actor | Medium |
| Two readings, conflict, "fast", "easy", depends on an unknown | Low |

## Do not apply STE to

Code blocks, Mermaid syntax, requirement IDs, product names, system names.
