# Procedural wreck generation — Suspended Engine

Wrecks are the exploration layer of this pack. They must feel like **derelict engine-decks of the same tech language**, not random villages glued into the void.

## Goal

Generate many unique floating wrecks from a small set of hand-built pieces so every dock is familiar but not identical.

---

## What “procedural” should mean here

| Level | Meaning | Effort |
|-------|---------|--------|
| **L0 Pre-placed** | 5–15 fixed wreck templates at hand-picked coords | Lowest |
| **L1 Pool pick** | Worldgen picks 1 of N whole wreck NBTs per site | Low |
| **L2 Jigsaw modular** | Hull + bay + spar + crate pieces combine at runtime | Medium |
| **L3 Scripted events** | On demand spawn wreck near player when quest needs it | Medium |
| **L4 Full sim** | Damage simulation, partial collapse, live physics | Too much for v1 |

**Ship target:** L1 quickly, then L2. Use L3 for the *first* quest wreck so the tutorial never misses.

---

## Recommended stack for NeoForge 1.21.1

### A. Vanilla jigsaw structures (best long-term authenticity)

Use datapack worldgen:

1. Build modular `.nbt` pieces (structure blocks)
2. `template_pool` JSON weighted random pieces
3. `worldgen/structure` jigsaw definition
4. `structure_set` for spacing / salt / frequency
5. Absolute or uniform Y so wrecks float in void/sky

Reference implementation to study:
- TelepathicGrunt **StructureTutorialMod** (commented NeoForge jigsaw examples)
- Vanilla template pool format (`data/<ns>/worldgen/template_pool`)

**Why it fits Suspended Engine**
- Same system as villages/trail ruins → stable, locatable with `/locate`
- Processors can randomly decay blocks (crack copper, remove slabs, replace chests)
- Spacing controls density so the sky is not a junkyard

**Void/sky caveat**
- Heightmap projection often fails in pure void → prefer **absolute Y** ranges (e.g. 80–140)
- Disable or carefully control vanilla structures that pillar into void
- Test in the *actual* sky/void preset you ship

### B. Modpack-author structure placers (fastest iteration)

| Tool | Role |
|------|------|
| **Hxwi1Structures** (1.21.1 NeoForge) | Drop NBTs + GUI config: Y range, chance, min distance, rotations |
| **Structurify** | Control spacing / enable-disable / overlap rules |
| **Moog's Structure Lib + Soaring Structures** | Existing floating structure ecosystem; useful reference, not identity |
| **CommandStructures** | Dev tool to force-spawn jigsaw pools while testing |

Hxwi1-style workflow is ideal while designing art: build wreck → export NBT → register placement rule → fly around and tune density.

### C. Scripted / quest wrecks (tutorial guarantee)

For quest **Scan / Dock / Scavenge**:

- Place one guaranteed wreck when the player finishes Stable State
- Methods: structure block load, `/place template`, KubeJS structure API if available, or a tiny custom command mod
- Beacon particle line or Structure Compass targeted at that structure id

This prevents the worst skyblock failure: "the book says find a wreck" and the nearest one is 4000 blocks away in ungenerated chunks.

---

## Piece taxonomy (L2 jigsaw design)

Build pieces in the **same visual language as Engine Deck 0**:

### Mandatory pools
1. **hull_core** — broken spine + dead/damaged core prop
2. **deck_floor** — 5x5 / 7x7 / 9x9 floor variants
3. **rim_damage** — missing walls, tilted edges
4. **cargo_bay** — crate room with loot chest
5. **connector** — short bridge/spar jigsaw joints
6. **antenna** — beacon/spar vertical pieces

### Optional pools
- fuel_room, crew_nook, collapsed_stair, copper_vein_scar, empty_hanger

### Jigsaw rules
- Keep max depth small (2–4) so wrecks stay readable and cheap
- Rigid projection only (never terrain_matching in void)
- One loot chest max per small wreck; 2–3 for large
- Always include a clear **dock face** (flat edge player can bridge to)

---

## Processors = cheap procedural damage

Instead of 50 unique full wrecks, use processors:

- Randomly replace stone bricks with cracked / mossy
- Randomly delete 10–20% of non-structural blocks
- Chance to replace core with coal block / lodestone / copper bulb
- Chance to swap chest loot tables by wreck tier

This is the highest leverage "procedural" trick in vanilla worldgen.

---

## Spacing and tiers

| Tier | Spacing idea | Loot | Power fantasy |
|------|--------------|------|----------------|
| Scout hulk | near, common | plates, copper, coal | early feed |
| Cargo wreck | medium | iron, components | mid expand |
| War deck | rare | core fragments, rare parts | late systems |
| Bastion hulk | very rare | unique unlock | endgame |

Structure sets should enforce minimum separation so docking routes remain meaningful.

---

## Discovery systems (quest integration)

Players need a *signal*, not random flying.

Options:
1. **Structure Compass** mod pointed at `suspended_engine:scout_hulk`
2. Quest item "wreck beacon" that runs `/locate` equivalent or stores a scanned pos
3. Particle pillar above generated wrecks (datapack/marker entity)
4. Map item with structure icons if a map mod supports custom structures

First wreck should be **script-placed or guaranteed nearby**.
Later wrecks can be true worldgen locate targets.

---

## Suggested v1 pipeline

### Week 1
1. Hand-build 3 full wrecks in creative (scout / cargo / war)
2. Export NBTs
3. Place with Hxwi1Structures or datapack single-pool structures at absolute Y
4. Wire Structure Compass + first quest to scout tier

### Week 2
1. Break those wrecks into jigsaw pieces
2. Add decay processors
3. Create structure_set with sane spacing
4. Replace scripted first wreck only if density is proven reliable

### Do not do in v1
- 40 unique hand-built full maps
- Physics collapse simulation
- Depending on vanilla villages as "wrecks"
- Stacking Moog soaring + custom wrecks + random dungeon packs until identity dilutes

---

## Void world checklist

- [ ] Structures use absolute Y (or tested height provider)
- [ ] No heightmap-only placement
- [ ] `/locate structure` works for wreck ids
- [ ] Chests have custom loot tables (engine parts, not only vanilla dungeon loot)
- [ ] Dock edge is obvious
- [ ] First quest wreck cannot soft-lock
- [ ] Density feels sparse enough that fuel/stability still matters on the trip

---

## Fit to Suspended Engine fantasy

Procedural wrecks succeed when:

1. Player can say "that is a dead cousin of Deck 0"
2. Each dock risks a brownout on the way home
3. Loot advances the **engine**, not a generic RPG bag

If wrecks look like floating cottages, the pack identity breaks even if generation is technically procedural.
