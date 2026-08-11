# Questline art & chapter backgrounds

## How it should look

| Chapter | Mood | Background file |
|---------|------|-----------------|
| **Cold Start** | Red emergency, blackout risk | `bg_cold_start.png` |
| **Stabilize** | Cyan core, calm control | `bg_stabilize.png` |
| **Wreck Protocol** | Fog void, distant hulk | `bg_wreck_protocol.png` |
| **Industry Afloat** | Dense factory deck | `bg_industry_afloat.png` |
| **Bastion** | Endgame aerial fortress | `bg_bastion.png` |
| Overview map | Full questline diagram | `questline_overview.png` |

Default void backdrop: `bg_default.png`

## Install (resource pack)

1. Download **`SuspendedEngineQuestArt.zip`** from this repo releases / artifacts (or build from `resourcepacks/SuspendedEngineQuestArt`).
2. Put the zip (or extracted folder) in the instance `resourcepacks/` folder.
3. Enable **Suspended Engine Quest Art** in the resource pack list (above default).
4. Copy updated `config/ftbquests` from this repo.
5. `/ftbquests reload`

Texture paths used by chapter SNBT:

```
suspended_engine:textures/quest/backgrounds/bg_cold_start.png
suspended_engine:textures/quest/backgrounds/bg_stabilize.png
suspended_engine:textures/quest/backgrounds/bg_wreck_protocol.png
suspended_engine:textures/quest/backgrounds/bg_industry_afloat.png
suspended_engine:textures/quest/backgrounds/bg_bastion.png
```

## FTB Quests wiring

Each chapter SNBT includes an `images` entry that draws the matching background behind the quest graph.

If a background does not appear:
- Confirm resource pack is enabled
- Confirm path matches exactly (namespace `suspended_engine`)
- Adjust `width` / `height` / `x` / `y` in editing mode

## Art direction

- Cold Start = danger / blackout
- Stabilize = power restored
- Wrecks = salvage horizon
- Industry = machine civilization
- Bastion = we became the land

Do not use bright grassy island art for these pages.
