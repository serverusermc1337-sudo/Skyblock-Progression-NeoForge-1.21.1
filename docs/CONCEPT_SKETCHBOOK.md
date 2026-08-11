# Suspended Engine — Concept Sketchbook

**Pack identity:** Your island is an engine. If it dies, you fall.

This sketchbook is the art/design bible for mood, spaces, and player fantasy. Use it when building Engine Deck 0, wrecks, UI copy, and quest wording.

---

## Plate 01 — Title / Logline

**Title:** SUSPENDED ENGINE  
**Logline:** A skyblock about keeping a broken hull in the air long enough to steal the next wreck.

**Tone words:** industrial, precarious, hopeful, salvage, kinetic, cold void, warm core-light

**Not this:** cute cottage island, tropical paradise, pure magic academy, ground-based factory pack

---

## Plate 02 — Engine Deck 0 (Spawn)

**What the player sees first**

A 9×9 damaged aerial platform hanging over infinite void. Smooth stone and stone brick underhull. Iron spine. Copper coils around a dark lodestone core. One planter with a single sapling. A dead blast-furnace fuel unit. A scrap barrel. A chest. No grass meadow. No village. No safety net.

**Camera:** three-quarter view from slightly above, void below, thin cloud band in distance.

**Key props**
- Levitation core (center)
- Antenna / end-rod spar
- Corner iron posts
- Planter (life support)
- Starter chest

**Player feeling:** "I am on a machine that almost failed."

---

## Plate 03 — The Core (BLACKOUT → STABLE)

**BLACKOUT**
- Core is matte, cold, no glow
- Actionbar / UI in red
- Deck feels heavier, quieter

**CRITICAL**
- Core pulses weak amber
- Warning rhythm
- Player should stop expanding

**STABLE**
- Core holds a steady cyan/white engine light
- Soft hum implied by particles/light
- Work is allowed

**Art rule:** Power state must be readable at a glance from the core alone.

---

## Plate 04 — Secure the Rim

Player placing walls/slabs on the perimeter while void yawns underfoot. Tools primitive. Core faintly lit behind them.

**Story beat:** Most crews die to falling, not to combat.

---

## Plate 05 — Dedicated Feed

Create-style kinetic line or early burn feed running toward the core: shaft, cog, furnace engine, or hand crank. Cables/pipes as readable "veins."

**Story beat:** Panic power becomes a system.

---

## Plate 06 — First Wreck on the Horizon

Far off: a tilted derelict deck, broken spars, cargo crate glowing weakly. Player on Deck 0 using a spyglass. Distance should feel dangerous.

**Story beat:** Exploration is docking, not walking across biomes.

---

## Plate 07 — Dock Without Brownout

Close approach. Temporary bridge, hook, or gangway. Core status must stay STABLE mid-action. One mistake = abort.

**Story beat:** Skill check against your own power budget.

---

## Plate 08 — Scavenge

Interior of a wreck crate bay: hull plates, coiled copper, cracked battery cells, log fragments. Not a vanilla dungeon chest room.

**Loot fantasy:** parts for the engine civilization, not random swords first.

---

## Plate 09 — Industry Afloat (Midgame)

Deck expanded into a layered machine: Create factory lines, fuel loops, storage wall, still visibly an aircraft-hull base. Void always present in the frame.

**Rule:** If the screenshot could be a ground factory with the void cropped out, it fails.

---

## Plate 10 — Bastion (Endgame)

A permanent sky-fortress that no longer panics about fuel every minute — but still looks engineered, not like a floating castle copied from fantasy packs. Multiple decks, stabilizers, dock arms, lit core cathedral.

**Player feeling:** "We did not find land. We became the land."

---

## Color script

| Element | Color |
|---------|--------|
| Void | near-black blue |
| Hull | cool gray, stone, iron |
| Copper veins | muted orange/green patina |
| Core BLACKOUT | dead charcoal |
| Core STABLE | cold cyan / white |
| Warning | amber |
| Life (sapling) | single green accent |
| Wreck lights | weak yellow |

---

## UI / quest copy voice

Write like a damaged operations manual:

- "Feed the core."
- "Hold STABLE."
- "Abort dock on brownout."
- "Bring the salvage home."

Avoid:
- "Have fun adventurer!"
- "Welcome to your cozy island!"

---

## Production checklist for builders

- [ ] Spawn reads as machine in first 3 seconds
- [ ] Core state readable without UI
- [ ] Void visible in most key screenshots
- [ ] Wrecks look related to the same tech language as Deck 0
- [ ] Midgame still looks airborne
- [ ] Quest text matches this voice

---

## Related implementation docs

- `docs/IDENTITY.md`
- `docs/ENGINE_DECK_0_LAYOUT.md`
- `docs/STABILITY_RULE.md`
- `docs/QUEST_TREE_DESIGN.md`
