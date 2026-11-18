# Breakdown guide (Stage II)

Read the Stage I file. Do not read the original PRD.

## Boundaries

- Draw boundaries from the PRD: business function, actor, or data owner.
- Do not choose technology. Do not invent architecture.
- Each FR and NFR has one owner module. Other modules can use it.
- Put NFRs that apply to all modules in a cross-cutting list.
- Label the breakdown as a **proposal**. Name each judgment call. Give one alternative for each.
- Mark any link not in the PRD as `[Inferred]`.
- Keep the IDs from the Stage I file.
- Write all text in ASD-STE100. Use the Mermaid rules in `diagram-selection.md` if needed: one type, 15 nodes or fewer, short labels.

## Module diagram

Draw one diagram of how modules connect. Add the table `From | To | What passes | Source`. Then list the cross-cutting NFRs.

## Configuration and enablement

Look in the Stage I file (FRs, NFRs, and "Rollout and enablement") for:

- **Switches:** feature flags, on/off by customer, segment, region, environment.
- **Parameters:** limits, thresholds, rates, time windows, defaults, admin-editable text and rules.
- **Access:** roles, permissions, entitlements.
- **Prerequisites:** data to load, partner setup, approvals, teams that must deliver first.
- **Release:** phases, pilots, order, migration, rollback, training, support.

Write three tables (see `templates/breakdown.md`).

Rules:

- Write "Not stated" where the PRD is silent. Do not invent values.
- Do not name products or vendors unless the PRD names them.
- Mark inferred items `[Inferred]`. Put each inferred or missing item in the owner module's Open questions.
- Put items that apply to all modules in section 3, not in each module.

## Start simple: the rungs

Choose the lowest rung that meets the PRD.

| Rung | Approach | Use when |
|---|---|---|
| 1 | Fixed in code (constant, enum) | Value is stable. No change without a release is needed |
| 2 | Seeded data (seeder or migration) | Values are data. They change rarely. A release or script changes them |
| 3 | Deploy-time setting (property or environment value) | Value differs by environment. Operations change it without code |
| 4 | Admin-editable (screen or API, with audit) | PRD requires non-engineers to change it at runtime, or it changes often |

- If the PRD needs a higher rung, use that rung.
- Give one alternative and an upgrade trigger for each item.
- Keep one access point for each module's config. State this as a constraint. Do not design it.

## Iterations

- Iteration 1 is the thinnest end-to-end slice. It gives one working user outcome.
- Put admin screens, per-customer config, and reporting later, unless the PRD requires them.
- Do not defer a requirement silently. If a Must requirement moves later, or a lower rung meets it, add an open question for the PRD owner.
- Scope does not change. Only order and method change.
- If the PRD gives no phases, propose an order by dependency. Mark it `[Inferred]`.

## Module block

Every module has Configuration, Enablement, Caveats, and Open questions. If the PRD is silent, write "Not stated in the PRD" and add an open question. Search for real caveats before you write "None identified". Typical caveats: Medium or Low confidence items, unclear boundary, unknown limit, outside dependency.
