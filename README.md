# ai-skill-hub

Plugin marketplace for AI skills.

## Plugins

| Plugin | Skill | Purpose |
|---|---|---|
| `doc-analysis` | `prd-analysis` | Rewrite a PRD in ASD-STE100 with confidence levels (Stage I). Propose a module breakdown (Stage II). |

## Quick start (Claude Code)

```bash
claude plugin marketplace add thepipeman/pipecrafts-ai-skill-hub
claude plugin install doc-analysis@ai-skill-hub
```

Then run `/doc-analysis:prd-analyze <source> <output-folder>`.
Requires the `asd-ste100` skill: `npx skills add danyuchn/asd-ste100-skill`.

## Claude chat

Run `scripts/package.sh`. Upload `dist/doc-analysis.zip`. Upload `asd-ste100` as a skill ZIP too.

Full instructions for both: [plugins/doc-analysis/README.md](plugins/doc-analysis/README.md).
