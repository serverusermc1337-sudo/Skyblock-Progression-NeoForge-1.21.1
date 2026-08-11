# Power / Stability Rule — Suspended Engine

This is the mechanical heart of the pack. Implement it in layers. Do not wait for a perfect custom mod on day one.

## Design goal

The player always understands:

1. The deck has a **power budget**
2. The deck has a **stability state**
3. Bad state has **consequences**
4. Good state unlocks **capabilities**

## States

| State | Meaning | Player-facing effect |
|-------|---------|----------------------|
| **BLACKOUT** | Core unpowered | Void threat high, no docking, quests blocked |
| **CRITICAL** | Power below threshold | Screen warnings, occasional instability events |
| **STABLE** | Power within safe band | Normal work allowed |
| **OVERCLOCK** | Optional later | Extra output, higher fuel drain |

Early game only needs BLACKOUT / CRITICAL / STABLE.

## Recommended implementation ladder

### Phase 0 — Quest fiction (ship now)
- Quests *say* the rule
- Player manually confirms power steps with checkmarks
- No real sinking code yet
- Good enough to test fantasy and pacing

### Phase 1 — Soft enforcement (first real version)
Use one of:

**A. Create-native**
- Core is near a required kinetic network
- A visible stress/speed setup represents "alive"
- Quests check for specific Create items/blocks built

**B. Scoreboard + scheduled function (datapack)**
- `engine_power` score 0–100
- Player actions / quest rewards add power
- Time or idle drain reduces power
- At 0: apply wither/nausea, disable flight items, or teleport warning
- At stable threshold: allow wreck quest line

**C. KubeJS / custom logic (best long-term)**
- Block entity or fake "core" block
- Tick check for adjacent energy/kinetic inputs
- Emit status to actionbar: `Deck Status: STABLE (72%)`

### Phase 2 — Hard enforcement
Pick consequences that are fair:

**Preferred early consequences**
- Actionbar warnings every N seconds while CRITICAL
- Mining fatigue / slowness pulses
- Docking quests locked
- Occasional "brownout" that extinguishes furnaces / stops Create processing nearby

**Avoid early**
- Instant void death with no warning
- Deleting the whole platform
- Soft-locking with no recovery item

**Later hard mode**
- Slow downward drift (teleport deck entities down 1 block over time) only if you can also provide emergency boost items
- Structural damage events (random block breaks on unprotected rim)

## Power sources (fiction → systems)

Map fiction to real pack systems:

| Fiction | Early real system |
|---------|-------------------|
| Hand crank | Player must build first Create hand crank / water wheel / millstone chain |
| Scrap burn | Furnace generator / early Create furnace engine equivalent |
| Stabilizer coils | Place N copper/iron blocks in pattern, quest-checked |
| Wreck batteries | Loot items that add temporary power score |
| Autonomous loop | Fully automatic Create + fuel line |

## Stability budget vs expansion

Every expansion should cost stability unless upgraded:

- +1 platform section → requires +1 stabilizer or +X power capacity
- Quests gate "Deck Expansion" behind STABLE for several minutes
- Optional: count platform blocks; if size > capacity, force CRITICAL

## UI requirements

Players must see status without reading a wiki.

Minimum:
- Quest descriptions state the rule
- Actionbar or bossbar: `Engine: STABLE 64/100`
- One item or block that shows help text (logbook)

## Acceptance tests

1. New player can explain the rule after quest 3
2. Ignoring power makes the game worse within 2 minutes
3. Restoring power makes the game better immediately
4. No soft-lock without a documented recovery path
5. First wreck requires STABLE, not just "have 64 cobble"

## Decision for v0.1

Ship **Phase 0 + Phase 1B**:
- Full quest fiction
- Scoreboard `engine_power`
- Drain + feed functions
- Actionbar status
- No literal island deletion yet

When that feels good, upgrade to Create-linked or KubeJS core.
