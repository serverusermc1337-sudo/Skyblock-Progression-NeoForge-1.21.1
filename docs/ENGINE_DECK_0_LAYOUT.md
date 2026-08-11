# Engine Deck 0 — exact starter layout

Build this in a creative test world, then export as structure for Haven / SBC / Sky Islands templates.

Coordinates are relative to structure origin `(0,0,0)` = southwest bottom corner of the deck airbox.

## Deck size

- Playable floor: **9 x 9**
- Thickness: **3 layers** (underhull / deck / low superstructure)
- Safe rim: full perimeter slab/wall so players do not walk off on minute one

## Materials (readable as machine, not nature)

Primary:
- `minecraft:smooth_stone`
- `minecraft:stone_bricks`
- `minecraft:iron_block` (sparse)
- `minecraft:copper_block` / cut copper (weathered OK)
- `minecraft:grindstone` / `minecraft:blastfurnace` as props if needed
- Create blocks when available: shaft, casing, cog, tank (decorative at spawn if Create is installed)

Avoid a pure dirt/grass cube. One planter box of dirt is enough for the first sapling.

## Layer Y=0 — underhull

Fill 9x9 with `minecraft:stone_bricks`.
Center 3x3 use `minecraft:iron_block` as structural spine.

## Layer Y=1 — main deck floor

| Local XZ | Block | Notes |
|----------|-------|-------|
| Full 9x9 | `smooth_stone` | Floor |
| Perimeter | `smooth_stone_slab` on top of floor edge OR `stone_brick_wall` | Rim |
| (4,4) center | `minecraft:lodestone` | **Levitation Core placeholder** |
| (4,3) | `minecraft:blast_furnace` | Dead fuel unit prop |
| (3,4) | `minecraft:barrel` | Scrap bin |
| (5,4) | `minecraft:chest` facing south | **Starter chest** |
| (4,5) | `minecraft:enchanting_table` optional NO | Skip |
| (2,2) | 2x2 `dirt` + air above | Planter |
| (2,2) above dirt | `oak_sapling` | Life support |
| (6,6) | `minecraft:crafting_table` | |
| (6,5) | `minecraft:oak_log` x2 stacked | Scrap beam |

## Layer Y=2 — low superstructure / readable machine bits

- Around core (4,4): four `minecraft:lightning_rod` or iron bars as "coils" at (3,4),(5,4),(4,3),(4,5) if they do not block movement too hard — prefer short walls of copper
- (4,4) above core: `minecraft:end_rod` downward/upright as inert antenna (optional)
- Corner posts at (1,1),(1,7),(7,1),(7,7): `minecraft:iron_bars` or stone brick walls

## Starter chest contents

Exact v0.1 list:

- 16 `minecraft:bread`
- 8 `minecraft:torch`
- 1 `minecraft:wooden_pickaxe`
- 1 `minecraft:wooden_axe`
- 16 `minecraft:cobblestone` (emergency rim only)
- 1 `minecraft:water_bucket` **locked behind quest fiction** — if too strong, replace with 2 ice + 1 lava bucket classic pair only after quest 4
- 1 `minecraft:writable_book` named `Deck Logbook` (or use quest book only)
- 4 `minecraft:bone_meal`

Recommended stricter start:
- No water bucket in chest
- Ice + lava unlocked by quest reward after Minimal Power

## Core placeholder behavior

Until custom block exists:
- Use `lodestone` as the core
- Quest "Inspect the Core" = stand on/near it (checkmark or location task)
- Later replace with custom block / Create special

## Export checklist

1. Build at y=100 in void test world for readability
2. Structure block: corner mode, include entities if chest is saved
3. Save as `engine_deck_0.nbt`
4. Drop into template folder of chosen island mod
5. Set player spawn offset standing on (4,2,2) facing the core

## Screenshot test

If a screenshot does not look like a wrecked machine platform, rebuild. If it looks like a cute cottage island, it fails identity.
