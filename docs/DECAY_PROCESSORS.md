# Decay processor techniques — Suspended Engine

Processors are the cheapest way to make one wreck NBT look like many different derelicts.

Path: `data/<namespace>/worldgen/processor_list/<name>.json`  
Referenced from template pool elements via `"processors": "namespace:name"`.

Official reference: [Processor list — Minecraft Wiki](https://minecraft.wiki/w/Processor_list)

---

## Processor toolkit (what each one is for)

| Type | Effect | Use for wrecks |
|------|--------|----------------|
| **`rule`** | Conditional block replace | Main tool: crack, oxidize, strip, swap loot |
| **`block_rot`** | Randomly *skip* placing blocks | Holes, missing plating, chewed rim |
| **`block_age`** | Vanilla stone/portal aging | Fast stone-brick decay (ruined-portal style) |
| **`block_ignore`** | Never place listed blocks | Strip markers / scaffold blocks from template |
| **`capped`** | Limit how many times a nested processor runs | "Only 3 chests become rare" style effects |
| **`blackstone_replace`** | Stone → blackstone family | Nether-flavored wreck tier |
| **`gravity`** | Snap columns to heightmap | **Avoid in pure void** |
| **`protected_blocks`** | Do not overwrite world blocks | Rarely needed in void |
| **`jigsaw_replacement`** | Clears jigsaws to final state | Automatic in normal gen |

---

## Technique 1 — `block_rot` (missing hull plates)

Despite the name, this is **decay integrity**, not rotation.

```json
{
  "processor_type": "minecraft:block_rot",
  "integrity": 0.85,
  "rottable_blocks": [
    "minecraft:stone_bricks",
    "minecraft:smooth_stone",
    "minecraft:copper_block",
    "minecraft:cut_copper",
    "minecraft:iron_bars"
  ]
}
```

- `integrity: 0.85` → ~15% of listed blocks are **not placed**
- Unlisted blocks (core, chests, lodestone) always place
- In void, skipped blocks become empty air holes → reads as battle damage

**Tier tips**
- Scout wreck: `0.90–0.95`
- War wreck: `0.70–0.80`
- Never rot the dock-face blocks if players must bridge there

---

## Technique 2 — `block_age` (instant ruined look)

Vanilla ruined-portal aging for stone families:

```json
{
  "processor_type": "minecraft:block_age",
  "mossiness": 0.3
}
```

Affects stone / stone bricks / stairs / slabs / walls / some obsidian → cracked/mossy variants.

Good as a **first pass** on stone-heavy decks. Not enough alone for industrial copper/iron identity.

---

## Technique 3 — `rule` + `random_block_match` (controlled swaps)

This is the workhorse.

```json
{
  "processor_type": "minecraft:rule",
  "rules": [
    {
      "location_predicate": { "predicate_type": "minecraft:always_true" },
      "input_predicate": {
        "predicate_type": "minecraft:random_block_match",
        "block": "minecraft:stone_bricks",
        "probability": 0.25
      },
      "output_state": { "Name": "minecraft:cracked_stone_bricks" }
    },
    {
      "location_predicate": { "predicate_type": "minecraft:always_true" },
      "input_predicate": {
        "predicate_type": "minecraft:random_block_match",
        "block": "minecraft:stone_bricks",
        "probability": 0.1
      },
      "output_state": { "Name": "minecraft:mossy_stone_bricks" }
    },
    {
      "location_predicate": { "predicate_type": "minecraft:always_true" },
      "input_predicate": {
        "predicate_type": "minecraft:random_block_match",
        "block": "minecraft:copper_block",
        "probability": 0.35
      },
      "output_state": { "Name": "minecraft:exposed_copper" }
    },
    {
      "location_predicate": { "predicate_type": "minecraft:always_true" },
      "input_predicate": {
        "predicate_type": "minecraft:random_block_match",
        "block": "minecraft:copper_block",
        "probability": 0.2
      },
      "output_state": { "Name": "minecraft:weathered_copper" }
    },
    {
      "location_predicate": { "predicate_type": "minecraft:always_true" },
      "input_predicate": {
        "predicate_type": "minecraft:random_block_match",
        "block": "minecraft:copper_block",
        "probability": 0.1
      },
      "output_state": { "Name": "minecraft:oxidized_copper" }
    }
  ]
}
```

**Rule order matters.** First matching rule wins per block.

For copper oxidation stages, put rarer/more-oxidized rules carefully so probabilities stack the way you intend (often easier to run separate passes or use exclusive probabilities that sum sensibly).

---

## Technique 4 — structural strip (air holes that still "exist")

If you want missing plates but still control *which* blocks can vanish:

```json
{
  "location_predicate": { "predicate_type": "minecraft:always_true" },
  "input_predicate": {
    "predicate_type": "minecraft:random_block_match",
    "block": "minecraft:smooth_stone",
    "probability": 0.12
  },
  "output_state": { "Name": "minecraft:air" }
}
```

Difference vs `block_rot`:
- `rule` → air forces empty space
- `block_rot` → keeps whatever was in the world (void air anyway in skyblock)

Both work in void; `block_rot` with `rottable_blocks` is cleaner for "only plating decays."

---

## Technique 5 — core state randomization

Keep one core marker in the NBT (e.g. always `lodestone`), then:

```json
{
  "location_predicate": { "predicate_type": "minecraft:always_true" },
  "input_predicate": {
    "predicate_type": "minecraft:random_block_match",
    "block": "minecraft:lodestone",
    "probability": 0.4
  },
  "output_state": { "Name": "minecraft:coal_block" }
}
```

Other outputs: `copper_bulb`, `redstone_block`, `obsidian`, `crying_obsidian` for dead-core variants.

---

## Technique 6 — `capped` (rare events only N times)

Use when you want "exactly a few" special replacements, not a percentage of every matching block.

```json
{
  "processor_type": "minecraft:capped",
  "limit": 2,
  "delegate": {
    "processor_type": "minecraft:rule",
    "rules": [
      {
        "location_predicate": { "predicate_type": "minecraft:always_true" },
        "input_predicate": {
          "predicate_type": "minecraft:block_match",
          "block": "minecraft:chest"
        },
        "output_state": { "Name": "minecraft:barrel" }
      }
    ]
  }
}
```

(Field names may be `limit`/`value` depending on exact version docs — verify against wiki for 1.21.1.)

---

## Technique 7 — loot via block entity modifier

Rules can attach loot when replacing/keeping chests:

```json
"block_entity_modifier": {
  "type": "minecraft:append_loot",
  "loot_table": "suspended_engine:chests/scout_wreck"
}
```

Or `clear` / `passthrough` / `append_static` depending on needs.

This is how different wreck tiers share one chest block but roll different salvage tables.

---

## Technique 8 — position-based decay (edges worse than core)

`position_predicate` can use linear distance from structure start so outer rim decays more than the spine:

- `linear_pos` / `axis_aligned_linear_pos`
- Higher replace chance far from center

Use this so the **dock face near the core stays intact** while outer plating shreds.

---

## Recommended processor stacks by wreck tier

### Scout hulk (light damage)
1. `block_age` mossiness 0.15
2. `rule` 15% stone_bricks → cracked
3. `rule` 20% copper_block → exposed_copper
4. `block_rot` integrity 0.92 on plating only

### Cargo wreck (medium)
1. `block_age` 0.25
2. stronger crack/moss rules
3. copper → exposed/weathered mix
4. `block_rot` integrity 0.85
5. chest loot table: cargo tier

### War deck (heavy)
1. heavy `block_rot` 0.75 on non-structural
2. many air-strip rules on smooth_stone
3. core often dead (coal/obsidian)
4. blackstone_replace optional for "burned" variant pool entry
5. rare loot table

---

## Full example list (scout)

`data/suspended_engine/worldgen/processor_list/scout_decay.json`

```json
{
  "processors": [
    {
      "processor_type": "minecraft:block_age",
      "mossiness": 0.2
    },
    {
      "processor_type": "minecraft:block_rot",
      "integrity": 0.9,
      "rottable_blocks": [
        "minecraft:smooth_stone",
        "minecraft:stone_bricks",
        "minecraft:cut_copper",
        "minecraft:iron_bars"
      ]
    },
    {
      "processor_type": "minecraft:rule",
      "rules": [
        {
          "location_predicate": { "predicate_type": "minecraft:always_true" },
          "input_predicate": {
            "predicate_type": "minecraft:random_block_match",
            "block": "minecraft:stone_bricks",
            "probability": 0.2
          },
          "output_state": { "Name": "minecraft:cracked_stone_bricks" }
        },
        {
          "location_predicate": { "predicate_type": "minecraft:always_true" },
          "input_predicate": {
            "predicate_type": "minecraft:random_block_match",
            "block": "minecraft:copper_block",
            "probability": 0.3
          },
          "output_state": { "Name": "minecraft:exposed_copper" }
        },
        {
          "location_predicate": { "predicate_type": "minecraft:always_true" },
          "input_predicate": {
            "predicate_type": "minecraft:random_block_match",
            "block": "minecraft:copper_block",
            "probability": 0.15
          },
          "output_state": { "Name": "minecraft:weathered_copper" }
        }
      ]
    }
  ]
}
```

Wire in template pool:

```json
"element": {
  "element_type": "minecraft:single_pool_element",
  "location": "suspended_engine:wrecks/scout_hull",
  "processors": "suspended_engine:scout_decay",
  "projection": "rigid"
}
```

---

## Build rules for templates that decay well

1. Build **clean** master NBT (no pre-cracked spam)
2. Mark structural spine with blocks you will **not** list in `rottable_blocks`
3. Put copper as `copper_block` / `cut_copper` so oxidation rules can target them
4. Keep chests/cores as stable IDs for loot + quest checks
5. Use structure void only where you truly want world passthrough

---

## Testing workflow

1. `/place template` or CommandStructures spawn with processors enabled
2. Spawn same NBT 10 times — confirm visible variation
3. Verify dock edge still bridgeable
4. Open chests — confirm loot table
5. Tune probabilities in 5% steps (small changes are loud)

Disable processors while debugging layout (`disableprocessors` style flags in CommandStructures).

---

## Pitfalls

- **Rule order** can make later rules never fire
- **Too much `block_rot`** deletes walkable floor
- **`gravity` in void** misplaces pieces
- Oxidizing **waxed** copper does nothing useful — use unwaxed in templates
- Processors do not replace the need for a **guaranteed first quest wreck**

---

## Fit to Suspended Engine

Decay should say: *this was an engine deck like yours, then it failed.*

Prefer:
- missing plates
- oxidized copper veins
- cracked stone spine
- dead core variants

Avoid:
- random wool/terracotta chaos
- dungeon cobble aesthetic with no machine read

Related: `docs/PROCEDURAL_WRECKS.md`, `docs/ENGINE_DECK_0_LAYOUT.md`
