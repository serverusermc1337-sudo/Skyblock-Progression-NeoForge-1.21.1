# CurseForge App testing — Skyblock Progression

## Create the instance

1. CurseForge App → Create custom profile
2. Minecraft **1.21.1**
3. Modloader **NeoForge**
4. Name: `Skyblock Progression - Dev`
5. RAM: **10–16 GB**

## Install order

### 1. Essentials
- FTB Library
- FTB Quests
- FTB Teams (optional)
- FTB XMod Compat
- Architectury API
- JEI or EMI

### 2. Skyblock core resource generation
Install whatever NeoForge 1.21.1 skyblock resource chain you choose, for example:
- Ex Nihilo-style sieving / cobble gen / barrel chain (verify current 1.21.1 ports)
- Resource generation / void mods available for NeoForge 1.21.1
- Mob farms / crusher / sieve equivalents that actually have 1.21.1 builds

**Important:** Always verify each mod has a NeoForge 1.21.1 file before installing.

### 3. Progression pillars
- Storage: Sophisticated Backpacks / Functional Storage / AE2 or RS later
- Farming: Farmer's Delight + crop/automation helpers
- Magic optional branch: Ars Nouveau or Iron's Spells if you want a magic path off-island
- Tech branch: Create and/or Mekanism / Oritech for automation from limited resources

### 4. QoL + performance
- Embeddium or equivalent
- FerriteCore
- ModernFix
- Jade
- AppleSkin
- Mouse Tweaks

## Load quests

Copy this repo's `config/ftbquests` folder into:

```
<instance>/minecraft/config/ftbquests
```

Launch, then:

```
/ftbquests editing_mode true
```

## Skyblock world note

This skeleton does **not** ship a custom skyblock map. For testing:

- Use a skyblock worldgen/map mod if available for 1.21.1, **or**
- Superflat void + starter platform datapack/mod, **or**
- Manual void world for quest logic testing

Quest logic can be developed even before the final island map is chosen.
