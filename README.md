# Skyblock Progression

**NeoForge 1.21.1** • Skyblock-focused progression pack with FTB Quests

## Honest scope

This is a **working foundation**, not a finished 800-mod kitchen sink.

A real skyblock pack with 800+ mods still requires:
- compatibility testing
- recipe balancing for void/island starts
- quest writing across the full progression
- performance tuning

What you get here is the correct architecture so you can build that pack properly.

## Primary testing method

**CurseForge App** — see `docs/CURSEFORGE_APP_TESTING.md`

1. Create NeoForge **1.21.1** instance
2. Allocate **10–16 GB** RAM
3. Install core mods from `docs/CORE_MODLIST.md`
4. Copy `config/ftbquests` into the instance
5. Launch → `/ftbquests editing_mode true`

## What this repo contains

- Packwiz skeleton (`pack.toml`, `index.toml`)
- Skyblock-oriented FTB Quests chapter design + starter chapters
- Core mod guidance for skyblock progression
- CurseForge export automation hooks
- Troubleshooting

## Practical order

1. Get a stable ~150–300 mod skyblock core running in CurseForge App
2. Build the quest book around void → resources → automation → endgame
3. Only then expand toward very large mod counts
4. Mirror the stable list into Packwiz and export

Chasing 800 mods before the island loop works is wasted effort.

## Docs

- `docs/CURSEFORGE_APP_TESTING.md`
- `docs/QUEST_TREE_DESIGN.md`
- `docs/CORE_MODLIST.md`
- `docs/EXPANDING_TO_800.md`
- `docs/AUTOMATED_EXPORT.md`
- `docs/TROUBLESHOOTING.md`
