# ai-skill-hub

Plugin marketplace for AI skills. First plugin: `doc-analysis` (skill `prd-analysis`).

## Layout

- `.claude-plugin/marketplace.json`: marketplace `ai-skill-hub`. Lists every plugin.
- `plugins/<plugin>/`: one folder per plugin. `.claude-plugin/plugin.json`, `commands/`, `skills/`.
- `plugins/<plugin>/skills/<skill>/`: one folder per skill. `SKILL.md`, `references/`, `templates/`.
- `scripts/package.sh`: zips each plugin to `dist/` for upload in the Claude UI.
- `.claude/instructions/`: build plans.

## Rules

- `source` in `marketplace.json` is a path from the repo root, e.g. `./plugins/doc-analysis`. No `..`.
- The marketplace entry `name` equals `name` in `plugin.json`.
- Skills run namespaced: `/doc-analysis:prd-analysis`.
- A skill must not depend on files outside its own plugin folder.
- Add a plugin only when a real group of skills exists. No shared layers.
- `SKILL.md` stays short (120 lines or fewer). Detail goes in `references/` (150 or fewer each). Templates 80 or fewer. A reference loads only when its stage needs it.
- Run `claude plugin validate .` after every edit to a plugin or `marketplace.json`.

## Cost rules (every skill)

- No subagents by default. Use them only when the source is too large for one pass (over about 25,000 words). Max 4, same model.
- Load only the files the stage needs. Read the source once. Stage II reads the Stage I file.
- Write output once. Fix with small edits.
- Do not search the repo or the web for known paths.

## Skill dependency

`prd-analysis` needs the `asd-ste100` skill (github.com/danyuchn/asd-ste100-skill). It stops if the skill is missing.
