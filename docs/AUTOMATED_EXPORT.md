# CurseForge export

## Local

```bash
packwiz refresh
packwiz curseforge export -o exports/SkyblockProgression-curseforge.zip
```

Or:

```bash
./scripts/export-curseforge.sh
```

Import the zip in CurseForge App as a custom profile.

## GitHub Actions

Workflow: `.github/workflows/export-curseforge.yml`

- Manual dispatch from Actions tab
- Or push a tag `v*`

## Prerequisite

Export is only useful after mods exist in Packwiz metadata (`mods/*.pw.toml`).
Develop in CurseForge App first, mirror later.
