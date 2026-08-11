# Suspended Engine status datapack (Phase 1B)

Soft enforcement prototype:

- scoreboard `engine_power` 0–100
- actionbar status: BLACKOUT / CRITICAL / STABLE
- drain over time
- `/function suspended_engine:feed_5` and `feed_20` for testing rewards

## Install in a test instance

1. Copy this folder to `saves/<world>/datapacks/suspended_engine_status/`
2. `/reload`
3. `/scoreboard players set @p engine_power 50`
4. Watch actionbar
5. Wire quest rewards to run feed functions later

## Notes

- `tick.mcfunction` must be scheduled or added to a tick tag compatible with your exact 1.21.1 datapack setup. Verify function tag paths for your mappings (`function` vs `functions`).
- This is a prototype, not final production logic.
- Replace with Create-linked or KubeJS core when ready.
