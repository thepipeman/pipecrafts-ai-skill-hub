# doc-analysis

Analyze a PRD in two stages. The plugin holds one skill, `prd-analysis`.

| Stage | Result | File |
|---|---|---|
| I. PRD Analysis | PRD rewritten in ASD-STE100. Mental model. Confidence level on each requirement. Coverage matrix. | `<prd-slug>-analysis.md` |
| II. Breakdown | Proposed modules, how they connect, configuration and enablement. | `<prd-slug>-breakdown.md` |

Stage II reads the Stage I file. It does not read the PRD again.

## Prerequisite: asd-ste100

The skill needs `asd-ste100`. It stops if the skill is missing.

```bash
npx skills add danyuchn/asd-ste100-skill
```

## Use in Claude Code

### Install

```bash
claude plugin marketplace add thepipeman/pipecrafts-ai-skill-hub
claude plugin install doc-analysis@ai-skill-hub
```

For a local clone, use the clone path in place of `thepipeman/pipecrafts-ai-skill-hub`.

### Commands

| Command | Does |
|---|---|
| `/doc-analysis:prd-analyze <source> <output-folder>` | Stage I |
| `/doc-analysis:prd-breakdown <analysis-file>` | Stage II |

`<source>` is a file path, a Confluence page, or pasted text.
If you give no output folder, the skill asks for one. It never writes next to the source.

Example:

```
/doc-analysis:prd-analyze ./prds/checkout.md ./analysis
/doc-analysis:prd-breakdown ./analysis/checkout-analysis.md
```

### Plain requests

The skill also starts from plain requests, with no command:

- "Analyze this PRD and write the result in ./analysis."
- "Break down ./analysis/checkout-analysis.md into modules."

### Confluence

If an Atlassian tool is connected, the skill reads the page through it. If not, paste or export the page.

## Use in Claude chat

Claude chat has no slash commands for this plugin. The chat starts the skill when your request matches the skill description.

### Install

1. Run `scripts/package.sh` in the repo. It creates `dist/doc-analysis.zip`.
2. Upload `dist/doc-analysis.zip` in the Claude UI where you manage plugins.
3. Upload `asd-ste100` as a skill ZIP in Customize > Skills. The ZIP root must be the skill folder.

The ZIP layout is not fully confirmed. If the upload fails, check the "Use plugins in Claude" support page.

### What triggers the skill

The chat matches your words to the skill description. Name the PRD and the stage:

| Say | Runs |
|---|---|
| "Analyze this PRD" | Stage I |
| "Rewrite this PRD in ASD-STE100 with confidence levels" | Stage I |
| "Break down this PRD into modules" | Stage II |
| "Break down" with the Stage I file attached | Stage II |

Attach the PRD as a file, or paste the text.
If the skill does not start, name it: "Use the prd-analysis skill to analyze this PRD."

### Differences from Claude Code

- **Output folder:** chat has no folder access. The skill creates the file in the session workspace and gives it to you as a file.
- **Linter:** the `ste-lint.py` check needs a shell. It can fail to run in chat. The report then says so.
- **Confluence:** paste or export the page, unless a connector is attached.
- **Stage II:** attach the Stage I file from the earlier run. If you give only the PRD, the skill runs Stage I first.

## Rules the skill follows

- It never changes the source.
- It never overwrites. If the file exists, it adds `-v2`.
- It keeps every requirement. The coverage matrix proves it.
- It does not fix ambiguity. It lowers the confidence and says why.
- It uses no subagents unless the PRD is over about 25,000 words.
