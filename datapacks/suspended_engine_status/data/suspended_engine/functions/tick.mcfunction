# Slow drain and status display. Call from a tick/schedule loop in your instance once wired.
# This file is a template for Phase 1B — wire via #minecraft:tick tag or schedule.

scoreboard players add @a engine_timer 1
execute as @a[scores={engine_timer=100..}] run function suspended_engine:drain
execute as @a[scores={engine_timer=100..}] run scoreboard players set @s engine_timer 0
execute as @a run function suspended_engine:show_status
