---
name: prd-analysis
description: Analyze a PRD in two stages. Stage I rewrites the PRD in ASD-STE100 with a mental model and a confidence level per requirement. Stage II proposes a module breakdown with configuration and enablement. Use when the user asks to analyze, rewrite, or break down a PRD, product requirements doc, or Confluence spec.
---

# PRD analysis

Two stages. Run the stage the user asks for. "Analyze this PRD" means Stage I. "Break down" means Stage II.

## Prerequisite: asd-ste100

Check at the start of every run.

1. Look for the skill `asd-ste100` in the list of available skills.
2. If it is absent, look in `~/.claude/skills/asd-ste100/` and `.claude/skills/asd-ste100/`.
3. If it is not found, **stop**. Tell the user to install it, then run again:
   - `npx skills add danyuchn/asd-ste100-skill`
   - `git clone https://github.com/danyuchn/asd-ste100-skill ~/.claude/skills/asd-ste100`
4. In Claude chat: upload the `asd-ste100` skill as a ZIP in Customize > Skills.

Use its `SKILL.md` only. Do not read its other files.

- **Strict mode:** requirements, process steps, open questions.
- **STE-flavored mode:** summary, module descriptions.
- Do not apply STE to code blocks, Mermaid syntax, requirement IDs, or product and system names.
- STE fixes form, not meaning. Check meaning with the coverage matrix.
- At the end, run `scripts/ste-lint.py <output-file>` from the `asd-ste100` folder as a command. Do not read the script. Report the findings. A clean result does not prove the rewrite is correct.

## Hard rules

1. **Never change the source.** Read it only. Write only to the output folder.
2. **Use a folder the user names.** If none is named, ask. Do not guess. Do not write next to the source. In Claude chat, create the file in the session workspace and give it to the user as a file.
3. **Do not overwrite.** If the output file exists, add `-v2` (then `-v3`) and tell the user.
4. **No drift.** Cover every source requirement. Do not add, remove, merge, or split one without a note in the coverage matrix.
5. **Keep meaning.** Keep numbers, conditions, scope limits, and strength (must, should, may).
6. **Do not fix ambiguity.** Keep it. Lower the confidence. Say why.
7. **Write everything in ASD-STE100.**
8. **Be short.** Short sentences, tables, no filler.

## Cost rules

**Subagents: default is none.** Do all work in the main session.
Use subagents only if the source is over about 25,000 words, or the user says it is very large.
Then: split by top-level section. Give each subagent one chunk, a fixed ID range, and the template. Use at most 4. Use the session model. The main session merges results and builds the glossary, diagram, and coverage matrix.
No subagent for verification unless the user asks. State in the final report if you used subagents, and why.

**Load only what the stage needs.**

| Stage | Load | Do not load |
|---|---|---|
| I | this file, `references/mental-model.md`, `references/diagram-selection.md`, `templates/prd-analysis.md` | `references/breakdown-guide.md`, `templates/breakdown.md` |
| II | this file, `references/breakdown-guide.md`, `templates/breakdown.md` | `references/mental-model.md`, `templates/prd-analysis.md`, and `references/diagram-selection.md` unless the guide lacks a diagram rule you need |

- Read the source **once**. Build a working outline. Work from it. Re-read only the exact section for a Low-confidence item.
- Stage II reads the Stage I file, not the PRD.
- Confluence: fetch the page once. Keep it in context.
- Do not search the repo or the web.
- Write the output file once, section by section. Fix issues with small edits. Do not write a draft and rewrite it.

## Stage I: PRD Analysis

**Input:** a Confluence page, file, or pasted text, and an output folder.
Confluence: use a connected Atlassian tool if there is one. If not, ask the user to paste or export the page.
**Output:** `<folder>/<prd-slug>-analysis.md`, from `templates/prd-analysis.md`.

Steps:
1. Check the prerequisite. Get the folder.
2. Read the source once. Build the working outline (see `mental-model.md`).
3. Write sections 0 to 7 in template order. Choose the diagram with `diagram-selection.md`.
4. Build the coverage matrix while you write section 4.
5. Run the linter. Report.

Section 4 rules:
- Keep the original ID. If none, assign `FR-01...` and `NFR-01...` in source order. Record the mapping in the matrix.
- Start with the table `ID | Title | Confidence`. End it with counts of High, Medium, Low.
- Confidence rates how well **you understand** the requirement. Not its quality or importance.
  - **High:** one clear meaning, testable.
  - **Medium:** intent is clear, details or a term are missing.
  - **Low:** two readings, a conflict, or very vague.
- Medium and Low need `Why not High` and `Check in original`.
- Do not write inferences as requirements. Put them in section 6 as `[Inferred]`.
- Configuration and release statements: write as FR or NFR if the PRD states them as requirements. Otherwise put them in section 5 under "Rollout and enablement". Add none that the PRD does not state.

The matrix ends with: `Source requirements: N. Covered: N. Not covered: 0.` If not 0, list the items and tell the user.

## Stage II: Breakdown

**Input:** the Stage I file. If the user gives only the PRD, run Stage I first and say so.
**Output:** `<folder>/<prd-slug>-breakdown.md` in the same folder, from `templates/breakdown.md`.
Follow `references/breakdown-guide.md`.

## Final report

Say: output path, counts (High, Medium, Low, or modules), linter result, any version suffix, whether subagents ran.
