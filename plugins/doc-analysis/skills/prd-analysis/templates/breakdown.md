# <PRD title>: breakdown (proposal)

Source: <Stage I file>. This is a proposal. Judgment calls have one alternative.

## 1. Breakdown, high-level

Boundary rule: <one line>.

| Module | Purpose | Requirements it owns |
|---|---|---|

| Judgment call | Alternative |
|---|---|

## 2. Holistic view

```mermaid
<diagram>
```

| From | To | What passes | Source |
|---|---|---|---|

Cross-cutting NFRs: <list of IDs and one-line titles>

## 3. Configuration and enablement

| Config item | Module | Type (switch, parameter, access) | Who sets it | Default | Source |
|---|---|---|---|---|---|

| Iteration | Phase or step | Modules | Prerequisites | Release control | Source |
|---|---|---|---|---|---|

| Config item | Start with (rung) | Why | Upgrade when |
|---|---|---|---|

## 4. Module detail

### <Module name>
**Purpose:** <one sentence>
**In scope:** <list>
**Out of scope:** <list>
**Owns:** <IDs>
**Uses:** <IDs in other modules>
**Inputs and outputs:** <list>
**Depends on:** <modules>
**Configuration:** <items. Mark PRD or [Inferred]. Add rung>
**Enablement:** <prerequisites and release>
**Caveats:** <list>
**Open questions:** <list>

## 5. Coverage check

FR and NFR total: N. Owned by one module: N. Not owned: <list or none>.
