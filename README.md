# ai-skill-hub

Plugin marketplace for AI skills.

## Plugins

| Plugin | Skill | Purpose |
|---|---|---|
| `doc-analysis` | `prd-analysis` | Rewrite a PRD in ASD-STE100 with confidence levels (Stage I). Propose a module breakdown (Stage II). |

## Install (Claude Code)

```
/plugin install doc-analysis --marketplace thepipeman/pipecrafts-ai-skill-hub
```

Requires the `asd-ste100` skill: `npx skills add danyuchn/asd-ste100-skill`.

## Use

- `/doc-analysis:prd-analyze <source> <output-folder>`
- `/doc-analysis:prd-breakdown <analysis-file>`

## Claude UI

Run `scripts/package.sh`. Upload `dist/doc-analysis.zip`. Upload `asd-ste100` as a skill ZIP too.
