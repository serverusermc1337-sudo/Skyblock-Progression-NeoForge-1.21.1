# Troubleshooting — Skyblock Progression

## Instance will not launch
- Confirm NeoForge 1.21.1, not Forge/Fabric
- Raise RAM to 10–16 GB
- Remove last batch of mods
- Read `logs/latest.log`

## Empty quest book
- Copy full `config/ftbquests` directory into the instance
- Restart game, then `/ftbquests reload`
- `/ftbquests editing_mode true` to verify chapters exist

## No skyblock island
This repo is progression/quest focused. Add a skyblock world/map/gen solution separately and test quests on a void/superflat platform if needed.

## Export zip nearly empty
You have not added mods through Packwiz yet. That is expected in early development.

## Economy broken after adding one mod
Resource duplication mods can skip entire skyblock chapters. Test economy after every generator-style mod.

## Isolation order
1. NeoForge + FTB Quests only
2. Add quest config
3. Add resource-gen backbone
4. Add automation
5. Only then expand outward
